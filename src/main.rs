use std::{env, path::PathBuf, process::Command, fs};
use clap::Arg;
use clap::Command as App;
use llvmir_to_m4_cycles::cortex_m4;
use regex::Regex;

//use llvmir_to_m4_cycles::IrToM4;
mod ktest_parser;
mod llvmir_to_m4_cycles;
mod tests;
mod llvmir_labeler;
mod block_calculator;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    /*let mut dir = env::current_dir().unwrap();
    dir.push("src");
    dir.push("ktest_parser");
    dir.push("test_cases");
    dir.push("getsign");
    let ktests = llvmir_to_m4_cycles::IrToM4::read_dir(dir.clone()).unwrap();
    for ktest in ktests {
        let (name,ir_to_m4_vec) = ktest;
        let mut sum_upper = 0;
        let mut sum_lower = 0;
        for ir_to_m4 in ir_to_m4_vec {
            sum_upper += ir_to_m4.clone().get_upper(3, 1, 1);
            sum_lower += ir_to_m4.get_lower(0,1,1);
        }
        println!("{:?} lower: {:?}, upper: {:?}",name,sum_lower,sum_upper);
    }
    let things = ktest_parser::read_ktests(dir).unwrap();

    for thing in things {
        println!("{:?}", thing);
    }*/

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
                .help("Analyze a c program"),
        )
        .arg(
            Arg::new("rust")
                .long("rust")
                .takes_value(true)
                .value_name("BINARY_NAME")
                .conflicts_with("c")
                .help("Analyze a rust program"),
        )
        .arg(
            Arg::new("optimize")
                .long("optimize")
                .short('o')
                .help("Analyze optimized IR and assembly"),
        )
        .arg(
            Arg::new("only-output-states-covering-new")
                .long("only-output-states-covering-new")
                .short('n')
                .help("Only analyze test cases covering new code"),
        )
        .get_matches();

    let is_c_program = matches.is_present("c");
    let is_rust_program = matches.is_present("rust");
    let optimize = matches.is_present("optimize");
    let new = matches.is_present("only-output-states-covering-new");

    if is_c_program {
        println!("Analyzing c program: {}", matches.value_of("c").unwrap());
        analyze_c_program(matches.value_of("c").unwrap().to_string(), optimize, new);
        return;
    }
    else if is_rust_program {
        println!("Analyzing rust program: {}", matches.value_of("rust").unwrap());
        analyze_rust_program(matches.value_of("rust").unwrap().to_string(), optimize, new);
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


fn analyze_rust_program(bin_name: String, opt: bool, new: bool) {
    let mut dir = env::current_dir().unwrap();
    if !dir.join("Cargo.toml").exists() {
        println!("Could not find Cargo.toml file in current directory");
        return;
    }
    let mut cargo_klee = Command::new("cargo");
    cargo_klee.arg("klee");

    if opt {
        cargo_klee.arg("--release");
    }

    cargo_klee.args(["--bin", &bin_name]);
    cargo_klee.status().expect("Failed to run cargo klee.");

    if !dir.join(".cargo").exists() {
        Command::new("mkdir")
        .arg(".cargo")
        .status()
        .expect("Could not create directory .cargo");
    }

    let config_file_path = dir.join(".cargo").join("config");
    fs::write(&config_file_path, format!("{}\n{}", "[build]", r#"target = "thumbv7em-none-eabihf""#)).expect("Could not write to config file");

    let mut cargo = Command::new("cargo");
    cargo.arg("rustc");
    cargo.args(["--bin", &bin_name]);

    if opt {
        cargo.arg("--release");
    }

    cargo.args(["--features", "klee-analysis", "-v", "--color=always", "--", "-C", "linker=true", "--emit=llvm-ir"]);

    cargo.status().expect("Could not run cargo rustc");

    fs::write(&config_file_path, "").expect("Could not clear config file");

    let path_to_label_files;
    let path_to_ll_file;

    if opt {
        path_to_label_files = dir.join("target/release/deps/klee-last");
        //path_to_ll_file = dir.join("target/release/deps");
        path_to_ll_file = dir.join("target/thumbv7em-none-eabihf/release/deps");
    }
    else {
        path_to_label_files = dir.join("target/debug/deps/klee-last");
        //path_to_ll_file = dir.join("target/debug/deps");
        path_to_ll_file = dir.join("target/thumbv7em-none-eabihf/debug/deps");
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

    println!("{}", ll_file_name);

    if ll_file_name == "".to_string() {
        panic!("Could not find .ll file.");
    }

    run_labeler_and_bc(&path_to_ll_file, ll_file_name, &path_to_label_files)
}

fn analyze_c_program(file_name: String, opt: bool, new: bool) {
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
    run_labeler_and_bc(&dir, "assembly.ll".to_string(), &dir)
}

fn check_block_structure(path: &PathBuf, file_name: String) {
    let mut bc = block_calculator::BlockCalculator::new();
    bc.analyze_file_block_structure(path, &file_name);
    bc.assert_analyzable_block_structure();
}

fn run_labeler(path: &PathBuf, file_name: String) {
    //Run the labeling tool
    let mut labeler = llvmir_labeler::Labeler::new();
    let _replaced_string = labeler.label_file(path, &file_name).unwrap();
    labeler.save_file(path, &file_name);
}

fn run_labeler_and_bc(path: &PathBuf, file_name: String, path_to_label_files: &PathBuf) {
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
    let mut bc = block_calculator::BlockCalculator::new();
    bc.analyze_file_block_structure(path, &labeled_asm_file_name);

    //labeler.print_map();

    //let path_labels = &labels[0].labels;
    let mut label_file_count = 0;
    println!("paths to analyze: {}", labels.len());
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
            let rust_mangle_split: Vec<&str> = pl.0.split("17h").collect();
            if rust_mangle_split.len() == 2 {
                fn_name = rust_mangle_split[0].to_string();
            }
            else {
                fn_name = pl.0;
            }

            if !bc.fn_map.contains_key(&fn_name) {
                panic!("could not find function: {}", fn_name);
            }

            let fn_nr = bc.fn_map.get(&fn_name).unwrap();
            let percent_removed = &pl.1[1..pl.1.len()];
            let label_number = percent_removed.parse::<u32>();
            if label_number.is_ok() {
                //if labeler has replaced the number with a new label, push that instead
                if labeler.label_map.contains_key(&(label_number.clone().unwrap().to_string(), *fn_nr)) {
                    let block_name = labeler.label_map.get(&(label_number.unwrap().to_string(), *fn_nr)).unwrap().to_string();
                    path_labels_renamed.push((fn_name, block_name.clone()));
                    continue;
                }
                //A number name which has not been replaced has to be the initial block
                else {
                    path_labels_renamed.push((fn_name, "initial_fn_block".to_string()));
                }
            }
            //Label already had a name before the labeling tool
            else {
                path_labels_renamed.push((fn_name, pl.1));
            }
        }

        path_labels_renamed.reverse();

        /*println!("printing path_labels for file: {}", l.file_name);

        for pl in &path_labels_renamed {
            println!("{:?}", pl);
        }*/

        bc.solve_control_flow(path_labels_renamed);

        println!("Estimated cycles: {}", bc.cycles);
        println!("paths run: {}", label_file_count);
    }
}