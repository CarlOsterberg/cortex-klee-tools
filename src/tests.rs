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
    fn test_split() {
        let input = "        bl              match       ";
        let split: Vec<&str> = input.split_whitespace().collect();
        println!("splits are:");
        for s in split {
            println!("{}", s);
        }
    }

    #[test]
    fn test_regexes() {
        let numbered_block = Regex::new(r"^(\s*)(?P<x>[0-9]+):\D").unwrap();
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

        let lbb = Regex::new(r"^(\s*).LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let lbb_test = "               .LBB34_567hjfla sfkjshlakfjhsdaf l23";
        assert!(lbb.is_match(lbb_test));

        let lbb_use = Regex::new(r".LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let lbb_use_test = "     bne        .LBB234_1231    ";
        assert!(lbb_use.is_match(lbb_use_test));

        let bb = Regex::new(r"^(\s*)@(\s*)%bb.(?P<x>[0-9]+):").unwrap();
        let bb_test = "         @       %bb.2:                                @ %.customlabel0";
        assert!(bb.is_match(bb_test));

        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s]+):").unwrap();
        let asm_fn_def_test = "-24vt:    afarf";
        assert!(asm_fn_def.is_match(asm_fn_def_test));

        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let asm_instruction_test = " add r1, r2";
        assert!(asm_instruction.is_match(asm_instruction_test));

        let move_lr_to_pc = Regex::new(r"^(\s*)mov(\s*)pc(\s*),(\s*)lr").unwrap();
        let move_lr_to_pc_test = "	mov	pc, lr        ";
        assert!(move_lr_to_pc.is_match(move_lr_to_pc_test));

        let move_lr_to_pc_cond = Regex::new(r"^(\s*)mov[a-z]+(\s*)pc(\s*),(\s*)lr").unwrap();
        let move_lr_to_pc_cond_test = "	moveq	pc, lr        ";
        assert!(move_lr_to_pc_cond.is_match(move_lr_to_pc_cond_test));

        let pop = Regex::new(r"(^\s*)pop").unwrap();
        let pop_test = "	pop	{r4, r5, r6, r7, r11, lr        ";
        assert!(pop.is_match(pop_test));

        let pop_cond = Regex::new(r"^(\s*)pop[a-z]+").unwrap();
        let pop_cond_test = "	popne	{r4, r5, r6, r7, r11, lr        ";
        assert!(pop_cond.is_match(pop_cond_test));

        let pop_single = Regex::new(r"^(\s*)pop([a-z]*)(\s*)(?P<x>[a-z0-9]+)").unwrap();
        let pop_single_test = "      pop    r11      ";
        assert!(pop_single.is_match(pop_single_test));

        let pop_multiple = Regex::new(r"^(\s*)pop([a-z]*)(\s*)[{]").unwrap();
        let pop_multiple_test = "   popne   {r11, lr}";
        assert!(pop_multiple.is_match(pop_multiple_test));

        let block_label = Regex::new(r"@(\s*)%(?P<x>[^:]+)(\s)*$").unwrap();
        let block_label_test = "@ %bb.3:                               @ %.customlabel1        ";
        assert!(block_label.is_match(block_label_test));

        let fn_end = Regex::new(r"^(\s*).fnend").unwrap();
        let fn_end_test = "          .fnend";
        assert!(fn_end.is_match(fn_end_test));
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
            println!("{:?}", labels);
            assert!(labels.is_ok());
        }
    }
}