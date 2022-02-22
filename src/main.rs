use std::env;

use llvmir_to_m4_cycles::IrToM4;
mod ktest_parser;
mod llvmir_to_m4_cycles;
mod tests;
mod llvmir_labeler;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let mut dir = env::current_dir().unwrap();
    dir.push("src");
    dir.push("ktest_parser");
    dir.push("test_cases");
    dir.push("getsign");
    let ktests = llvmir_to_m4_cycles::IrToM4::read_dir(dir).unwrap();
    for ktest in ktests {
        let (name,ir_to_m4_vec) = ktest;
        let mut sum_upper = 0;
        let mut sum_lower = 0;
        for ir_to_m4 in ir_to_m4_vec {
            sum_upper += ir_to_m4.clone().getUpper(3, 1, 1);
            sum_lower += ir_to_m4.getLower(1);
        }
        println!("{:?} lower: {:?}, upper: {:?}",name,sum_lower,sum_upper);
    }
    // let mut dir2 = env::current_dir().unwrap();
    // dir2.push("src");
    // dir2.push("llvmir_labeler");
    // dir2.push("test_cases");
    // let mut labeler = llvmir_labeler::Labeler::new();
    // let replaced_string = labeler.label_file(&dir2, "assembly_reg_ex.ll").unwrap();
    // println!("{}", replaced_string);
    // labeler.save_file(&dir2, "assembly_reg_ex.ll", replaced_string);

}