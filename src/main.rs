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
    let ktests = llvmir_to_m4_cycles::IrToM4::read_dir(dir);
    for ktest in ktests {
        println!("{:?}",ktest);
    }
    let mut dir2 = env::current_dir().unwrap();
    dir2.push("src");
    dir2.push("llvmir_labeler");
    dir2.push("test_cases");
    let mut labeler = llvmir_labeler::Labeler::new();
    let replaced_string = labeler.label_file(dir2).unwrap();
    println!("{}", replaced_string);

}