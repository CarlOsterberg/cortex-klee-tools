use regex::Regex;
use std::fs;
use std::path::PathBuf;
use std::collections::HashMap;

pub struct Labeler {
    label_map: HashMap<String, String>,
    delta: u32,
}

impl Labeler {
    pub fn new() -> Labeler {
        Labeler {
            label_map: HashMap::new(),
            delta: 0,
        }
    }

    pub fn rename_declarations(&mut self, file_contents: String) -> String{
        let rows: Vec<&str> = file_contents.split("\n").collect();
        let mut new_rows = Vec::new();
        let numbered_block = Regex::new(r"(?P<x>[0-9]+):\D").unwrap();
        let assignment = Regex::new(r"%(?P<x>[0-9]+)(\s*)=").unwrap();
        let fn_def = Regex::new(r"define").unwrap();
        for row in rows {
            let mut new_row = row.to_string();

            if fn_def.is_match(row) {
                self.delta = 0;
            }

            else if numbered_block.is_match(row) {
                let mut number: String = "".to_string();
                for cap in numbered_block.captures_iter(row) {
                    number = cap[1].to_string().clone();
                    break;
                }
                let new_label = format!(".customlabel{}", self.delta);
                let replacement = format!("{}:", new_label);
                println!("replacing {} with {}", number, new_label);
                self.label_map.insert(number.to_string(), new_label.to_string());
                self.delta += 1;
                new_row = numbered_block.replace_all(row, replacement).to_string();
            }

            else if assignment.is_match(row) {
                let mut number: String = "".to_string();
                for cap in assignment.captures_iter(row) {
                    number = cap[1].to_string().clone();
                    break;
                }
                let mut number_as_u32 :u32 = number.parse().expect("expected number");
                println!("attempting sub with {} and {}", number_as_u32, self.delta);
                number_as_u32 = number_as_u32 - self.delta;
                self.label_map.insert(number.to_string(), number_as_u32.to_string());
                let replacement = format!("%{}", number_as_u32);
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


    #[allow(dead_code, unused_variables)]
    pub fn rename_uses(&mut self, file_contents: String) {

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
                                return Ok(self.rename_declarations(file_content_read_res.unwrap()));

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