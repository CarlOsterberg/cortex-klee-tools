use std::env;
mod ktest_parser;
mod tests;
mod llvmir_labeler;
mod block_calculator;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let mut dir = env::current_dir().unwrap();
    dir.push("src");
    dir.push("ktest_parser");
    dir.push("test_cases");
    dir.push("regexp");
    let ktests = ktest_parser::read_instr(dir).unwrap();
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