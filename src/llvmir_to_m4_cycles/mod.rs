mod cortex_m4;
pub(crate) mod llvm_ir;
use crate::ktest_parser::{self, Instructions};

use std::{path::{PathBuf, self}, fs};

use self::{llvm_ir::LlvmIr, cortex_m4::CortexM4};

#[derive(Clone,Debug)]
pub struct IrToM4 {
    llvm_ir: LlvmIr,
    cortex_rep: Vec<CortexM4>,
}

impl IrToM4 {
    pub fn new(llvm_ir: &str) -> IrToM4 {
        match LlvmIr::fromString(llvm_ir) {
            Some(LlvmIr::Ret) => IrToM4 {
                llvm_ir: LlvmIr::Ret,
                cortex_rep: vec![CortexM4::Add, CortexM4::Move],
            },
            Some(LlvmIr::Br) => IrToM4 {
                llvm_ir: LlvmIr::Br,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::IndirectBr) => IrToM4 {
                llvm_ir: LlvmIr::IndirectBr,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::Switch) => IrToM4 {
                llvm_ir: LlvmIr::Switch,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::Unreachable)  => todo!(),
            Some(LlvmIr::Invoke)  => todo!(),
            Some(LlvmIr::Call)  => IrToM4 {
                llvm_ir: LlvmIr::Call,
                cortex_rep: vec![CortexM4::Add, CortexM4::Move, CortexM4::Branch],
            },
            Some(LlvmIr::PHI)  => IrToM4 {
                llvm_ir: LlvmIr::PHI,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::Select)  => IrToM4 {
                llvm_ir: LlvmIr::Select,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::VAArg) => IrToM4 {
                llvm_ir: LlvmIr::VAArg,
                cortex_rep: vec![CortexM4::Branch],
            },
            Some(LlvmIr::Add) => IrToM4 {
                llvm_ir: LlvmIr::Add,
                cortex_rep: vec![CortexM4::Add],
            },
            Some(LlvmIr::Sub) => IrToM4 {
                llvm_ir: LlvmIr::Sub,
                cortex_rep: vec![CortexM4::Subtract],
            },
            Some(LlvmIr::Mul) => IrToM4 {
                llvm_ir: LlvmIr::Mul,
                cortex_rep: vec![CortexM4::Multiply],
            },
            Some(LlvmIr::UDiv) => IrToM4 {
                llvm_ir: LlvmIr::UDiv,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::SDiv) => IrToM4 {
                llvm_ir: LlvmIr::SDiv,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::URem) => IrToM4 {
                llvm_ir: LlvmIr::URem,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::SRem) => IrToM4 {
                llvm_ir: LlvmIr::SRem,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::And) => IrToM4 {
                llvm_ir: LlvmIr::And,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::Or) => IrToM4 {
                llvm_ir: LlvmIr::Or,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::Xor) => IrToM4 {
                llvm_ir: LlvmIr::Xor,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::Shl) => IrToM4 {
                llvm_ir: LlvmIr::Shl,
                cortex_rep: vec![CortexM4::Shift],
            },
            Some(LlvmIr::LShr) => IrToM4 {
                llvm_ir: LlvmIr::LShr,
                cortex_rep: vec![CortexM4::Shift],
            },
            Some(LlvmIr::AShr) => IrToM4 {
                llvm_ir: LlvmIr::AShr,
                cortex_rep: vec![CortexM4::Shift],
            },
            Some(LlvmIr::ICmp) => IrToM4 {
                llvm_ir: LlvmIr::Or,
                cortex_rep: vec![CortexM4::Compare],
            },
            Some(LlvmIr::Alloca) => IrToM4 {
                llvm_ir: LlvmIr::Alloca,
                cortex_rep: vec![CortexM4::Add],
            },
            Some(LlvmIr::Load) => IrToM4 {
                llvm_ir: LlvmIr::Load,
                cortex_rep: vec![CortexM4::Load],
            },
            Some(LlvmIr::Store) => IrToM4 {
                llvm_ir: LlvmIr::Store,
                cortex_rep: vec![CortexM4::Store],
            },
            Some(LlvmIr::GetElementPtr) => IrToM4 {//idk
                llvm_ir: LlvmIr::GetElementPtr,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::Trunc) => IrToM4 { //idk
                llvm_ir: LlvmIr::Trunc,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::ZExt) => IrToM4 {//idk
                llvm_ir: LlvmIr::ZExt,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::SExt ) => IrToM4 {
                llvm_ir: LlvmIr::SExt,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::IntToPtr ) => IrToM4 {
                llvm_ir: LlvmIr::IntToPtr,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::PtrToInt) => IrToM4 {
                llvm_ir: LlvmIr::PtrToInt,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::BitCast) => IrToM4 {
                llvm_ir: LlvmIr::BitCast,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::FNeg) => IrToM4 {
                llvm_ir: LlvmIr::FNeg,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::FAdd) => IrToM4 {
                llvm_ir: LlvmIr::FAdd,
                cortex_rep: vec![CortexM4::Add],
            },
            Some(LlvmIr::FSub) => IrToM4 {
                llvm_ir: LlvmIr::FSub,
                cortex_rep: vec![CortexM4::Subtract],
            },
            Some(LlvmIr::FMul) => IrToM4 {
                llvm_ir: LlvmIr::FMul,
                cortex_rep: vec![CortexM4::Multiply],
            },
            Some(LlvmIr::FDiv) => IrToM4 {
                llvm_ir: LlvmIr::FDiv,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::FRem) => IrToM4 {
                llvm_ir: LlvmIr::FRem,
                cortex_rep: vec![CortexM4::Divide],
            },
            Some(LlvmIr::FPTrunc) => IrToM4 {
                llvm_ir: LlvmIr::FPTrunc,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::FPExt) => IrToM4 {
                llvm_ir: LlvmIr::FPExt,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::FPToUI) => IrToM4 {
                llvm_ir: LlvmIr::FPToUI,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::FPToSI) => IrToM4 {
                llvm_ir: LlvmIr::FPToSI,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::UIToFP) => IrToM4 {
                llvm_ir: LlvmIr::UIToFP,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::SIToFP) => IrToM4 {
                llvm_ir: LlvmIr::SIToFP,
                cortex_rep: vec![CortexM4::Extend],
            },
            Some(LlvmIr::FCmp) => IrToM4 {
                llvm_ir: LlvmIr::FCmp,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::InsertValue) => IrToM4 {
                llvm_ir: LlvmIr::InsertValue,
                cortex_rep: vec![CortexM4::Push],
            },
            Some(LlvmIr::ExtractValue) => IrToM4 {
                llvm_ir: LlvmIr::ExtractValue,
                cortex_rep: vec![CortexM4::Pop],
            },
            Some(LlvmIr::Fence) => IrToM4 {
                llvm_ir: LlvmIr::Fence,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::InsertElement) => IrToM4 {
                llvm_ir: LlvmIr::InsertElement,
                cortex_rep: vec![CortexM4::Push],
            },
            Some(LlvmIr::ExtractElement ) => IrToM4 {
                llvm_ir: LlvmIr::ExtractElement,
                cortex_rep: vec![CortexM4::Pop],
            },
            Some(LlvmIr::ShuffleVector ) => IrToM4 {
                llvm_ir: LlvmIr::ShuffleVector,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::AtomicRMW ) => IrToM4 {
                llvm_ir: LlvmIr::AtomicRMW,
                cortex_rep: vec![CortexM4::Logical],
            },
            Some(LlvmIr::AtomicCmpXchg ) => IrToM4 {
                llvm_ir: LlvmIr::AtomicCmpXchg,
                cortex_rep: vec![CortexM4::Logical],
            },
            None => todo!(),
        }
    }
    pub fn getUpper(self, b:u32, n:u32, w:u32) -> u32 {
        self.cortex_rep.into_iter().map(|x|x.getUpper(b,n,w)).sum()
    }

