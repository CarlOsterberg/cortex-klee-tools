use std::cmp::Ordering;
use std::collections::HashSet;
use std::fs::File;
use std::io::Write;
use std::{env, path::PathBuf, process::Command, fs};
use clap::Arg;
use clap::Command as App;
use regex::Regex;
use rustc_demangle::demangle;

use crate::settings::Settings;

//use llvmir_to_m4_cycles::IrToM4;
mod ktest_parser;
mod llvmir_to_m4_cycles;
mod tests;
mod llvmir_labeler;
mod block_calculator;
mod settings;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let matches = App::new("cortex-klee-tools")
        .version("0.0.1")
        .author("Lulea University of Technology (LTU)")
        .about("Static WCET analysis tools for Cortex-M4")
        .arg(
            Arg::new("c")
                .long("c")
                .takes_value(true)
                .value_name("FILE_NAME")
                .conflicts_with("rust")
                .conflicts_with("rust-ex")
                .help("Analyze a c program"),
        )
        .arg(
            Arg::new("rust")
                .long("rust")
                .takes_value(true)
                .value_name("BINARY_NAME")
                .conflicts_with("c")
                .conflicts_with("rust-ex")
                .help("Analyze a rust program"),
        )
        .arg(
            Arg::new("rust-ex")
                .long("rust-example")
                .takes_value(true)
                .value_name("EXAMPLE_BINARY_NAME")
                .conflicts_with("c")
                .conflicts_with("rust")
                .help("Analyze a rust program example binary"),
        )
        .arg(
            Arg::new("optimize")
                .long("optimize")
                .short('o')
                .help("Analyze optimized IR and assembly (Always true for rust)"),
        )
        .arg(
            Arg::new("only-output-states-covering-new")
                .long("only-output-states-covering-new")
                .short('n')
                .help("Only analyze test cases covering new code"),
        )
        .arg(
            Arg::new("verbose")
                .long("verbose")
                .short('v')
                .help("Print out debug information"),
        )
        .get_matches();

    let is_c_program = matches.is_present("c");
    let is_rust_program = matches.is_present("rust");
    let is_rust_ex_program = matches.is_present("rust-ex");
    let optimize = matches.is_present("optimize");
    let new = matches.is_present("only-output-states-covering-new");
    let verbose = matches.is_present("verbose");

    if is_c_program {
        println!("Analyzing c program: {}", matches.value_of("c").unwrap());
        analyze_c_program(matches.value_of("c").unwrap().to_string(), optimize, new, verbose);
        return;
    }
    else if is_rust_program {
        println!("Analyzing rust program: {}", matches.value_of("rust").unwrap());
        analyze_rust_program(matches.value_of("rust").unwrap().to_string(), true, new, verbose, false);
    }
    else if is_rust_ex_program {
        println!("Analyzing rust program: {}", matches.value_of("rust-ex").unwrap());
        analyze_rust_program(matches.value_of("rust-ex").unwrap().to_string(), true, new, verbose, true);
    }
  
    /*let mut dir2 = env::current_dir().unwrap();
    dir2.push("src");
    dir2.push("llvmir_labeler");
    dir2.push("test_cases");

    let mut dir4 = env::current_dir().unwrap();
    dir4.push("src");
    dir4.push("ktest_parser");
    dir4.push("test_cases");
    dir4.push("rustarm");

    run_labeler_and_bc(&dir2, "rust_arm_assembly.ll".to_string(), &dir4);*/
    //run_labeler(&dir2, "rust_arm_assembly.ll".to_string());
    //check_block_structure(&dir2, "rust_arm_assembly_labeled.s".to_string());
}


