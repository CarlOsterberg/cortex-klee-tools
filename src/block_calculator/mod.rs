use regex::Regex;
use std::{fs, cmp};
use std::path::PathBuf;
use std::collections::{HashMap, HashSet};

use crate::llvmir_to_m4_cycles::cortex_m4::StringToCortexM4;

#[allow(dead_code)]
pub struct Block {
    function: String,
    llvmir_label: String,
    assembly_label: String,
    cycles: u64,
    successors: Vec<(i32, i32)>,
    calls: Vec<String>,
    conditional_return: bool,
    direct_label: bool,
}

#[allow(dead_code)]
pub struct BlockCalculator {
    //(fn_nr, blk_nr) -> Block
    block_map: HashMap<(i32, i32), Block>,
    pub fn_map: HashMap<String, i32>,
    conditional_branch_instructions: HashSet<String>,
    unconditional_branch_instructions: HashSet<String>,
    other_branch_instructions: HashSet<String>,
    block_stack: Vec<(String, String)>,
    pub cycles: u64,
    string_to_cycles: StringToCortexM4,
}

pub struct Path{
    label: String,
    cycles: u64,
    key: (i32, i32),
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

    ret.insert("cbz".to_string());
    ret.insert("cbnz".to_string());
    ret
}

pub fn init_unconditional_branch_instructions() -> HashSet<String> {
    let mut ret = HashSet::new();
    ret.insert("b".to_string());
    ret.insert("bl".to_string());

    ret.insert("bx".to_string());
    ret.insert("blx".to_string());
    ret
}

pub fn init_other_branch_instructions() -> HashSet<String> {
    let mut ret = HashSet::new();
    ret.insert("tbb".to_string());
    ret.insert("tbh".to_string());
    ret
}

#[allow(dead_code)]
impl BlockCalculator {

    pub fn new() -> BlockCalculator {
        BlockCalculator {
            block_map: HashMap::new(),
            fn_map: HashMap::new(),
            conditional_branch_instructions: init_conditional_branch_instructions(),
            unconditional_branch_instructions: init_unconditional_branch_instructions(),
            other_branch_instructions: init_other_branch_instructions(),
            block_stack: Vec::new(),
            cycles: 0,
            string_to_cycles: StringToCortexM4::new(),
        }

    }

