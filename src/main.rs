use std::env;

use crate::ktest_tool::KtestData;
use crate::ktest_tool::read_klee_folder;

mod ktest_tool;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let mut dir = env::current_dir().unwrap();
    dir.push("ktests");
    dir.push("klee-last");
    let ktests = read_klee_folder(dir).unwrap();
    for ktest in ktests {
        println!("{:?}",ktest);
    }
}