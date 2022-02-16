use std::{fs,env};
use crate::ktest_parser;
use regex::Regex;

#[cfg(test)]
mod tests {
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

        let lbb = Regex::new(r"^(\s*).LBB[0-9]+_[0-9]+").unwrap();
        let lbb_test = "               .LBB34_567hjfla sfkjshlakfjhsdaf l23";
        assert!(lbb.is_match(lbb_test));

        let bb = Regex::new(r"^(\s*)@(\s*)%bb.[0-9]+:").unwrap();
        let bb_test = "         @       %bb.2:                                @ %.customlabel0";
        assert!(bb.is_match(bb_test));

        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s]+):").unwrap();
        let asm_fn_def_test = "-24vt:    afarf";
        assert!(asm_fn_def.is_match(asm_fn_def_test));

        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let asm_instruction_test = " add r1, r2";
        assert!(asm_instruction.is_match(asm_instruction_test));

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