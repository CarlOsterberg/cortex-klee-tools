use regex::Regex;
use std::fs;
use std::path::PathBuf;
use std::collections::{HashMap, HashSet};
use rustc_demangle::demangle;

use crate::llvmir_to_m4_cycles::cortex_m4::StringToCortexM4;
use crate::settings::Settings;

#[allow(dead_code)]
pub struct Block {
    function: String,
    llvmir_label: String,
    assembly_label: String,
    ub_cycles: u64,
    lb_cycles: u64,
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
    block_stack: Vec<(String, String, bool)>,
    pub cycles: u64,
    string_to_cycles: StringToCortexM4,
    ir_label_set: HashSet<(String, String)>,
    asm_label_set: HashSet<(String, String)>,
    settings: Settings,
}

#[allow(dead_code)]
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

    pub fn new(settings: Settings) -> BlockCalculator {
        BlockCalculator {
            block_map: HashMap::new(),
            fn_map: HashMap::new(),
            conditional_branch_instructions: init_conditional_branch_instructions(),
            unconditional_branch_instructions: init_unconditional_branch_instructions(),
            other_branch_instructions: init_other_branch_instructions(),
            block_stack: Vec::new(),
            cycles: 0,
            string_to_cycles: StringToCortexM4::new(),
            ir_label_set: HashSet::new(),
            asm_label_set: HashSet::new(),
            settings: settings,
        }

    }

    pub fn set_label_set(&mut self, set: HashSet<(String, String)>) {
        self.ir_label_set = set;
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
        let mut block_cycles_ub: u64 = 0;
        let mut block_cycles_lb: u64 = 0;
        let mut label_used = false;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        for row in rows {
            if asm_fn_def.is_match(row) {
                let mut fn_name = "".to_string();
                for cap in asm_fn_def.captures_iter(row){
                    fn_name = format!("{}{}", cap[1].to_string().clone(), cap[2].to_string().clone());
                    if self.settings.rust {
                        //demangle and remove hash
                        fn_name = format!("{:#}", demangle(&fn_name));
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
                        ub_cycles: block_cycles_ub,
                        lb_cycles: block_cycles_lb,
                        successors: Vec::new(),
                        calls: Vec::new(),
                        conditional_return: false,
                        direct_label: !label_used,
                    };
                    label_used = true;
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                    self.asm_label_set.insert((current_fn.clone(), current_block_label.clone()));
                }
                block_cycles_lb = 0;
                block_cycles_ub = 0;
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
                        ub_cycles: block_cycles_ub,
                        lb_cycles: block_cycles_lb,
                        successors: Vec::new(),
                        calls: Vec::new(),
                        conditional_return: false,
                        direct_label: !label_used,
                    };
                    label_used = true;
                    self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                    self.asm_label_set.insert((current_fn.clone(), current_block_label.clone()));
                }
                block_cycles_lb = 0;
                block_cycles_ub = 0;
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
                    ub_cycles: block_cycles_ub,
                    lb_cycles: block_cycles_lb,
                    successors: Vec::new(),
                    calls: Vec::new(),
                    conditional_return: false,
                    direct_label: !label_used,
                };
                label_used = true;
                self.block_map.insert((current_fn_nr, current_block_nr), prev_block);
                self.asm_label_set.insert((current_fn.clone(), current_block_label.clone()));
                block_cycles_lb = 0;
                block_cycles_ub = 0;
            }
            if asm_instruction.is_match(row) {
                block_cycles_lb += self.string_to_cycles.get_lower_bound_cycles(row.split_whitespace().collect::<Vec<&str>>()[0]) as u64;
                block_cycles_ub += self.string_to_cycles.get_upper_bound_cycles(row.split_whitespace().collect::<Vec<&str>>()[0]) as u64;
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
                                if self.settings.rust {
                                    //demangle and remove hash
                                    callee_name = format!("{:#}", demangle(&callee_name));
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
    pub fn solve_control_flow(&mut self, stack: Vec<(String, String, bool)>) -> (u64, u64){
        let lower;
        let upper;
        self.cycles = 0;
        println!("----------------Starting new path----------------");
        let block_stack_clone = stack.clone();
        self.block_stack = stack;
        let x  = self.block_stack.len() as u64;
        let main_number = self.fn_map.get(&"main".to_string()).unwrap().clone();
        let res_upper = self.solve_fn_control_flow((main_number,0), true);
        if res_upper.is_err() {
            println!("Unable to estimate cycles for this path (upper bound).");
            println!("Reason:");
            println!("{}", res_upper.unwrap_err());
            return (u64::MAX, u64::MAX);
        }
        upper = self.cycles;
        println!("Estimated cycles (upper bound): {}", upper);
        println!("block_stack_size: before: {} after: {}", x, self.block_stack.len());
        //println!("cycle/'block' ratio * 100: {}", (x*100)/self.cycles);

        //Solve again for lower bound
        self.block_stack = block_stack_clone;
        self.cycles = 0;
        let res_lower = self.solve_fn_control_flow((main_number, 0), false);
        if res_lower.is_err() {
            println!("Unable to estimate cycles for this path (lower bound).");
            println!("Reason:");
            println!("{}", res_lower.unwrap_err());
            return (u64::MAX, u64::MAX);
        }
        lower = self.cycles;
        println!("Estimated cycles (lower bound): {}", lower);
        println!("block_stack_size: before: {} after: {}", x, self.block_stack.len());
        (lower, upper)
    } 

    //Tries to refollow the control flow as specified by the block stack
    fn solve_fn_control_flow(&mut self, fn_key: (i32, i32), upper_bound: bool)  -> Result<(), String> {
        let mut key = fn_key;
        loop {
            self.print_if_verbose(format!("currently in block: {:?}", key));
            let mut current_block = self.block_map.get(&key).unwrap();
            if upper_bound {
                self.cycles += current_block.ub_cycles;
            }
            else {
                self.cycles += current_block.lb_cycles;
            }
            for c in current_block.calls.clone() {
                /*if c == "klee_make_symbolic".to_string() {
                    continue;
                }*/
                if !self.fn_map.contains_key(&c) {
                    self.print_if_verbose(format!("################ Skipping unknown call: {} ################",c));
                    continue;
                }
                let fn_nr = self.fn_map.get(&c).unwrap().clone();
                let call_result = self.solve_fn_control_flow((fn_nr, 0), upper_bound);
                if call_result.is_err() {
                    return call_result;
                }
            }
            current_block = self.block_map.get(&key).unwrap();
            if current_block.successors.len() == 0 && !current_block.conditional_return{
                return Ok(());
            }
            else if current_block.successors.len() == 1 && !current_block.conditional_return{
                key = current_block.successors[0];
            }
            else if current_block.successors.len() > 2 {
                self.print_if_verbose(format!("performing table branch in: {} in function {} (tuple: {:?})", 
                    current_block.llvmir_label, current_block.function, key));
                //pop stack until we find the current block
                while !(*self.block_stack.last().unwrap().0 == current_block.function.clone() &&
                        *self.block_stack.last().unwrap().1 == current_block.llvmir_label.clone()){
                    if self.block_stack.len() == 0 {
                        return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                    }
                    if self.settings.verbose {
                        println!("{:?}", self.block_stack.pop());
                    }
                    else {
                        self.block_stack.pop();
                    }
                }
                //pop all the calls and find the next block
                while *self.block_stack.last().unwrap().0 == current_block.function.clone() &&
                        *self.block_stack.last().unwrap().1 == current_block.llvmir_label.clone() &&
                        self.block_stack.last().unwrap().2{
                    if self.block_stack.len() == 0 {
                        return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                    }
                    if self.settings.verbose {
                        println!("{:?}", self.block_stack.pop());
                    }
                    else {
                        self.block_stack.pop();
                    }
                }

                if self.block_stack.len() == 0 {
                    return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                }

                //pop once to find the next block
                if self.settings.verbose {
                    println!("{:?}", self.block_stack.pop());
                }
                else {
                    self.block_stack.pop();
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
                    if b.function == next_tuple.0 && //function name has to be the same
                        ((b.llvmir_label[0..next_tuple.1.len()] == next_tuple.1 && !self.ir_label_set.contains(&(b.function.clone(), b.llvmir_label.clone())))
                        || b.llvmir_label == next_tuple.1){
                        succ_found = true;
                        key = *s;
                    }
                }
                if !succ_found {
                    let err_msg = format!("could not find successor after table branch in {:?}", key);
                    return Err(err_msg.clone());
                }
            }
            else {
                assert!(current_block.successors.len() <= 2);
                self.print_if_verbose(format!("performing conditional branch in: {} in function {} (tuple: {:?})", 
                    current_block.llvmir_label, current_block.function, key));
                //Pop the block stack until we find the current block
                while !(*self.block_stack.last().unwrap().0 == current_block.function.clone() &&
                        *self.block_stack.last().unwrap().1 == current_block.llvmir_label.clone()){
                    if self.block_stack.len() == 0 {
                        return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                    }
                    if self.settings.verbose {
                        println!("{:?}", self.block_stack.pop());
                    }
                    else {
                        self.block_stack.pop();
                    }
                }
                //pop all the calls and find the next block
                while *self.block_stack.last().unwrap().0 == current_block.function.clone() &&
                        *self.block_stack.last().unwrap().1 == current_block.llvmir_label.clone() &&
                        self.block_stack.last().unwrap().2{
                    if self.block_stack.len() == 0 {
                        return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                    }
                    if self.settings.verbose {
                        println!("{:?}", self.block_stack.pop());
                    }
                    else {
                        self.block_stack.pop();
                    }
                }

                if self.block_stack.len() == 0 {
                    return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                }

                //pop once to find the next block
                if self.settings.verbose {
                    println!("{:?}", self.block_stack.pop());
                }
                else {
                    self.block_stack.pop();
                }

                let mut next_tuple = &self.block_stack[self.block_stack.len() - 1];
                self.print_if_verbose(format!("target tuple: {:?}", next_tuple));
                let mut succ_found = false;
                for s in &current_block.successors {
                    let b = self.block_map.get(s).unwrap();
                    //The label should not be shorter in the assembly code
                    if b.llvmir_label.len() < next_tuple.1.len() {
                        continue;
                    }
                    //The assembly label can be longer but we need to make sure it is not just another block
                    //for which our target block was a substring in the IR.
                    if b.function == next_tuple.0 && //function name has to be the same
                    ((b.llvmir_label[0..next_tuple.1.len()] == next_tuple.1 && !self.ir_label_set.contains(&(b.function.clone(), b.llvmir_label.clone())))
                        || b.llvmir_label == next_tuple.1){
                        self.print_if_verbose(format!("found ({}, {}), branching there", b.function, b.llvmir_label));
                        succ_found = true;
                        key = *s;
                        break;
                    }
                }
                if succ_found {
                    continue;
                }
                //Successor not found, check if we should return
                /*if current_block.conditional_return && current_block.function != next_tuple.0 {
                    return;
                }*/
                if current_block.conditional_return {
                    return Ok(());
                }

                self.print_if_verbose(format!("Could not find succcessor after block: {}", current_block.llvmir_label));

                
                loop {
                    //We should try to return
                    if next_tuple.0 != current_block.function {
                        self.print_if_verbose("attempting to return".to_string());
                        let first_path_to_return = self.unconditional_path_to_return(&current_block.successors[0], 0, upper_bound);
                        let second_path_to_return = self.unconditional_path_to_return(&current_block.successors[1], 0, upper_bound);
                        if first_path_to_return.0 && second_path_to_return.0 {
                            self.print_if_verbose("two paths return, selecting the correct one".to_string());
                            if first_path_to_return.1 > second_path_to_return.1 {
                                if upper_bound {
                                    key = current_block.successors[0];
                                }
                                else {
                                    key = current_block.successors[1];
                                }
                            }
                            else {
                                if upper_bound {
                                    key = current_block.successors[1];
                                }
                                else {
                                    key = current_block.successors[0];
                                }
                            }
                            self.print_if_verbose(format!("branching to {:?}", key));
                            break;
                        }
                        if first_path_to_return.0 {
                            key = current_block.successors[0];
                            break;
                        }
                        if second_path_to_return.0 {
                            key = current_block.successors[1];
                            break;
                        }
                        return Err("could not return".to_string());
                    }

                    if self.asm_label_set.contains(&(next_tuple.0.clone(), next_tuple.1.clone())) {
                        self.print_if_verbose(format!("attempting to find {:?}", next_tuple));
                        let first_path_to_label = self.unconditional_path_to_label(&current_block.successors[0], next_tuple.1.clone(), upper_bound);
                        let second_path_to_label = self.unconditional_path_to_label(&current_block.successors[1], next_tuple.1.clone(), upper_bound);
                        if first_path_to_label.0 && second_path_to_label.0 {
                            self.print_if_verbose("two paths to the target label, selecting the correct one".to_string());
                            if first_path_to_label.1 > second_path_to_label.1 {
                                if upper_bound {
                                    key = current_block.successors[0];
                                }
                                else {
                                    key = current_block.successors[1];
                                }
                            }
                            else {
                                if upper_bound {
                                    key = current_block.successors[1];
                                }
                                else {
                                    key = current_block.successors[0];
                                }
                            }
                            self.block_stack.push((current_block.function.clone(), current_block.llvmir_label.clone(), false));
                            self.print_if_verbose(format!("branching to {:?}", key));
                            break;
                        }
                        if first_path_to_label.0 {
                            key = current_block.successors[0];
                            self.print_if_verbose(format!("found {:?}, branching there", next_tuple));
                            self.block_stack.push((current_block.function.clone(), current_block.llvmir_label.clone(), false));
                            break;
                        }
                        if second_path_to_label.0 {
                            key = current_block.successors[1];
                            self.print_if_verbose(format!("found {:?}, branching there", next_tuple));
                            self.block_stack.push((current_block.function.clone(), current_block.llvmir_label.clone(), false));
                            break;
                        }
                        return Err("could not find path to label".to_string());
                    }

                    if self.block_stack.len() == 0 {
                        return Err(format!("block_stack empty in {} in function {}", current_block.llvmir_label, current_block.function));
                    }
                    
                    //pop once to find the next block
                    self.block_stack.pop();
                    next_tuple = &self.block_stack[self.block_stack.len() - 1];
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

    
    pub fn unconditional_path_to_return(&self, key: &(i32, i32), prev_cycles: u64, upper_bound: bool) -> (bool, u64) {
        let mut current_key = key;
        let mut current_cycles = prev_cycles;
        let mut current_block = self.block_map.get(key).unwrap();
        let mut current_block_cycles;

        if current_block.successors.len() == 0 {
            if upper_bound {
                current_block_cycles = current_block.ub_cycles;
            }
            else {
                current_block_cycles = current_block.lb_cycles;
            }
            return (true, prev_cycles + current_block_cycles);
        }

        else if current_block.successors.len() > 1 {
            return (false, 0);
        }

        while current_block.successors.len() == 1 {
            current_key = &current_block.successors[0];
            current_block = self.block_map.get(current_key).unwrap();
            if upper_bound {
                current_block_cycles = current_block.ub_cycles;
            }
            else {
                current_block_cycles = current_block.lb_cycles;
            }
            current_cycles += current_block_cycles;
        }

        current_block = self.block_map.get(current_key).unwrap();
        if upper_bound {
            current_block_cycles = current_block.ub_cycles;
        }
        else {
            current_block_cycles = current_block.lb_cycles;
        }
        current_cycles += current_block_cycles;

        if current_block.successors.len() == 0 {
            return (true, current_cycles);
        }

        return (false, 0);
    }


    pub fn unconditional_path_to_label(&self, key: &(i32, i32), label: String, upper_bound: bool) -> (bool, u64){
        let mut current_key = key;
        let mut current_cycles = 0;
        let mut current_block = self.block_map.get(current_key).unwrap();
        let mut current_block_cycles;

        if current_block.llvmir_label == label {
            return (true, 0);
        }

        else if current_block.successors.len() > 1 {
            //While one of the successors is from the same IR basic block, follow this path
            loop {
                let mut found_self = false;
                for s in &current_block.successors {
                    if self.block_map.get(s).unwrap().llvmir_label == current_block.llvmir_label {
                        if upper_bound {
                            current_block_cycles = current_block.ub_cycles;
                        }
                        else {
                            current_block_cycles = current_block.lb_cycles;
                        }
                        current_cycles += current_block_cycles;
                        current_key = s;
                        current_block = self.block_map.get(current_key).unwrap();

                        found_self = true;
                        break;
                    }
                }
                if !found_self && current_block.successors.len() > 1{
                    for s in &current_block.successors {
                        if self.block_map.get(s).unwrap().llvmir_label == label {
                            if upper_bound {
                                current_block_cycles = current_block.ub_cycles;
                            }
                            else {
                                current_block_cycles = current_block.lb_cycles;
                            }
                            current_cycles += current_block_cycles;
                            return (true, current_cycles);
                        }
                    }
                    return (false, 0);
                }
                if !found_self {
                    break;
                }
            }
        }

        while current_block.successors.len() == 1 && current_block.llvmir_label != label{
            current_key = &current_block.successors[0];
            current_block = self.block_map.get(current_key).unwrap();
            if upper_bound {
                current_block_cycles = current_block.ub_cycles;
            }
            else {
                current_block_cycles = current_block.lb_cycles;
            }
            current_cycles += current_block_cycles;
        }

        if current_block.llvmir_label == label {
            return (true, current_cycles);
        }

        return (false, 0);
    }


    fn print_if_verbose(&self, output: String) {
        if self.settings.verbose {
            println!("{}", output);
        }
    }

    

    pub fn print_maps(&mut self){
        for (key, value) in &self.block_map {
            println!("--map key is ({}, {})", key.0, key.1);
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

        println!("ir label set: ");
        for l in &self.ir_label_set {
            println!("{:?}", l);
        }

        println!("asm label set:"); 
        for l in &self.asm_label_set {
            println!("{:?}", l);
        }
    }
    
}