fn analyze_rust_program(bin_name: String, opt: bool, _new: bool, verbose: bool, example: bool) {
    let dir = env::current_dir().unwrap();
    if !dir.join("Cargo.toml").exists() {
        println!("Could not find Cargo.toml file in current directory");
        return;
    }

    if !dir.join(".cargo").exists() {
        Command::new("mkdir")
        .arg(".cargo")
        .status()
        .expect("Could not create directory .cargo");
    }

    let config_file_path = dir.join(".cargo").join("config");
    fs::write(&config_file_path, format!("{}\n{}", "[build]", r#"target = "thumbv7em-none-eabihf""#)).expect("Could not write to config file");


    let mut cargo_klee = Command::new("cargo");
    cargo_klee.arg("klee");

    if opt {
        cargo_klee.arg("--release");
    }

    if example {
        cargo_klee.args(["--example", &bin_name]);
    }
    else {
        cargo_klee.args(["--bin", &bin_name]);  
    }
    cargo_klee.status().expect("Failed to run cargo klee."); 

    let mut path_to_label_files;
    let mut path_to_ll_file;

    if opt {
        path_to_label_files = dir.join("target/thumbv7em-none-eabihf/release");
        path_to_ll_file = dir.join("target/thumbv7em-none-eabihf/release");
    }
    else {
        path_to_label_files = dir.join("target/thumbv7em-none-eabihf/debug");
        path_to_ll_file = dir.join("target/thumbv7em-none-eabihf/debug");
    }

    if example {
        path_to_label_files.push("examples/klee-last");
        path_to_ll_file.push("examples/klee-last");
    }
    else {
        path_to_label_files.push("deps/klee-last");
        path_to_ll_file.push("deps/klee-last");
    }
    
    let mut ll_file_name = "".to_string();

    let dir_read = path_to_ll_file.read_dir().expect("Could not read directory with .ll file");
    for file in dir_read {
        let file_name_ostr = file.expect("Error reading file.").file_name();
        let file_name = file_name_ostr.to_str().expect("Could not convert file name to &str");
        let validator = Regex::new(r".+[.]ll").unwrap();
        let anti_validator = Regex::new(r"_labeled.ll").unwrap();
        if validator.is_match(file_name) && !anti_validator.is_match(file_name) {
            ll_file_name = format!("{}", file_name);
        }
    }
    run_ir_to_cycles(path_to_label_files.clone());

    if ll_file_name == "".to_string() {
        panic!("Could not find .ll file.");
    }

    let settings = Settings::new(true, verbose);
    run_labeler_and_bc(&path_to_ll_file, ll_file_name, &path_to_label_files, settings);
}

fn analyze_c_program(file_name: String, opt: bool, new: bool, verbose: bool) {
    //TODO: fix include directory, can only be run in examples directory
    Command::new("clang")
        .args(["-I../../include", "-emit-llvm", "-c", "-g", "-O0", "-Xclang", "-disable-O0-optnone", &file_name])
        .status()
        .expect("Failed to run clang.");

    let split: Vec<&str> = file_name.split(".").collect();
    let bc_file_name = format!("{}.bc", split[0]);

    let mut klee = Command::new("klee");
    if opt {
        klee.arg("--optimize");
    }
    if new {
        klee.arg("--only-output-states-covering-new");
    }

    klee.arg(&bc_file_name);
    klee.status().expect("Failed to run KLEE.");

    let mut dir = env::current_dir().unwrap();
    dir.push("klee-last");
    run_ir_to_cycles(dir.clone());
    let settings = Settings::new(false, verbose);
    run_labeler_and_bc(&dir, "assembly.ll".to_string(), &dir, settings)
}


#[allow(dead_code)]
fn run_labeler(path: &PathBuf, file_name: String) {
    //Run the labeling tool
    let mut labeler = llvmir_labeler::Labeler::new();
    let _replaced_string = labeler.label_file(path, &file_name).unwrap();
    labeler.save_file(path, &file_name);
}

fn run_labeler_and_bc(path: &PathBuf, file_name: String, path_to_label_files: &PathBuf, settings: Settings) {
    //Run the labeling tool
    let mut labeler = llvmir_labeler::Labeler::new();
    let _replaced_string = labeler.label_file(path, &file_name).unwrap();
    labeler.save_file(path, &file_name);

    let file_name_split: Vec<&str> = file_name.split(".").collect();
    let labeled_asm_file_name = format!("{}_labeled.s", file_name_split[0]);
    let labeled_file_name = format!("{}_labeled.ll", file_name_split[0]);

    //Read the label files
    let labels = ktest_parser::read_labels(path_to_label_files).unwrap();


    let path_clone = path.clone();
    Command::new("llc")
        .args(["-mtriple=arm-none-eabihf","-mattr=armv7e-m","-mcpu=cortex-m4", path_clone.join(labeled_file_name).to_str().unwrap()])
        .status()
        .expect("Failed to compile labeled IR file.");

    println!("Compiled to assembly.");

    //Analyze labeled file with BlockCalculator
    let mut bc = block_calculator::BlockCalculator::new(settings.clone());
    bc.analyze_file_block_structure(path, &labeled_asm_file_name);

    //labeler.print_map();

    let mut label_set = HashSet::new();

    for l in &labels {
        let path_labels = &l.labels;
        for pl in path_labels {
            let fn_name;
            if settings.rust {
                //Demangle and remove hash
                fn_name = format!("{:#}", demangle(&pl.0.clone()))
            }
            else {
                fn_name = pl.0.clone();
            }
            
            let fn_nr = bc.fn_map.get(&fn_name).unwrap();
            let percent_removed = &pl.1[1..pl.1.len()];
            let label_number = percent_removed.parse::<u32>();
            if label_number.is_ok() {
                //if labeler has replaced the number with a new label, push that instead
                if labeler.label_map.contains_key(&(label_number.clone().unwrap().to_string(), *fn_nr)) {
                    let block_name = labeler.label_map.get(&(label_number.unwrap().to_string(), *fn_nr)).unwrap().to_string();
                    label_set.insert((fn_name.clone(), block_name.clone()));
                    continue;
                }
                //A number name which has not been replaced has to be the initial block
                else {
                    label_set.insert((fn_name.clone(), "initial_fn_block".to_string()));
                }
            }
            //Label already had a name before the labeling tool
            else {
                label_set.insert((fn_name.clone(), pl.1.clone()));
            }
        }
    }


    bc.set_label_set(label_set);

    //let path_labels = &labels[0].labels;
    let mut label_file_count = 0;
    println!("paths to analyze: {}", labels.len());
    let mut cycles_results = Vec::new();
    for l in labels {
        let path_labels = l.labels;
        if path_labels[path_labels.len() - 1].0 != "main".to_string() {
            println!("skipping path which crashes in file: {}", l.file_name);
            continue;
        }
        label_file_count += 1;
        let mut path_labels_renamed = Vec::new();

        for pl in path_labels {

            let fn_name;
            if settings.rust {
                fn_name = format!("{:#}", demangle(&pl.0));
            }
            else {
                fn_name = pl.0;
            }

            let fn_nr = bc.fn_map.get(&fn_name).unwrap();
            let percent_removed = &pl.1[1..pl.1.len()];
            let label_number = percent_removed.parse::<u32>();
            if label_number.is_ok() {
                //if labeler has replaced the number with a new label, push that instead
                if labeler.label_map.contains_key(&(label_number.clone().unwrap().to_string(), *fn_nr)) {
                    let block_name = labeler.label_map.get(&(label_number.unwrap().to_string(), *fn_nr)).unwrap().to_string();
                    path_labels_renamed.push((fn_name, block_name.clone(), pl.2));
                    continue;
                }
                //A number name which has not been replaced has to be the initial block
                else {
                    path_labels_renamed.push((fn_name, "initial_fn_block".to_string(), pl.2));
                }
            }
            //Label already had a name before the labeling tool
            else {
                path_labels_renamed.push((fn_name, pl.1, pl.2));
            }
        }

        path_labels_renamed.reverse();

        /*println!("printing path_labels for file: {}", l.file_name);

        for pl in &path_labels_renamed {
            println!("{:?}", pl);
        }*/

        let cycles = bc.solve_control_flow(path_labels_renamed);

        println!("file: {}", l.file_name);
        println!("paths run: {}", label_file_count);

        //let split: Vec<&str> = l.file_name.split(".").collect();
        //let cycle_file_name = format!("{}.cycles", split[0]);
        //fs::write(path.join(cycle_file_name), format!("Calculated cycles (bc): {}\n", bc.cycles)).expect("could not save cycles to file");
        cycles_results.push((l.file_name, cycles.0, cycles.1));
    }

    cycles_results.sort_by(|a, b| ktest_ord(a.0.clone(),b.0.clone()));
    let mut filename = path.clone();
    filename.push("Blocks.result");
    let mut result_file = File::create(filename).expect("Couldn't create output file for block calculation");
    cycles_results.sort_by(|a, b| ktest_ord(a.0.clone(),b.0.clone()));
    for cycles_result in cycles_results {
        //Path could not be solved
        if cycles_result.1 == u64::MAX {
            continue;
        }
        let s = format!("{:?} lower: {:?}, upper: {:?}\n",cycles_result.0, cycles_result.1, cycles_result.2);
        result_file.write_all(s.as_bytes()).unwrap();
    }

}

fn run_ir_to_cycles(ktest_location: PathBuf) {
    match llvmir_to_m4_cycles::IrToM4::read_dir(ktest_location.clone()) {
        Ok(mut ktests) => {
            let mut filename = ktest_location.clone();
            filename.push("IrToCycles.result");
            let mut result_file = File::create(filename).expect("Couldn't create output file for LLVM IR to cycles calculation");
            ktests.sort_by(|a, b| ktest_ord(a.0.clone(),b.0.clone()));
            for ktest in ktests {
                let (name,ir_to_m4_vec) = ktest;
                let mut sum_upper = 0;
                let mut sum_lower = 0;
                for ir_to_m4 in ir_to_m4_vec {
                    sum_upper += ir_to_m4.clone().get_upper(3, 1, 1);
                    sum_lower += ir_to_m4.get_lower(0,1,1);
                }
                let s = format!("{:?} lower: {:?}, upper: {:?}\n",name,sum_lower,sum_upper);
                result_file.write_all(s.as_bytes()).unwrap();
                print!("{}", s);

            }
        },
        Err(msg) => println!("{}", msg),
    }
}

fn ktest_ord(t: String, e: String) -> Ordering {
    let t_num = get_ktest_num(t.clone()).unwrap();
    let e_num = get_ktest_num(e.clone()).unwrap();
    if t_num > e_num {
        Ordering::Greater
    }
    else if t_num < e_num {
        Ordering::Less
    }
    else {
        Ordering::Equal
    }
}

fn get_ktest_num(ktest: String) -> Option<u32> {
    let validator = Regex::new("test0*[0-9]+[.][a-z]+").unwrap();
    if validator.is_match(&ktest) {
        let s = ktest.clone();
        let prefix = s.split(".").into_iter().next()?;
        let num_w_pad = &prefix[4..];
        let num_string = remove_zero_padding(num_w_pad);
        let num = num_string.parse::<u32>().unwrap();
        Some(num)
    }
    else {
        None
    }
}

fn remove_zero_padding(s:&str) -> String {
    let chars = s.chars();
    let mut result = "".to_string();
    for char in chars {
        if char == '0' && result == "" {
            continue;
        }
        result += &std::string::String::from(char);
    }
    result
}