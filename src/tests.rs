use std::{fs,env};
use crate::ktest_parser;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ktest_tool() {
        let mut dir = env::current_dir().unwrap();
        dir.push("src");
        dir.push("ktest_tool");
        dir.push("test_cases");
        let paths =fs::read_dir(dir);
        for test_folder in paths.unwrap() {
            let ktests = ktest_parser::read_klee_folder(test_folder.unwrap().path());
            assert!(ktests.is_ok());
        }

    }
}