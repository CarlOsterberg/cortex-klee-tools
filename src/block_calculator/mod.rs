use regex::Regex;
use std::fs;
use std::ops::Add;
use std::path::PathBuf;
use std::collections::HashMap;

pub struct Block {
    function: String,
    llvmir_label: String,
    assembly_label: String,
    cycles: u128,
    successors: Vec<(String, u32)>,
    calls: Vec<String>,
}

pub struct BlockCalculator {
    block_map: HashMap<(String, u32), Block>,
    conditional_branch_instructions: Vec<String>,
    unconditional_branch_instructions: Vec<String>,
    other_branch_instructions: Vec<String>,
}

pub fn init_conditional_branch_instructions() -> Vec<String> {
    let mut ret = Vec::new();
    ret.push("beq".to_string());
    ret.push("bne".to_string());
    ret.push("bcs".to_string());
    ret.push("bhs".to_string());
    ret.push("bcc".to_string());
    ret.push("blo".to_string());
    ret.push("bmi".to_string());
    ret.push("bpl".to_string());
    ret.push("bvs".to_string());
    ret.push("bvc".to_string());
    ret.push("bhi".to_string());
    ret.push("bls".to_string());
    ret.push("bge".to_string());
    ret.push("blt".to_string());
    ret.push("bgt".to_string());
    ret.push("ble".to_string());
    ret
}

pub fn init_unconditional_branch_instructions() -> Vec<String> {
    let mut ret = Vec::new();
    ret.push("b".to_string());
    ret.push("bl".to_string());
    ret
}

pub fn init_other_branch_instructions() -> Vec<String> {
    let mut ret = Vec::new();
    ret.push("bx".to_string());
    ret.push("blx".to_string());
    ret.push("cbz".to_string());
    ret.push("cbnz".to_string());
    ret.push("tbb".to_string());
    ret.push("tbh".to_string());
    ret
}

impl BlockCalculator {

    pub fn new() -> BlockCalculator {
        BlockCalculator {
            block_map: HashMap::new(),
            conditional_branch_instructions: init_conditional_branch_instructions(),
            unconditional_branch_instructions: init_unconditional_branch_instructions(),
            other_branch_instructions: init_other_branch_instructions(),
        }

    }

    pub fn build_map(&mut self, file_contents: String) {
        let lbb = Regex::new(r"^(\s*).LBB[0-9]+_[0-9]+").unwrap();
        let bb = Regex::new(r"^(\s*)@(\s*)%bb.[0-9]+:").unwrap();
        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s]+):").unwrap();
        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let mut current_fn = "".to_string();
        let mut current_block_label = "initial_fn_block".to_string();
        let mut current_block_nr = -1;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                let mut fn_name = "".to_string();
                for cap in asm_fn_def.captures_iter(row){
                    fn_name = cap[1].to_string().clone();
                    break;
                }
                current_fn = fn_name;
            }
            else if lbb.is_match(row) {

            }
            else if bb.is_match(row) {

            }
            else if asm_instruction.is_match(row){

            }
        }
    }
}