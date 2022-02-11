use regex::Regex;
use std::fs;
use std::ops::Add;
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
                println!("replacing {} with {}", number, new_label);
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
                println!("attempting sub with {} and {}", number_as_u32, delta);
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
                        /*let mut number;
                        for cap in use_of_reg.captures_iter(s) {
                            number = cap[1].to_string().clone();
                            if self.label_map.contains_key(&(number.clone(), fn_nr)) {
                                let mut number_clone = number.clone();
                                //If the reg. nr has changed it should be in the map
                                //parts.push(use_of_reg.replace_all(s, self.label_map.get(&(number, fn_nr)).unwrap()).to_string());
                                let mut replacement = self.label_map.get(&(number, fn_nr)).unwrap().to_string();
                                replacement = format!("%{}", replacement);
                                //parts.push(use_of_reg.replace_all(s, replacement).to_string());
                                //new_s = use_of_reg.replace_all(&new_s, replacement).to_string();
                                //FIX THIS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                number_clone = format!("%{}", number_clone);
                                new_s = str::replace(&new_s, &number_clone, &replacement);
                            }
                        }*/
                        //parts.push(new_s.to_string());
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
                    /*let mut number;
                    for cap in use_of_reg.captures_iter(row) {
                        number = cap[1].to_string().clone();
                        if self.label_map.contains_key(&(number.clone(), fn_nr)) {
                            let mut number_clone = number.clone();
                            //If the reg. nr has changed it should be in the map
                            //new_row = use_of_reg.replace_all(row, self.label_map.get(&(number, fn_nr)).unwrap()).to_string();
                            let mut replacement = self.label_map.get(&(number, fn_nr)).unwrap().to_string();
                            replacement = format!("%{}", replacement);
                            //new_row = use_of_reg.replace_all(row, replacement).to_string();
                            //FIX THIS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                            number_clone = format!("%{}", number_clone);
                            new_row = str::replace(&row, &number_clone, &replacement);

                        }
                    }*/
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
        let mut start_index = 0;
        let mut end_index = 0;
        let mut found_percent = false;
        let mut number_as_string = "".to_string();
        let mut row_clone = row.clone();
        let mut index_delta = 0;      
        for (i, c) in row.chars().enumerate() {
            if found_percent {
                if c.is_numeric() {
                    number_as_string = format!("{}{}", number_as_string, c);
                }
                else {
                    end_index = i;
                    found_percent = false;
                    //check if number is in the map and replace
                    if self.label_map.contains_key(&(number_as_string.clone(), *fn_nr)) {
                        let replacement = self.label_map.get(&(number_as_string.clone(), *fn_nr)).unwrap();
                        row_clone.replace_range((start_index + index_delta)..(end_index + index_delta), replacement);
                        index_delta += replacement.len();
                        if index_delta >= (end_index - start_index){
                            index_delta -= (end_index - start_index);
                        }
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

    pub fn label_file(&mut self, path: PathBuf) -> Result<String, String> {
        let dir_read_res = path.read_dir();
        let validator = Regex::new(r"assembly.ll").unwrap();
        match dir_read_res {
            Ok(read_dir) => {
                for file_read_res in read_dir {
                    match file_read_res {
                        Ok(file) => {
                            if validator.is_match(file.file_name().to_str().unwrap()) {
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
}