use regex::Regex;
use std::fmt::Result;
use std::fs;
use std::ops::Add;
use std::path::PathBuf;
use std::collections::{HashMap, HashSet};
use std::thread::current;

pub struct Block {
    function: String,
    llvmir_label: String,
    assembly_label: String,
    cycles: u128,
    successors: Vec<(i32, i32)>,
    calls: Vec<String>,
}

pub struct BlockCalculator {
    //(fn_nr, blk_nr) -> Block
    block_map: HashMap<(i32, i32), Block>,
    fn_map: HashMap<String, i32>,
    conditional_branch_instructions: HashSet<String>,
    unconditional_branch_instructions: HashSet<String>,
    other_branch_instructions: HashSet<String>,
}

pub fn init_conditional_branch_instructions() -> HashSet<String> {
    let mut ret = HashSet::new();
    ret.insert("beq".to_string());
    ret.insert("bne".to_string());
    ret.insert("bcs".to_string());
    ret.insert("bhs".to_string());
    ret.insert("bcc".to_string());
    ret.insert("blo".to_string());
    ret.insert("bmi".to_string());
    ret.insert("bpl".to_string());
    ret.insert("bvs".to_string());
    ret.insert("bvc".to_string());
    ret.insert("bhi".to_string());
    ret.insert("bls".to_string());
    ret.insert("bge".to_string());
    ret.insert("blt".to_string());
    ret.insert("bgt".to_string());
    ret.insert("ble".to_string());
    ret
}

pub fn init_unconditional_branch_instructions() -> HashSet<String> {
    let mut ret = HashSet::new();
    ret.insert("b".to_string());
    ret.insert("bl".to_string());
    ret
}

pub fn init_other_branch_instructions() -> HashSet<String> {
    let mut ret = HashSet::new();
    ret.insert("bx".to_string());
    ret.insert("blx".to_string());
    ret.insert("cbz".to_string());
    ret.insert("cbnz".to_string());
    ret.insert("tbb".to_string());
    ret.insert("tbh".to_string());
    ret
}

impl BlockCalculator {

    pub fn new() -> BlockCalculator {
        BlockCalculator {
            block_map: HashMap::new(),
            fn_map: HashMap::new(),
            conditional_branch_instructions: init_conditional_branch_instructions(),
            unconditional_branch_instructions: init_unconditional_branch_instructions(),
            other_branch_instructions: init_other_branch_instructions(),
        }

    }

