use regex::Regex;
use std::fs;
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;
use std::collections::HashMap;

pub struct Labeler {
    label_map: HashMap<(String, u32), String>,
}

impl Labeler {
    pub fn new() -> Labeler {
        Labeler {
            label_map: HashMap::new(),        
        }
    }

    pub fn rename_declarations(&mut self, file_contents: String) -> String{
        let mut delta: u32 = 0;
        let mut fn_nr: u32 = 0;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        let mut new_rows = Vec::new();
        let numbered_block = Regex::new(r"(?P<x>[0-9]+):\D").unwrap();
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
                    number = cap[1].to_string().clone();
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

            new_rows.push(new_row);

        }


        let mut ret: String = "".to_string();
        for l in new_rows {
            ret = format!("{}\n{}", ret, l);
        }
        ret
    }


    //Renames the uses of register after the first pass has been done
    pub fn rename_uses(&mut self, file_contents: String) -> String {
        let mut fn_nr: u32 = 0;
        let rows: Vec<&str> = file_contents.split("\n").collect();
        let mut new_rows = Vec::new();
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
                        let mut new_s = s.to_string();
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
            new_rows.push(new_row);

        }

        let mut ret: String = "".to_string();
        for l in new_rows {
            ret = format!("{}\n{}", ret, l);
        }
        ret

    }

    pub fn relabel_row(&mut self, row: String, fn_nr: &u32) -> String {
        let mut start_index: usize = 0;
        let mut end_index: usize = 0;
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
                    if i == row.len()-1{
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
                        if number_as_string.eq("22") {
                            println!("replacement for 22: {}", replacement);
                            println!("indices: {} and {}", actual_start_index, actual_end_index);
                            println!("full row: \n{}", row_clone);
                        }
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
                                let first_pass = self.rename_declarations(file_content_read_res.unwrap());
                                let second_pass = self.rename_uses(first_pass);
                                return Ok(second_pass);

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

    pub fn save_file(&mut self, path: &PathBuf, file_name: &str, file_contents: String) {
        let file_name_split: Vec<&str> = file_name.split(".").collect();
        let path_clone = path.clone();
        let new_name = format!("{}_labeled.{}", path_clone.join(file_name_split[0]).to_str().unwrap(), file_name_split[1]);
        //let mut file = File::create(new_name).unwrap();
        //file.write_all(file_contents);
        //file.write(file_contents);
        fs::write(new_name, file_contents).unwrap();
    }
}