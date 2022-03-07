use std::env;

//use llvmir_to_m4_cycles::IrToM4;
mod ktest_parser;
mod llvmir_to_m4_cycles;
mod tests;
mod llvmir_labeler;
mod block_calculator;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let mut dir = env::current_dir().unwrap();
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
    }
  
    let mut dir2 = env::current_dir().unwrap();
    dir2.push("src");
    dir2.push("llvmir_labeler");
    dir2.push("test_cases");
    let mut labeler = llvmir_labeler::Labeler::new();
    let replaced_string = labeler.label_file(&dir2, "assembly.ll").unwrap();
    //println!("{}", replaced_string);
    labeler.save_file(&dir2, "assembly.ll", replaced_string);


    let mut dir4 = env::current_dir().unwrap();
    dir4.push("src");
    dir4.push("ktest_parser");
    dir4.push("test_cases");
    dir4.push("getsign");
    let labels = ktest_parser::read_labels(dir4).unwrap();

    let mut dir3 = env::current_dir().unwrap();
    dir3.push("src");
    dir3.push("llvmir_labeler");
    dir3.push("test_cases");
    let mut bc = block_calculator::BlockCalculator::new();
    bc.analyze_file_block_structure(&dir3, "assembly_labeled.s");

    labeler.print_map();

    let path_labels = &labels[0].labels;
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
        }
        path_labels_renamed.push((pl.0.clone(), "initial_fn_block".to_string()));
    }

    path_labels_renamed.reverse();

    for pl in &path_labels_renamed {
        println!("{:?}", pl);
    }

    bc.solve_control_flow(path_labels_renamed);

}