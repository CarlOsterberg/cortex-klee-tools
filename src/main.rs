use std::env;
mod ktest_parser;
mod tests;

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

fn main() {
    let mut dir = env::current_dir().unwrap();
    dir.push("src");
    dir.push("ktest_tool");
    dir.push("test_cases");
    dir.push("regexp");
    let ktests = ktest_parser::read_klee_folder(dir).unwrap();
    for ktest in ktests {
        println!("{:?}",ktest);
    }
}