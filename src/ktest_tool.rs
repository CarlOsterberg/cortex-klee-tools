use std::{path::{PathBuf}};
use regex::Regex;
use std::fs;

use byteorder::{BigEndian, ReadBytesExt};

//https://github.com/klee/klee/blob/master/tools/ktest-tool/ktest-tool

#[derive(Debug)]
pub struct KtestData {
    hdr: String,
    version: u32,
    args: Vec<String>,
    sym_argvs: u32,
    sym_argv_len: u32,
    objs: Vec<(String, Vec<u8>)>,
}

impl KtestData {
    pub fn new(bytes: Vec<u8>) -> Result<KtestData, String> {

        //read header
        let read_hdr= std::str::from_utf8(&bytes[0..5]);
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
        let mut num_args_as_bytes = &bytes[read..read+4];
        read += 4;
        let read_num_args = num_args_as_bytes.read_u32::<BigEndian>();
        if read_num_args.is_err() {
            return Err(read_num_args.unwrap_err().to_string());
        }
        let num_args = read_num_args.unwrap();
        let mut args = Vec::new();
        for _ in 0..num_args  {
            let mut size_as_bytes = &bytes[read..read+4];
            read += 4;
            let read_size = size_as_bytes.read_u32::<BigEndian>();
            if read_size.is_err() {
                return Err(read_size.unwrap_err().to_string());
            }
            let size = read_size.unwrap();
            args.push(std::str::from_utf8(&bytes[read..read + size as usize]).unwrap().to_string());
            read += size as usize;
        }

        //idk what sym_argvs or sym_argv_len is
        let mut sym_argvs = 0;
        let mut sym_argv_len = 0;
        if version >= 2 {
            let mut sym_argvs_as_bytes = &bytes[read..read+4];
            read += 4;
            let mut sym_argv_len_as_bytes = &bytes[read..read+4];
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
        let mut num_objs_as_bytes = &bytes[read..read+4];
        read +=4;
        let read_num_objs = num_objs_as_bytes.read_u32::<BigEndian>();
        if read_num_objs.is_err() {
            return Err(read_num_objs.unwrap_err().to_string());
        }
        let num_objs = read_num_objs.unwrap();
        let mut objs = Vec::new();
        for _ in 0..num_objs {

            //get object name
            let mut size_as_bytes = &bytes[read..read+4];
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
            size_as_bytes = &bytes[read..read+4];
            let read_size = size_as_bytes.read_u32::<BigEndian>();
            if read_size.is_err() {
                return Err(read_size.unwrap_err().to_string());
            }
            let size = read_size.unwrap();
            read += 4;
            let obj_size_as_bytes = &bytes[read..read + size as usize];
            read += size as usize;
            objs.push((name.to_string(),obj_size_as_bytes.to_vec()))
        }
        Ok(KtestData {
            hdr,
            version,
            args,
            sym_argvs,
            sym_argv_len,
            objs,
        })
    }
}

pub fn read_klee_folder(path: PathBuf) -> Result<Vec<KtestData>,String> {
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
                            let obj = KtestData::new(file_content_read_res.unwrap());
                            if obj.is_err() {
                                return Err(obj.unwrap_err());
                            }
                            ktests.push(obj.unwrap());
                        }
                    },
                    Err(msg) => return Err(msg.to_string())
                }
            }
            Ok(ktests)
        },
        Err(msg) => Err(msg.to_string())
    }
}