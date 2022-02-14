use std::{fs,env};
use crate::ktest_parser;
use crate::llvmir_to_m4_cycles;

#[cfg(test)]
mod tests {
    use crate::llvmir_to_m4_cycles;

    use super::*;

    #[test]
    fn test_ktest_tool() {
        let mut dir = env::current_dir().unwrap();
        dir.push("src");
        dir.push("ktest_parser");
        dir.push("test_cases");
        let paths =fs::read_dir(dir);
        for test_folder in paths.unwrap() {
            let ktests = ktest_parser::read_ktests(test_folder.unwrap().path());
            assert!(ktests.is_ok());
        }
    }

    #[test]
    fn test_instructions_tool() {
        let mut dir = env::current_dir().unwrap();
        dir.push("src");
        dir.push("ktest_parser");
        dir.push("test_cases");
        let paths =fs::read_dir(dir);
        for test_folder in paths.unwrap() {
            let instructions = ktest_parser::read_instr(test_folder.unwrap().path());
            assert!(instructions.is_ok());
        }
    }

    #[test]
    fn test_llvmir_to_m4_cycles_parsing() {
        let mut dir = env::current_dir().unwrap();
        dir.push("src");
        dir.push("ktest_parser");
        dir.push("test_cases");
        let paths =fs::read_dir(dir);
        for test_folder in paths.unwrap() {
            let instructions = llvmir_to_m4_cycles::IrToM4::read_dir(test_folder.unwrap().path());
            assert!(instructions.is_ok());
        }
    }
}