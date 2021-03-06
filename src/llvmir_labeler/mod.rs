use regex::Regex;
use std::fs;
use std::path::PathBuf;
use std::collections::HashMap;

#[allow(dead_code)]
pub struct Labeler {
    pub label_map: HashMap<(String, i32), String>,
    pub file_content: String,
}

#[allow(dead_code)]
impl Labeler {
    pub fn new() -> Labeler {
        Labeler {
            label_map: HashMap::new(),
            file_content: "".to_string(),        
        }
    }

    pub fn rename_declarations(&mut self){
        let mut delta: u32 = 0;
        let mut fn_nr: i32 = -1;
        let file_content_clone = self.file_content.clone();
        self.file_content = "".to_string();
        let rows: Vec<&str> = file_content_clone.split("\n").collect();
        let numbered_block = Regex::new(r"^(\s*)(?P<x>[0-9]+):\D").unwrap();
        let assignment = Regex::new(r"%(?P<x>[0-9]+)(\s*)=").unwrap();
        let fn_def = Regex::new(r"define").unwrap();
        for row in rows {
            let mut new_row = row.to_string();

            if fn_def.is_match(row) {
                delta = 0;
                fn_nr += 1;
            }

            else if numbered_block.is_match(row) {
                let mut number: String = "".to_string();
                for cap in numbered_block.captures_iter(row) {
                    number = cap[2].to_string().clone();
                    break;
                }
                let new_label = format!(".customlabel{}", delta);
                let replacement = format!("{}:", new_label);
                self.label_map.insert((number.to_string(), fn_nr), new_label.to_string());
                delta += 1;
                new_row = numbered_block.replace_all(row, replacement).to_string();
            }

            else if assignment.is_match(row) {
                let mut number: String = "".to_string();
                for cap in assignment.captures_iter(row) {
                    number = cap[1].to_string().clone();
                    break;
                }
                let mut number_as_u32 :u32 = number.parse().expect("expected number");
                number_as_u32 = number_as_u32 - delta;
                self.label_map.insert((number.to_string(), fn_nr), number_as_u32.to_string());
                let replacement = format!("%{} =", number_as_u32);
                new_row = assignment.replace_all(row, replacement).to_string();
            }
            self.file_content.push_str(&new_row);
            self.file_content.push_str("\n");

        }
    }


    //Renames the uses of register after the first pass has been done
    pub fn rename_uses(&mut self) {
        let mut fn_nr: i32 = -1;
        let file_content_clone = self.file_content.clone();
        self.file_content = "".to_string();
        let rows: Vec<&str> = file_content_clone.split("\n").collect();
        let use_of_reg = Regex::new(r"%(?P<x>[0-9]+)").unwrap();
        let assignment = Regex::new(r"%(?P<x>[0-9]+)(\s*)=").unwrap();
        let fn_def = Regex::new(r"define").unwrap();
        for row in rows {
            let mut new_row = row.to_string();

            if fn_def.is_match(row) {
                fn_nr += 1;
            }
            else if use_of_reg.is_match(row) {
                if assignment.is_match(row) {
                    let split = row.split("=");
                    let mut i = 0;
                    let mut parts = Vec::new();
                    for s in split{
                        if i == 0 {
                            //ignore the register being assigned to
                            i += 1;
                            parts.push(s.to_string());
                            continue;
                        }
                        parts.push(self.relabel_row(s.to_string(), &fn_nr));
                    }
                    i = 0;
                    for p in parts {
                        if i == 0 {
                            new_row = p;
                            i += 1;
                            continue;
                        }
                        new_row = format!("{}={}", new_row, p)
                    }
                }
                else {
                    new_row = self.relabel_row(row.to_string(), &fn_nr)
                }
            }
            self.file_content.push_str(&new_row);
            self.file_content.push_str("\n");

        }
    }

    pub fn relabel_row(&mut self, row: String, fn_nr: &i32) -> String {
        let mut start_index: usize = 0;
        let mut end_index: usize;
        let mut found_percent = false;
        let mut number_as_string = "".to_string();
        let mut row_clone = row.clone();
        let mut index_delta: i32 = 0;      
        for (i, c) in row.chars().enumerate() {
            if found_percent {
                if c.is_numeric() {
                    number_as_string = format!("{}{}", number_as_string, c);
                }
                if !c.is_numeric() || i == row.len()-1{
                    if i == row.len()-1 && c.is_numeric(){
                        end_index = i + 1;
                    }
                    else{
                        end_index = i;
                    }
                    found_percent = false;
                    //check if number is in the map and replace
                    if self.label_map.contains_key(&(number_as_string.clone(), *fn_nr)) {
                        let replacement = self.label_map.get(&(number_as_string.clone(), *fn_nr)).unwrap();
                        let actual_start_index = (start_index as i32 + index_delta) as usize;
                        let actual_end_index = (end_index as i32 + index_delta) as usize;
                        row_clone.replace_range(actual_start_index..actual_end_index, replacement);
                        index_delta += replacement.len() as i32;
                        index_delta -= (end_index - start_index) as i32;
                    }
                    number_as_string = "".to_string();
                }
            }
            if c == '%' {
                found_percent = true;
                start_index = i + 1;
            }

        }
        return row_clone;
    }

    pub fn label_file(&mut self, path: &PathBuf, file_name: &str) -> Result<String, String> {
        let dir_read_res = path.read_dir();
        //let validator = Regex::new(r"assembly_reg_ex.ll").unwrap();
        match dir_read_res {
            Ok(read_dir) => {
                for file_read_res in read_dir {
                    match file_read_res {
                        Ok(file) => {
                            //if validator.is_match(file.file_name().to_str().unwrap()) {
                            if file_name.eq(file.file_name().to_str().unwrap()) {
                                let file_content_read_res = fs::read_to_string(file.path());
                                if file_content_read_res.is_err() {
                                    return Err(file_content_read_res.unwrap_err().to_string());
                                }
                                self.file_content = file_content_read_res.unwrap();
                                println!("starting first pass");
                                self.rename_declarations();
                                println!("starting second pass");
                                self.rename_uses();
                                return Ok("".to_string());

                            }
                        }
                        Err(msg) => return Err(msg.to_string()),
                    }
                }
                return Err("file not found".to_string());
            }
            Err(msg) => Err(msg.to_string()),
        }
    }

    pub fn save_file(&mut self, path: &PathBuf, file_name: &str) {
        let file_name_split: Vec<&str> = file_name.split(".").collect();
        let path_clone = path.clone();
        let new_name = format!("{}_labeled.{}", path_clone.join(file_name_split[0]).to_str().unwrap(), file_name_split[1]);
        fs::write(new_name, self.file_content.clone()).unwrap();
        println!("saved labeled file");
    }

    pub fn print_map(&mut self){
        for (key, value) in &self.label_map {
            println!("--map key is ({}, {})", key.0, key.1);
            println!("value is {}", value);
        }
    }
}