    pub fn build_map_first_pass(&mut self, file_contents: &String) {
        let lbb = Regex::new(r"^(\s*).LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let bb = Regex::new(r"^(\s*)@(\s*)%bb.(?P<x>[0-9]+):").unwrap();
        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s]+):").unwrap();
        let fn_end = Regex::new(r"^(\s*).fnend").unwrap();
        let block_label = Regex::new(r"@(\s*)%(?P<x>[^:]+)(\s)*$").unwrap();
        let mut current_fn = "".to_string();
        let mut current_block_label = "initial_fn_block".to_string();
        let mut current_asm_label = "".to_string();
        let mut current_block_nr = -1;
        let mut current_fn_nr = -1;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                let mut fn_name = "".to_string();
                for cap in asm_fn_def.captures_iter(row){
                    fn_name = cap[1].to_string().clone();
                    break;
                }
                current_fn = fn_name;
                current_fn_nr += 1;
                self.fn_map.insert(current_fn.clone(), current_fn_nr);
                current_block_nr = -1;
            }
            else if lbb.is_match(row) {
                if current_block_nr != -1 {
                    let prev_block = Block {
                        function: current_fn.clone(),
                        llvmir_label: current_block_label.clone(),
                        assembly_label: current_asm_label.clone(),
                        cycles: 0,
                        successors: Vec::new(),
                        calls: Vec::new(),
                    };
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                }
                current_block_nr += 1;
                current_asm_label = format!(".LBB{}_{}", current_fn_nr, current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    current_block_label = format!("%{}", label).to_string();
                }
            }
            else if bb.is_match(row) {
                if current_block_nr != -1 {
                    let prev_block = Block {
                        function: current_fn.clone(),
                        llvmir_label: current_block_label.clone(),
                        assembly_label: current_asm_label.clone(),
                        cycles: 0,
                        successors: Vec::new(),
                        calls: Vec::new(),
                    };
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                }
                current_block_nr += 1;
                current_asm_label = format!(".%bb.{}", current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    current_block_label = format!("%{}", label).to_string();
                }
            }
            else if fn_end.is_match(row){
                let prev_block = Block {
                    function: current_fn.clone(),
                    llvmir_label: current_block_label.clone(),
                    assembly_label: current_asm_label.clone(),
                    cycles: 0,
                    successors: Vec::new(),
                    calls: Vec::new(),
                };
                self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
            }
        }
    }

    pub fn build_map_second_pass(&mut self, file_contents: &String) {
        let lbb = Regex::new(r"^(\s*).LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let lbb_use = Regex::new(r".LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let bb = Regex::new(r"^(\s*)@(\s*)%bb.(?P<x>[0-9]+):").unwrap();
        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s]+):").unwrap();
        let block_label = Regex::new(r"@(\s*)%(?P<x>[^:]+)(\s)*$").unwrap();
        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let move_lr_to_pc = Regex::new(r"^(\s*)mov(\s*)pc(\s*),(\s*)lr").unwrap();
        let mut unconditional_block = false;
        let mut current_fn = "".to_string();
        let mut current_block_label = "initial_fn_block".to_string();
        let mut current_asm_label = "".to_string();
        let mut current_block_nr = -1;
        let mut current_fn_nr = -1;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                let mut fn_name = "".to_string();
                for cap in asm_fn_def.captures_iter(row){
                    fn_name = cap[1].to_string().clone();
                    break;
                }
                current_fn = fn_name;
                current_fn_nr += 1;
                current_block_nr = -1;
            }
            else if lbb.is_match(row) {
                if !unconditional_block && current_block_nr >= 0{
                    let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                    old_block.successors.push((current_fn_nr, current_block_nr + 1));
                }
                current_block_nr += 1;
                unconditional_block = false;
                current_asm_label = format!(".LBB{}_{}", current_fn_nr, current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    current_block_label = format!("%{}", label).to_string();
                }
            }
            else if bb.is_match(row) {
                if !unconditional_block && current_block_nr >= 0{
                    let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                    old_block.successors.push((current_fn_nr, current_block_nr + 1));
                }
                current_block_nr += 1;
                unconditional_block = false;
                current_asm_label = format!(".%bb.{}", current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    current_block_label = format!("%{}", label).to_string();
                }
            }
            else if (asm_instruction.is_match(row)) {
                for cap in asm_instruction.captures_iter(row){
                    if self.conditional_branch_instructions.contains(&cap[2].to_string()){
                        let lbb_split: Vec<&str> = row.split("LBB").collect();
                        let nr_split: Vec<&str> = lbb_split[1].split("_").collect();
                        let b_fn_nr = nr_split[0].parse().expect("expected number in LBB target");
                        let b_blk_nr = nr_split[1].parse().expect("expected number in LBB target");
                        let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                        old_block.successors.push((b_fn_nr, b_blk_nr));
                    }
                    else if self.unconditional_branch_instructions.contains(&cap[2].to_string()){
                        if lbb_use.is_match(row) {
                            let lbb_split: Vec<&str> = row.split("LBB").collect();
                            let nr_split: Vec<&str> = lbb_split[1].split("_").collect();
                            let b_fn_nr = nr_split[0].parse().expect("expected number in LBB target");
                            let b_blk_nr = nr_split[1].parse().expect("expected number in LBB target");
                            let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                            old_block.successors.push((b_fn_nr, b_blk_nr));
                            unconditional_block = true;
                        }
                        else {
                            let split: Vec<&str> = row.split_whitespace().collect();
                            if split[1].eq("lr") {
                                //No successors for the block since it returns
                                unconditional_block = true;
                            }
                            else {
                                let callee_name = split[1].to_string();
                                let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                                old_block.calls.push(callee_name);
                            }
                        }
                    }
                    else if self.other_branch_instructions.contains(&cap[1].to_string()){
                        panic!("unimplemented");
                    }
                    else if move_lr_to_pc.is_match(row) {
                        unconditional_block = true;
                    }
                    break;
                }
            }
            
        }
    }

    pub fn analyze_file(&mut self, path: &PathBuf, file_name: &str) {
        let dir_read_res = path.read_dir();
        match dir_read_res {
            Ok(read_dir) => {
                for file_read_res in read_dir {
                    match file_read_res {
                        Ok(file) => {
                            if file_name.eq(file.file_name().to_str().unwrap()) {
                                let file_content_read_res = fs::read_to_string(file.path());
                                if file_content_read_res.is_err() {
                                    panic!("{}", file_content_read_res.unwrap_err().to_string());
                                }
                                let x = file_content_read_res.unwrap();
                                self.build_map_first_pass(&x);
                                self.build_map_second_pass(&x);
                                self.print_maps();
                                return;
                            }
                        }
                        Err(msg) => panic!("{}", msg.to_string()),
                    }
                }
                panic!("file not found");
            }
            Err(msg) => panic!("{}", msg.to_string()),
        }
    }

    pub fn print_maps(&mut self){
        for (key, value) in &self.block_map {
            println!("map key is ({}, {})", key.0, key.1);
            if value.successors.len() > 0 {
                for s in &value.successors {
                    println!("successor: ({}, {})", s.0, s.1);
                }
            }
            if value.calls.len() > 0 {
                for c in &value.calls {
                    println!("call: {}", c);
                }
            }
        }
        println!("fn map:");
        for (key, value) in &self.fn_map {
            println!("entry: {}, {}", key, value);
        }
    }
}