    pub fn getLower(self, n:u32) -> u32 {
        self.cortex_rep.into_iter().map(|x|x.getLower(n)).sum()
    }

    pub fn read_file(path: PathBuf) -> Result<(String,Vec<IrToM4>),String> {
        let mut ir_to_m4 = Vec::new();
        let file = fs::read_to_string(path.clone());
        match file {
            Ok(contents) => {
                let filename = path.file_name().unwrap().to_str().unwrap().to_string();
                match Instructions::new(filename, contents) {
                    Ok(instructions) => {
                        for (instruction,nmbr) in instructions.clone().getInstructions(){
                            let conv_obj = IrToM4::new(&instruction);
                            for _ in 0..nmbr {
                                ir_to_m4.push(conv_obj.clone()); 
                            }
                        }
                        Ok((instructions.getFilename(),ir_to_m4))
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
                    for (instruction,nmbr) in instr_obj.clone().getInstructions(){
                        let conv_obj = IrToM4::new(&instruction);
                        for _ in 0..nmbr {
                            ir_to_m4_vec.push(conv_obj.clone()); 
                        }

                    };
                    parsed_vectors.push((instr_obj.getFilename(),ir_to_m4_vec))
                }
                Ok(parsed_vectors)
            }
            Err(msg) => Err(msg),
        }
    }
}