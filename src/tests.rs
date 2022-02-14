use std::{fs,env};
use crate::ktest_parser;
use crate::llvmir_to_m4_cycles;
use regex::Regex;


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
        let paths = fs::read_dir(dir);
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
        let paths = fs::read_dir(dir);
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

    #[test]
    fn test_regexes() {
        let numbered_block = Regex::new(r"(?P<x>[0-9]+):").unwrap();
        let test = "    34:   ";
        assert!(numbered_block.is_match(test));
        let after = numbered_block.replace_all(test, "$x stagge");
        println!("{}", after);
        for cap in numbered_block.captures_iter(test) {
            println!("{}", &cap[1]);
        }


        let assignment = Regex::new(r"%(?P<x>[0-9]+)(\s*)=").unwrap();
        let assig_test = "   %322                  =";
        assert!(assignment.is_match(assig_test));
        for cap in assignment.captures_iter(assig_test) {
            println!("{}", &cap[1]);
        }

        let use_of_reg = Regex::new(r"%(?P<x>[0-9]+)").unwrap();
        let use_test = "isvdvodsf p %123   inpfisn134vq3rv";
        assert!(use_of_reg.is_match(use_test));

    }

    #[test]    
    fn test_labels_tool() {
        let mut dir = env::current_dir().unwrap();
        dir.push("src");
        dir.push("ktest_parser");
        dir.push("test_cases");
        let paths = fs::read_dir(dir);
        for test_folder in paths.unwrap() {
            let labels = ktest_parser::read_labels(test_folder.unwrap().path());
            assert!(labels.is_ok());
        }
    }
}