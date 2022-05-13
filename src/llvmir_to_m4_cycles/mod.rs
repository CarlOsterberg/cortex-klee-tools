pub(crate) mod cortex_m4;
pub(crate) mod llvm_ir;
use crate::ktest_parser::{self, Instructions};

use std::{path::{PathBuf}, fs, vec};

use self::{llvm_ir::LlvmIr, cortex_m4::{CortexM4}};

#[allow(dead_code)]
#[derive(Clone,Debug)]
pub struct IrToM4 {
    overwrite_n: Option<u32>,
    llvm_ir: LlvmIr,
    cortex_wc: Vec<CortexM4>,
    cortex_bc: Vec<CortexM4>,
}

#[allow(dead_code)]
impl IrToM4 {
    pub fn new(llvm_ir: &str) -> IrToM4 {
        match LlvmIr::from_string(llvm_ir) {
            Some((LlvmIr::Ret, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Ret,
                cortex_wc: vec![CortexM4::PUSH, CortexM4::ADDreg, CortexM4::SUB ,CortexM4::ADDreg, CortexM4::POPpc],
                cortex_bc: vec![],
            },
            Some((LlvmIr::Br, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Br,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B]
            },
            Some((LlvmIr::BrIl, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::BrIl,
                cortex_wc: vec![CortexM4::Bcc],
                cortex_bc: vec![CortexM4::Bcc]
            },
            Some((LlvmIr::IndirectBr, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::IndirectBr,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            Some((LlvmIr::Switch, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Switch,
                cortex_wc: vec![CortexM4::TBB],
                cortex_bc: vec![CortexM4::TBB],
            },
            Some((LlvmIr::_Unreachable, _))  => todo!(),
            Some((LlvmIr::_Invoke, _))  => todo!(),
            Some((LlvmIr::Call, overwrite_n))  => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Call,
                cortex_wc: vec![CortexM4::BL],
                cortex_bc: vec![CortexM4::BL],
            },
            Some((LlvmIr::PHI, overwrite_n))  => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::PHI,
                cortex_wc: vec![CortexM4::LDRreg,CortexM4::STR],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::Select, overwrite_n))  => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Select,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg],
            },
            Some((LlvmIr::VAArg, _)) => todo!(),
            Some((LlvmIr::Add, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Add,
                cortex_wc: vec![CortexM4::ADDreg],
                cortex_bc: vec![CortexM4::ADDreg],
            },
            Some((LlvmIr::Sub, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Sub,
                cortex_wc: vec![CortexM4::SUB],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some((LlvmIr::Mul, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Mul,
                cortex_wc: vec![CortexM4::MUL],
                cortex_bc: vec![CortexM4::MUL],
            },
            Some((LlvmIr::UDiv, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::UDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some((LlvmIr::SDiv, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::SDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some((LlvmIr::URem, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::URem,
                cortex_wc: vec![CortexM4::UDIV, CortexM4::SUB],
                cortex_bc: vec![CortexM4::UDIV, CortexM4::SUB],
            },
            Some((LlvmIr::SRem, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::SRem,
                cortex_wc: vec![CortexM4::UDIV, CortexM4::SUB],
                cortex_bc: vec![CortexM4::UDIV, CortexM4::SUB],
            },
            Some((LlvmIr::And, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::And,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            Some((LlvmIr::Or, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Or,
                cortex_wc: vec![CortexM4::ORR],
                cortex_bc: vec![CortexM4::ORR],
            },
            Some((LlvmIr::Xor, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Xor,
                cortex_wc: vec![CortexM4::EOR],
                cortex_bc: vec![CortexM4::EOR],
            },
            Some((LlvmIr::Shl, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Shl,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            Some((LlvmIr::LShr, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::LShr,
                cortex_wc: vec![CortexM4::LSR],
                cortex_bc: vec![CortexM4::LSR],
            },
            Some((LlvmIr::AShr, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::AShr,
                cortex_wc: vec![CortexM4::ASR],
                cortex_bc: vec![CortexM4::ASR],
            },
            Some((LlvmIr::ICmp, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::ICmp,
                cortex_wc: vec![CortexM4::CMP],
                cortex_bc: vec![CortexM4::CMP],
            },
            Some((LlvmIr::Alloca, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Alloca,
                cortex_wc: vec![CortexM4::MOVT,CortexM4::MOVW],
                cortex_bc: vec![CortexM4::MOVreg],
            },
            Some((LlvmIr::Load, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Load,
                cortex_wc: vec![CortexM4::LDRreg],
                cortex_bc: vec![CortexM4::LDRreg],
            },
            Some((LlvmIr::Store, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Store,
                cortex_wc: vec![CortexM4::STR],
                cortex_bc: vec![CortexM4::STR],
            },
            Some((LlvmIr::GetElementPtr, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::GetElementPtr,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg],
            },
            Some((LlvmIr::Trunc, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Trunc,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            Some((LlvmIr::ZExt, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::ZExt,
                cortex_wc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
            },
            Some((LlvmIr::SExt, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::SExt,
                cortex_wc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
            },
            //check this more thoroughly
            Some((LlvmIr::IntToPtr, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::IntToPtr,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::PtrToInt, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::PtrToInt,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            //BitCast changes type without changing any bits, 
            //no bit changes or extendsions means no assembly
            Some((LlvmIr::BitCast, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::BitCast,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            Some((LlvmIr::FNeg, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FNeg,
                cortex_wc: vec![CortexM4::SUB],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some((LlvmIr::FAdd, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FAdd,
                cortex_wc: vec![CortexM4::ADDreg],
                cortex_bc: vec![CortexM4::ADDreg],
            },
            Some((LlvmIr::FSub, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FSub,
                cortex_wc: vec![CortexM4::SUB],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some((LlvmIr::FMul, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FMul,
                cortex_wc: vec![CortexM4::MUL],
                cortex_bc: vec![CortexM4::MUL],
            },
            Some((LlvmIr::FDiv, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],

            },
            Some((LlvmIr::FRem, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FRem,
                cortex_wc: vec![CortexM4::UDIV, CortexM4::SUB],
                cortex_bc: vec![CortexM4::UDIV, CortexM4::SUB],
            },
            //check this more thoroughly
            Some((LlvmIr::FPTrunc, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FPTrunc,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg],
            },
            Some((LlvmIr::FPExt, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FPExt,
                cortex_wc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
                cortex_bc: vec![CortexM4::MOVreg,CortexM4::MOVreg],
            },
            Some((LlvmIr::FPToUI, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FPToUI,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::FPToSI, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FPToSI,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::UIToFP, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::UIToFP,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::SIToFP, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::SIToFP,
                cortex_wc: vec![CortexM4::MOVreg],
                cortex_bc: vec![],
            },
            Some((LlvmIr::FCmp, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::FCmp,
                cortex_wc: vec![CortexM4::CMP],
                cortex_bc: vec![CortexM4::CMP],
            },
            //check this more thoroughly
            Some((LlvmIr::InsertValue, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::InsertValue,
                cortex_wc: vec![CortexM4::PUSH],
                cortex_bc:vec![CortexM4::PUSH],
            },
            //check this more thoroughly
            Some((LlvmIr::ExtractValue, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::ExtractValue,
                cortex_wc: vec![CortexM4::POP],
                cortex_bc: vec![CortexM4::POP]
            },
            //check this more thoroughly
            Some((LlvmIr::Fence, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::Fence,
                cortex_wc: vec![],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some((LlvmIr::InsertElement, overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::InsertElement,
                cortex_wc: vec![CortexM4::PUSH],
                cortex_bc: vec![CortexM4::PUSH],
            },
            //check this more thoroughly
            Some((LlvmIr::ExtractElement , overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::ExtractElement,
                cortex_wc: vec![CortexM4::POP],
                cortex_bc: vec![CortexM4::POP]

            },
            //check this more thoroughly
            Some((LlvmIr::ShuffleVector , overwrite_n)) => IrToM4 {
                overwrite_n,
                llvm_ir: LlvmIr::ShuffleVector,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            //In Klee this just crashes
            Some((LlvmIr::AtomicRMW , _overwrite_n)) => todo!(),
            //In Klee this just crashes
            Some((LlvmIr::AtomicCmpXchg , _overwrite_n)) => todo!(),
            None => todo!(),
        }
    }
    pub fn get_upper(self, b:u32, mut n:u32, w:u32) -> u32 {
        if self.overwrite_n.is_some() {
            n = self.overwrite_n.unwrap();
        }
        self.cortex_wc.into_iter().map(|x|x.get_upper(b,n,w)).sum()
    }

    pub fn get_lower(self, b:u32, mut n:u32, w:u32) -> u32 {
        if self.overwrite_n.is_some() {
            n = self.overwrite_n.unwrap();
        }
        self.cortex_bc.into_iter().map(|x|x.get_lower(b,n,w)).sum()
    }

    pub fn read_file(path: PathBuf) -> Result<(String,Vec<IrToM4>),String> {
        let mut ir_to_m4 = Vec::new();
        let file = fs::read_to_string(path.clone());
        match file {
            Ok(contents) => {
                let filename = path.file_name().unwrap().to_str().unwrap().to_string();
                match Instructions::new(filename, contents) {
                    Ok(instructions) => {
                        for (instruction,nmbr) in instructions.clone().get_instructions(){
                            let conv_obj = IrToM4::new(&instruction);
                            for _ in 0..nmbr {
                                ir_to_m4.push(conv_obj.clone()); 
                            }
                        }
                        Ok((instructions.get_filename(),ir_to_m4))
                    }
                    Err(msg) => Err(msg),
                }
            },
            Err(msg) => Err(msg.to_string())
        }
    }

    pub fn read_dir(path: PathBuf) -> Result<Vec<(String,Vec<IrToM4>)>,String> {
        let mut parsed_vectors = Vec::new();
        match ktest_parser::read_instr(path) {
            Ok(instr_obj_vec) => {
                for instr_obj in instr_obj_vec {
                    let mut ir_to_m4_vec = Vec::new();
                    for (instruction,nmbr) in instr_obj.clone().get_instructions(){
                        let conv_obj = IrToM4::new(&instruction);
                        for _ in 0..nmbr {
                            ir_to_m4_vec.push(conv_obj.clone()); 
                        }
                    };
                    parsed_vectors.push((instr_obj.get_filename(),ir_to_m4_vec))
                }
                Ok(parsed_vectors)
            }
            Err(msg) => Err(msg),
        }
    }
}