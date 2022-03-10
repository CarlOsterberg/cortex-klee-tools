use std::{env, path::PathBuf};

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
  
    let mut dir2 = env::current_dir().unwrap();
    dir2.push("src");
    dir2.push("llvmir_labeler");
    dir2.push("test_cases");

    let mut dir4 = env::current_dir().unwrap();
    dir4.push("src");
    dir4.push("ktest_parser");
    dir4.push("test_cases");
    dir4.push("regexp");

    run_labeler_and_bc(&dir2, "assembly_reg_ex.ll".to_string(), &dir4);
    //run_labeler(&dir2, "rust_arm_assembly.ll".to_string());

}

pub fn run_labeler(path: &PathBuf, file_name: String) {
    //Run the labeling tool
    let mut labeler = llvmir_labeler::Labeler::new();
    let _replaced_string = labeler.label_file(path, &file_name).unwrap();
    labeler.save_file(path, &file_name);
}

pub fn run_labeler_and_bc(path: &PathBuf, file_name: String, path_to_label_files: &PathBuf) {
    //Run the labeling tool
    let mut labeler = llvmir_labeler::Labeler::new();
    let _replaced_string = labeler.label_file(path, &file_name).unwrap();
    labeler.save_file(path, &file_name);

    //Read the label files
    let labels = ktest_parser::read_labels(path_to_label_files).unwrap();

    //Analyze labeled file with BlockCalculator
    let mut bc = block_calculator::BlockCalculator::new();
    let file_name_split: Vec<&str> = file_name.split(".").collect();
    let labeled_file_name = format!("{}_labeled.s", file_name_split[0]);
    bc.analyze_file_block_structure(path, &labeled_file_name);

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
            let fn_nr = bc.fn_map.get(&pl.0).unwrap();
            let percent_removed = &pl.1[1..pl.1.len()];
            let label_number = percent_removed.parse::<u32>();
            if label_number.is_ok() {
                //if labeler has replaced the number with a new label, push that instead
                if labeler.label_map.contains_key(&(label_number.clone().unwrap().to_string(), *fn_nr)) {
                    let block_name = labeler.label_map.get(&(label_number.unwrap().to_string(), *fn_nr)).unwrap().to_string();
                    path_labels_renamed.push((pl.0.clone(), block_name.clone()));
                    continue;
                }
                //A number name which has not been replaced has to be the initial block
                else {
                    path_labels_renamed.push((pl.0.clone(), "initial_fn_block".to_string()));
                }
            }
            //Label already had a name before the labeling tool
            else {
                path_labels_renamed.push(pl.clone());
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