    //Constructs a Block struct for every block in the assembly file and inserts it into self.block_map
    pub fn build_map_first_pass(&mut self, file_contents: &String) {
        let lbb = Regex::new(r"^(\s*).LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let bb = Regex::new(r"^(\s*)@(\s*)%bb.(?P<x>[0-9]+):").unwrap();
        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s])(?P<y>[^\s]+):").unwrap();
        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let fn_end = Regex::new(r"^(\s*).fnend").unwrap();
        let block_label = Regex::new(r"@(\s*)%(?P<x>[^:]+)(\s)*$").unwrap();
        let mut current_fn = "".to_string();
        let mut current_block_label = "initial_fn_block".to_string();
        let mut current_asm_label = "".to_string();
        let mut current_block_nr = -1;
        let mut current_fn_nr = -1;
        let mut block_cycles: u64 = 0;
        let mut label_used = false;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                let mut fn_name = "".to_string();
                for cap in asm_fn_def.captures_iter(row){
                    fn_name = format!("{}{}", cap[1].to_string().clone(), cap[2].to_string().clone());
                    //rust name manglng, the name seems to be the same before the 17h
                    //this means the original program cant have multiple functions with a name containing
                    //17h if the name is the same before the 17h. 
                    let rust_mangle_split: Vec<&str> = fn_name.split("17h").collect();
                    if rust_mangle_split.len() == 2 {
                        fn_name = rust_mangle_split[0].to_string();
                    }
                    break;
                }
                current_fn = fn_name;
                current_block_label = "initial_fn_block".to_string();
                label_used = false;
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
                        cycles: block_cycles,
                        successors: Vec::new(),
                        calls: Vec::new(),
                        conditional_return: false,
                        direct_label: !label_used,
                    };
                    label_used = true;
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                }
                block_cycles = 0;
                current_block_nr += 1;
                current_asm_label = format!(".LBB{}_{}", current_fn_nr, current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    //current_block_label = format!("%{}", label).to_string();
                    current_block_label = label.to_string();
                    label_used = false;
                }
            }
            else if bb.is_match(row) {
                if current_block_nr != -1 {
                    let prev_block = Block {
                        function: current_fn.clone(),
                        llvmir_label: current_block_label.clone(),
                        assembly_label: current_asm_label.clone(),
                        cycles: block_cycles,
                        successors: Vec::new(),
                        calls: Vec::new(),
                        conditional_return: false,
                        direct_label: !label_used,
                    };
                    label_used = true;
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                }
                block_cycles = 0;
                current_block_nr += 1;
                current_asm_label = format!(".%bb.{}", current_block_nr);
                if block_label.is_match(row) {
                    let split: Vec<&str> = row.split("%").collect();
                    let label = split[split.len()-1];
                    //current_block_label = format!("%{}", label).to_string();
                    current_block_label = label.to_string();
                    label_used = false;
                }
            }
            else if fn_end.is_match(row){
                let prev_block = Block {
                    function: current_fn.clone(),
                    llvmir_label: current_block_label.clone(),
                    assembly_label: current_asm_label.clone(),
                    cycles: block_cycles,
                    successors: Vec::new(),
                    calls: Vec::new(),
                    conditional_return: false,
                    direct_label: !label_used,
                };
                label_used = true;
                self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                block_cycles = 0;
            }
            if asm_instruction.is_match(row) {
                block_cycles += self.string_to_cycles.get_upper_bound_cycles(row.split_whitespace().collect::<Vec<&str>>()[0]) as u64;
            }
        }
    }


    //Sets the successors and calls for every block created in build_map_first_pass
    pub fn build_map_second_pass(&mut self, file_contents: &String) {
        let lbb = Regex::new(r"^(\s*).LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let lbb_use = Regex::new(r".LBB(?P<x>[0-9]+)_(?P<y>[0-9]+)").unwrap();
        let bb = Regex::new(r"^(\s*)@(\s*)%bb.(?P<x>[0-9]+):").unwrap();
        let asm_fn_def = Regex::new(r"^(?P<x>[^.\s])(?P<y>[^\s]+):").unwrap();
        let asm_instruction = Regex::new(r"^(\s)+(?P<x>[a-z]+)").unwrap();
        let move_lr_to_pc = Regex::new(r"^(\s*)mov(s)*(.w)*(.n)*(\s*)pc(\s*),(\s*)lr").unwrap();
        let move_lr_to_pc_cond = Regex::new(r"^(\s*)mov[a-z]+(.w)*(.n)*(\s*)pc(\s*),(\s*)lr").unwrap();
        let pop_single = Regex::new(r"^(\s*)pop([a-z]*)(.w)*(.n)*(\s+)(?P<x>[a-z0-9]+)").unwrap();
        let pop_multiple = Regex::new(r"^(\s*)pop([a-z]*)(.w)*(.n)*(\s*)[{]").unwrap();
        let pop_cond = Regex::new(r"^(\s*)pop[a-z]+").unwrap();
        let pop_s = Regex::new(r"^(\s*)pops").unwrap();
        let mut unconditional_block = false;
        let mut lr_popped = false;
        let mut conditional_return = false;
        let mut table_branch = false;
        let mut current_block_nr = -1;
        let mut current_fn_nr = -1;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                current_fn_nr += 1;
                current_block_nr = -1;
                unconditional_block = false;
                conditional_return = false;
                table_branch = false;
                lr_popped = false;
            }
            else if lbb.is_match(row) {
                if !unconditional_block && current_block_nr >= 0{
                    let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                    old_block.successors.push((current_fn_nr, current_block_nr + 1));
                    old_block.conditional_return = conditional_return;
                }
                current_block_nr += 1;
                //Table branch targets have been added
                if unconditional_block {
                    table_branch = false;
                }
                unconditional_block = false;
                conditional_return = false;
                lr_popped = false;
            }
            else if bb.is_match(row) {
                if !unconditional_block && current_block_nr >= 0{
                    let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                    old_block.successors.push((current_fn_nr, current_block_nr + 1));
                    old_block.conditional_return = conditional_return;
                }
                current_block_nr += 1;
                //Table branch targets have been added
                if unconditional_block {
                    table_branch = false;
                }
                unconditional_block = false;
                conditional_return = false;
                lr_popped = false;
            }
            else if lbb_use.is_match(row) && table_branch {
                let period_split: Vec<&str> = row.split(".").collect();
                let dash_split: Vec<&str> = period_split[2].split("-").collect();
                let lbb_split: Vec<&str> = dash_split[0].split("LBB").collect();
                let nr_split: Vec<&str> = lbb_split[1].split("_").collect();
                let b_fn_nr = nr_split[0].parse().expect("expected number in LBB target");
                let b_blk_nr = nr_split[1].parse().expect("expected number in LBB target");
                let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                old_block.successors.push((b_fn_nr, b_blk_nr));
                //Don't add next block to successors
                unconditional_block = true;
            }
            else if asm_instruction.is_match(row) {
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
                        if lbb_use.is_match(row){
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
                            //direct branch to return
                            if split[1].eq("lr") {
                                //No successors for the block since it returns
                                unconditional_block = true;
                            }
                            else {
                                //for now assume immediate return after call
                                if lr_popped {
                                    unconditional_block = true;
                                }
                                let mut callee_name = split[1].to_string();
                                //rust name manglng, the name seems to be the same before the 17h
                                //this means the original program cant have multiple functions with a name containing
                                //17h if the name is the same before the 17h. 
                                let rust_mangle_split: Vec<&str> = callee_name.split("17h").collect();
                                if rust_mangle_split.len() == 2 {
                                    callee_name = rust_mangle_split[0].to_string();
                                }
                                let old_block = self.block_map.get_mut(&(current_fn_nr, current_block_nr)).unwrap();
                                old_block.calls.push(callee_name);
                            }
                        }
                    }
                    else if self.other_branch_instructions.contains(&cap[2].to_string()){
                        //Collect branch targets in next block
                        table_branch = true;                        
                    }
                    else if pop_single.is_match(row) {
                        let split: Vec<&str> = row.split_whitespace().collect();
                        if split[1].eq("lr") {
                            lr_popped = true;
                        }
                        if split[1].eq("pc") {
                            //pop_cond also matches pops
                            if pop_cond.is_match(row) && !pop_s.is_match(row){
                                conditional_return = true;
                            }
                            //unconditional return
                            else {
                                unconditional_block = true;
                            }
                        }
                    }
                    else if pop_multiple.is_match(row) {
                        let row_clone = row.clone();
                        let row_clone = row_clone.replace("{", "");
                        let row_clone = row_clone.replace("}", "");
                        let row_clone = row_clone.replace(",", "");
                        let split: Vec<&str> = row_clone.split_whitespace().collect();
                        for s in split {
                            if s.eq("lr") {
                                lr_popped = true;
                            }
                            if s.eq("pc") {
                                if pop_cond.is_match(row) && !pop_s.is_match(row) {
                                    conditional_return = true;
                                }
                                else {
                                    unconditional_block = true;
                                }
                            }

                        }
                    }
                    //Must check unconditional first
                    else if move_lr_to_pc.is_match(row) {
                        unconditional_block = true;
                    }
                    else if move_lr_to_pc_cond.is_match(row) {
                        conditional_return = true;
                    }
                    break;
                }
            }
            
        }
    }


    //Finds the main routine and starts following the control flow
    pub fn solve_control_flow(&mut self, stack: Vec<(String, String)>) {
        self.cycles = 0;
        println!("----------------Starting new path--------------------------");
        self.block_stack = stack;
        let main_number = self.fn_map.get(&"main".to_string()).unwrap().clone();
        self.solve_fn_control_flow((main_number,0));
        println!("finished solving control flow");
    } 

    //Tries to refollow the control flow as specified by the block stack
    fn solve_fn_control_flow(&mut self, fn_key: (i32, i32)) {
        let mut key = fn_key;
        loop {
            println!("currently in block: {:?}", key);
            let mut current_block = self.block_map.get(&key).unwrap();
            self.cycles += current_block.cycles;
            for c in current_block.calls.clone() {
                /*if c == "klee_make_symbolic".to_string() {
                    continue;
                }*/
                if !self.fn_map.contains_key(&c) {
                    println!("################ Skipping unknown call: {} ################",c);
                    continue;
                }
                let fn_nr = self.fn_map.get(&c).unwrap().clone();
                self.solve_fn_control_flow((fn_nr, 0));
            }
            current_block = self.block_map.get(&key).unwrap();
            if current_block.successors.len() == 0 && !current_block.conditional_return{
                return;
            }
            else if current_block.successors.len() == 1 && !current_block.conditional_return{
                key = current_block.successors[0];
            }
            else if current_block.successors.len() > 2 {
                println!("performing table branch in: {} in function {} (tuple: {:?})", current_block.llvmir_label, current_block.function, key);
                while *self.block_stack.last().unwrap() != (current_block.function.clone(), current_block.llvmir_label.clone()){
                    println!("{:?}", self.block_stack.pop());
                    //self.block_stack.pop();
                }
                //pop all the calls and find the next block
                while *self.block_stack.last().unwrap() == (current_block.function.clone(), current_block.llvmir_label.clone()){
                    println!("{:?}", self.block_stack.pop());
                    //self.block_stack.pop();
                }
                let next_tuple = &self.block_stack[self.block_stack.len() - 1];
                println!("target tuple: {:?}", next_tuple);
                //let next_tuple = self.block_stack.pop().unwrap();
                let mut succ_found = false;
                for s in &current_block.successors {
                    let b = self.block_map.get(s).unwrap();
                    //if b.function == next_tuple.0 && b.llvmir_label == next_tuple.1 {
                    if b.llvmir_label.len() < next_tuple.1.len() {
                        continue;
                    }
                    if b.function == next_tuple.0 && b.llvmir_label[0..next_tuple.1.len()] == next_tuple.1 {
                        succ_found = true;
                        key = *s;
                    }
                }
                if !succ_found {
                    panic!("could not find successor after table branch in {:?}", key);
                }
            }
            else {
                assert!(current_block.successors.len() <= 2);
                println!("performing conditional branch in: {} in function {} (tuple: {:?})", current_block.llvmir_label, current_block.function, key);
                /*while *self.block_stack.last().unwrap() != (current_block.function.clone(), current_block.llvmir_label.clone()){
                    println!("{:?}", self.block_stack.pop());
                    //self.block_stack.pop();
                }
                //pop all the calls and find the next block
                while *self.block_stack.last().unwrap() == (current_block.function.clone(), current_block.llvmir_label.clone()){
                    println!("{:?}", self.block_stack.pop());
                    //self.block_stack.pop();
                }*/
                while self.block_stack.len() > 0 {
                    let block_name = self.block_stack.pop().unwrap();
                    println!("{:?}", block_name);
                    if block_name == (current_block.function.clone(), current_block.llvmir_label.clone()) {
                        self.block_stack.push(block_name);
                        break;
                    }
                    let block_name_split: Vec<&str> = current_block.llvmir_label.split(".").collect();
                    if block_name_split.len() < 2 {
                        continue;
                    }
                    let mut suffix_removed = "".to_string();
                    for i in 0..block_name_split.len() - 1 {
                        if suffix_removed == "".to_string() {
                            suffix_removed = format!("{}{}", suffix_removed, block_name_split[i]);
                        }
                        else {
                            suffix_removed = format!("{}.{}", suffix_removed, block_name_split[i]);
                        }
                    }
                    println!("suffix removed. {:?}", suffix_removed);
                    if block_name == (current_block.function.clone(), suffix_removed) {
                        self.block_stack.push(block_name);
                        break;
                    }
                }

                while self.block_stack.len() > 0 {
                    let block_name = self.block_stack.pop().unwrap();
                    println!("{:?}", block_name);
                    let block_name_split: Vec<&str> = current_block.llvmir_label.split(".").collect();
                    if block_name_split.len() < 2 {
                        if block_name != (current_block.function.clone(), current_block.llvmir_label.clone()) {
                            println!("found {:?} which is not equal to our block, this will be our branch target", block_name);
                            break;
                        }
                        continue;
                    }
                    let mut suffix_removed = "".to_string();
                    for i in 0..block_name_split.len() - 1 {
                        if suffix_removed == "".to_string() {
                            suffix_removed = format!("{}{}", suffix_removed, block_name_split[i]);
                        }
                        else {
                            suffix_removed = format!("{}.{}", suffix_removed, block_name_split[i]);
                        }
                    }
                    println!("suffix removed. {:?}", suffix_removed);
                    if block_name != (current_block.function.clone(), suffix_removed) {
                        println!("found {:?} which is not equal to our block, this will be our branch target", block_name);
                        break;
                    }
                }

                let next_tuple = &self.block_stack[self.block_stack.len() - 1];
                println!("target tuple: {:?}", next_tuple);
                //let next_tuple = self.block_stack.pop().unwrap();
                let mut succ_found = false;
                for s in &current_block.successors {
                    let b = self.block_map.get(s).unwrap();
                    //if b.function == next_tuple.0 && b.llvmir_label == next_tuple.1 {
                    if b.llvmir_label.len() < next_tuple.1.len() {
                        continue;
                    }
                    if b.function == next_tuple.0 && b.llvmir_label[0..next_tuple.1.len()] == next_tuple.1{
                        succ_found = true;
                        key = *s;
                    }
                }
                if !succ_found {
                    if current_block.conditional_return {
                        return;
                    }
                    println!("Could not find succcessor after block: {}", current_block.llvmir_label);
                    //key = current_block.successors[0];
                    if self.block_map.get(&current_block.successors[0]).unwrap().direct_label {
                        key = current_block.successors[1];
                        println!("branching to block: {:?}", key);
                    }
                    else if self.block_map.get(&current_block.successors[1]).unwrap().direct_label {
                        key = current_block.successors[0];
                        println!("branching to block: {:?}", key);
                    }
                    else {
                        //Explore ahead to try to find the label
                        assert!(current_block.successors.len() == 2);
                        println!("exploring ahead to find the label");

                        let first = self.explore_paths_ahead(&current_block.successors[0], 0);
                        let second = self.explore_paths_ahead(&current_block.successors[1], 0);

                        let mut first_contains = false;
                        let mut second_contains = false;

                        let mut first_key = (0,0);
                        let mut second_key = (0,0);

                        let mut first_cycles = 0;
                        let mut second_cycles = 0;

                        for p in first.1 {
                            if p.label.len() < next_tuple.1.len() {
                                continue;
                            }
                            if p.label[0..next_tuple.1.len()] == next_tuple.1 {
                                first_contains = true;
                                first_key = p.key;
                                first_cycles = p.cycles;
                            }
                        }

                        for p in second.1 {
                            if p.label[0..next_tuple.1.len()] == next_tuple.1 {
                                second_contains = true;
                                second_key = p.key;
                                second_cycles = p.cycles;
                            }
                        }

                        if first_contains && second_contains {
                            println!("Two paths to the target label, selecting the longer path");
                            if first_cycles > second_cycles {
                                key = first_key;
                                self.cycles += first_cycles;
                            }
                            else {
                                key = second_key;
                                self.cycles += second_cycles
                            }
                        }
                        else if first_contains {
                            key = first_key;
                            self.cycles += first_cycles;
                        }
                        else if second_contains {
                            key = second_key;
                            self.cycles += second_cycles;
                        }
                        else {
                            println!("could not find label, attempting return");
                            if first.0 && second.0 {
                                println!("two paths can return, selecting the longer one");
                                self.cycles += cmp::max(first.2, second.2);
                            }
                            else if first.0 {
                                self.cycles += first.2;
                            }
                            else if second.0 {
                                self.cycles += second.2;
                            }
                            else {
                                panic!("could not return");
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    //Runs the first and second pass for a given file
    pub fn analyze_file_block_structure(&mut self, path: &PathBuf, file_name: &str) {
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
                                //self.print_maps();
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

    pub fn explore_paths_ahead(&self, key: &(i32, i32), prev_cycles: u64) -> (bool, Vec<Path>, u64) {
        let mut can_return = false;
        let mut path_vec = Vec::new();
        let current_block = self.block_map.get(key).unwrap();
        //Direct label found, base-case
        if current_block.direct_label {
            let path = Path {
                label: current_block.llvmir_label.clone(),
                cycles: prev_cycles,
                key: *key,
            };
            path_vec.push(path);
            return (false, path_vec, 0);
        }
        //Unconditional return in not directly labeled block
        if current_block.successors.len() == 0 {
            return (true, path_vec, prev_cycles + current_block.cycles);
        }
        
        let mut cycles_to_return = 0;

        if current_block.conditional_return {
            can_return = true;
            cycles_to_return = prev_cycles + current_block.cycles;
        }
        for s in &current_block.successors {
            let res = self.explore_paths_ahead(s, prev_cycles + current_block.cycles);
            if res.0 {
                can_return = true;
                if res.2 > cycles_to_return {
                    cycles_to_return = res.2;
                }
            }
            for p in res.1 {
                path_vec.push(p);
            }
        }

        return (can_return, path_vec, cycles_to_return);

    }

    pub fn assert_analyzable_block_structure(&mut self) {
        let mut ok_count = 0;
        let mut fail_count = 0;
        for (key, value) in &self.block_map {
            if value.successors.len() == 2 {
                if !self.block_map.contains_key(&value.successors[0]) || !self.block_map.contains_key(&value.successors[1]) {
                    println!("could not find successor: {:?} or {:?} after block {:?}", value.successors[0], value.successors[1], key);
                    continue;
                }
                let succ_0_direct = self.block_map.get(&value.successors[0]).unwrap().direct_label;
                let succ_1_direct = self.block_map.get(&value.successors[1]).unwrap().direct_label;
                //One of the successors is directly labeled
                if succ_0_direct || succ_1_direct {
                    ok_count += 1;
                }
                else {
                    let first = self.explore_paths_ahead(&value.successors[0], 0);
                    let second = self.explore_paths_ahead(&value.successors[1], 0);
                    //only one path can return;
                    assert!(!(first.0 && second.0));
                    println!("exploring ahead in {:?}", key);
                    let mut first_set = HashSet::new();
                    for p in first.1 {
                        println!("in first: {}", p.label);
                        first_set.insert(p.label);
                    }
                    let mut failed = false;
                    for p in second.1 {
                        println!("in second: {}", p.label);
                        if first_set.contains(&p.label) {
                            failed = true;
                        }
                    }
                    if failed {
                        fail_count += 1;
                    }
                    else {
                        ok_count += 1;
                    }
                }
            }
            else if value.successors.len() > 2 {
                for s in &value.successors {
                    assert!(self.block_map.get(&s).unwrap().direct_label);
                }
            }
        }
        println!("ok: {}, fail: {}", ok_count, fail_count);
    }

    pub fn print_maps(&mut self){
        for (key, value) in &self.block_map {
            println!("map key is ({}, {})", key.0, key.1);
            println!("{}", value.llvmir_label);
            println!("direct label: {}", value.direct_label);
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