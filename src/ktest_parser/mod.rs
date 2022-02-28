use regex::Regex;
use std::fs;
use std::path::PathBuf;

use byteorder::{BigEndian, ReadBytesExt};

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

#[derive(Debug)]
#[allow(dead_code)]
pub struct KtestData {
    file_name: String,
    hdr: String,
    version: u32,
    args: Vec<String>,
    sym_argvs: u32,
    sym_argv_len: u32,
    objs: Vec<(String, Vec<u8>)>,
}

#[derive(Debug,Clone)]
#[allow(dead_code)]
pub struct Instructions {
    file_name: String,
    instr: Vec<(String, u32)>,
}

#[derive(Debug)]
#[allow(dead_code)]
pub struct Labels {
    pub file_name: String,
    pub labels: Vec<(String, String)>
}

impl KtestData {
    pub fn new(file_name: String, bytes: Vec<u8>) -> Result<KtestData, String> {
        //read header
        let read_hdr = std::str::from_utf8(&bytes[0..5]);
        if read_hdr.is_err() {
            return Err(read_hdr.unwrap_err().to_string());
        }
        let hdr = read_hdr.unwrap().to_string();
        if !hdr.eq("KTEST") {
            return Err("Header doesn't match KTEST".to_string());
        }

        //read version
        let mut version_as_bytes = &bytes[5..9];
        let read_version = version_as_bytes.read_u32::<BigEndian>();
        if read_version.is_err() {
            return Err(read_version.unwrap_err().to_string());
        }
        let version = read_version.unwrap();

        //read args
        let mut read = 9;
        let mut num_args_as_bytes = &bytes[read..read + 4];
        read += 4;
        let read_num_args = num_args_as_bytes.read_u32::<BigEndian>();
        if read_num_args.is_err() {
            return Err(read_num_args.unwrap_err().to_string());
        }
        let num_args = read_num_args.unwrap();
        let mut args = Vec::new();
        for _ in 0..num_args {
            let mut size_as_bytes = &bytes[read..read + 4];
            read += 4;
            let read_size = size_as_bytes.read_u32::<BigEndian>();
            if read_size.is_err() {
                return Err(read_size.unwrap_err().to_string());
            }
            let size = read_size.unwrap();
            args.push(
                std::str::from_utf8(&bytes[read..read + size as usize])
                    .unwrap()
                    .to_string(),
            );
            read += size as usize;
        }

        //idk what sym_argvs or sym_argv_len is
        let mut sym_argvs = 0;
        let mut sym_argv_len = 0;
        if version >= 2 {
            let mut sym_argvs_as_bytes = &bytes[read..read + 4];
            read += 4;
            let mut sym_argv_len_as_bytes = &bytes[read..read + 4];
            read += 4;
            let read_sym_argvs = sym_argvs_as_bytes.read_u32::<BigEndian>();
            let read_sym_argv_len = sym_argv_len_as_bytes.read_u32::<BigEndian>();
            if read_sym_argvs.is_err() {
                return Err(read_sym_argvs.unwrap_err().to_string());
            }
            if read_sym_argv_len.is_err() {
                return Err(read_sym_argv_len.unwrap_err().to_string());
            }
            sym_argvs = read_sym_argvs.unwrap();
            sym_argv_len = read_sym_argv_len.unwrap();
        }

        //read num objects
        let mut num_objs_as_bytes = &bytes[read..read + 4];
        read += 4;
        let read_num_objs = num_objs_as_bytes.read_u32::<BigEndian>();
        if read_num_objs.is_err() {
            return Err(read_num_objs.unwrap_err().to_string());
        }
        let num_objs = read_num_objs.unwrap();
        let mut objs = Vec::new();
        for _ in 0..num_objs {
            //get object name
            let mut size_as_bytes = &bytes[read..read + 4];
            read += 4;
            let read_size = size_as_bytes.read_u32::<BigEndian>();
            if read_size.is_err() {
                return Err(read_size.unwrap_err().to_string());
            }
            let size = read_size.unwrap();
            let convert_to_str = std::str::from_utf8(&bytes[read..read + size as usize]);
            if convert_to_str.is_err() {
                return Err(convert_to_str.unwrap_err().to_string());
            }
            let name = convert_to_str.unwrap();
            read += size as usize;

            //get object contents
            size_as_bytes = &bytes[read..read + 4];
            let read_size = size_as_bytes.read_u32::<BigEndian>();
            if read_size.is_err() {
                return Err(read_size.unwrap_err().to_string());
            }
            let size = read_size.unwrap();
            read += 4;
            let obj_size_as_bytes = &bytes[read..read + size as usize];
            read += size as usize;
            objs.push((name.to_string(), obj_size_as_bytes.to_vec()))
        }
        Ok(KtestData {
            file_name,
            hdr,
            version,
            args,
            sym_argvs,
            sym_argv_len,
            objs,
        })
    }
}

impl Instructions {
    pub fn new(file_name: String, file_contents: String) -> Result<Instructions, String> {
        let rows: Vec<&str> = file_contents.split("\n").collect();
        let mut instr = Vec::new();
        for row in rows {
            let mut splits = row.split(" : ");
            let name_split = splits.next();
            if name_split.is_none() {
                return Err("Cannot parse: ".to_string() + &file_name);
            }
            let nmbr_split = splits.next();
            if nmbr_split.is_none() {
                return Err("Cannot parse: ".to_string() + &file_name);
            }
            let convert = nmbr_split.unwrap().parse::<u32>();
            if convert.is_err() {
                return Err("Cannot parse: ".to_string() + &file_name);
            }
            let name = name_split.unwrap().to_string();
            let nmbr = convert.unwrap();
            instr.push((name,nmbr));
        }
        Ok(
            Instructions {
                file_name,
                instr
            }
        )
    }
    pub fn getInstructions(self) -> Vec<(String,u32)> {
        self.instr
    }

    pub fn getFilename(self) -> String {
        self.file_name
    }
}

impl Labels {
    pub fn new(file_name: String, file_contents: String) -> Result<Labels, String> {
        let mut labels = Vec::new();
        let labels_str: Vec<&str> = file_contents.split(" ").collect();
        for l in labels_str {
            let split: Vec<&str> = l.split("|").collect();
            labels.push((split[1].to_string(), split[0].to_string()))
        }
        Ok(
            Labels {
                file_name,
                labels
            }
        )
    }
}

pub fn read_ktests(path: PathBuf) -> Result<Vec<KtestData>, String> {
    let dir_read_res = path.read_dir();
    let mut ktests = Vec::new();
    match dir_read_res {
        Ok(read_dir) => {
            for file_read_res in read_dir {
                match file_read_res {
                    Ok(file) => {
                        let validator = Regex::new(r".+[.]ktest").unwrap();
                        if validator.is_match(file.file_name().to_str().unwrap()) {
                            let file_content_read_res = fs::read(file.path());
                            if file_content_read_res.is_err() {
                                return Err(file_content_read_res.unwrap_err().to_string());
                            }
                            let obj = KtestData::new(
                                file.file_name().to_str().unwrap().to_string(),
                                file_content_read_res.unwrap(),
                            );
                            if obj.is_err() {
                                return Err(obj.unwrap_err());
                            }
                            ktests.push(obj.unwrap());
                        }
                    }
                    Err(msg) => return Err(msg.to_string()),
                }
            }
            Ok(ktests)
        }
        Err(msg) => Err(msg.to_string()),
    }
}

pub fn read_instr(path: PathBuf) -> Result<Vec<Instructions>, String> {
    let dir_read_res = path.read_dir();
    let mut instr_files = Vec::new();
    match dir_read_res {
        Ok(read_dir) => {
            for file_read_res in read_dir {
                match file_read_res {
                    Ok(file) => {
                        let validator = Regex::new(r".+[.]instructions").unwrap();
                        if validator.is_match(file.file_name().to_str().unwrap()) {
                            let file_content_read_res = fs::read_to_string(file.path());
                            if file_content_read_res.is_err() {
                                return Err(file_content_read_res.unwrap_err().to_string());
                            }
                            let obj = Instructions::new(
                                file.file_name().to_str().unwrap().to_string(),
                                file_content_read_res.unwrap(),
                            );
                            if obj.is_err() {
                                return Err(obj.unwrap_err());
                            }
                            instr_files.push(obj.unwrap());
                        }
                    }
                    Err(msg) => return Err(msg.to_string()),
                }
            }
            Ok(instr_files)
        }
        Err(msg) => Err(msg.to_string()),
    }
}

pub fn read_labels(path: PathBuf) -> Result<Vec<Labels>, String> {
    let dir_read_res = path.read_dir();
    let mut label_files = Vec::new();
    match dir_read_res {
        Ok(read_dir) => {
            for file_read_res in read_dir {
                match file_read_res {
                    Ok(file) => {
                        let validator = Regex::new(r".+[.]labels").unwrap();
                        if validator.is_match(file.file_name().to_str().unwrap()) {
                            let file_content_read_res = fs::read_to_string(file.path());
                            if file_content_read_res.is_err() {
                                return Err(file_content_read_res.unwrap_err().to_string());
                            }
                            let obj = Labels::new(
                                file.file_name().to_str().unwrap().to_string(),
                                file_content_read_res.unwrap(),
                            );
                            if obj.is_err() {
                                return Err(obj.unwrap_err());
                            }
                            label_files.push(obj.unwrap());
                        }
                    }
                    Err(msg) => return Err(msg.to_string()),
                }
            }
            Ok(label_files)
        }
        Err(msg) => Err(msg.to_string()),
    }
}
