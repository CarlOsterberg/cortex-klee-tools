pub(crate) mod cortex_m4;
pub(crate) mod llvm_ir;
use crate::ktest_parser::{self, Instructions};

use std::{path::{PathBuf, self}, fs, vec};

use self::{llvm_ir::LlvmIr, cortex_m4::{CortexM4}};


#[derive(Clone,Debug)]
pub struct IrToM4 {
    llvm_ir: LlvmIr,
    cortex_wc: Vec<CortexM4>,
    cortex_bc: Vec<CortexM4>,
}

impl IrToM4 {
    pub fn new(llvm_ir: &str) -> IrToM4 {
        match LlvmIr::fromString(llvm_ir) {
            Some(LlvmIr::Ret) => IrToM4 {
                llvm_ir: LlvmIr::Ret,
                cortex_wc: vec![CortexM4::MOVpc, CortexM4::POPpc, CortexM4::MOVpc],
                cortex_bc: vec![CortexM4::B],
            },
            Some(LlvmIr::Br) => IrToM4 {
                llvm_ir: LlvmIr::Br,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B]
            },
            Some(LlvmIr::IndirectBr) => IrToM4 {
                llvm_ir: LlvmIr::IndirectBr,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            //check this more thoroughly
            Some(LlvmIr::Switch) => IrToM4 {
                llvm_ir: LlvmIr::Switch,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            Some(LlvmIr::Unreachable)  => todo!(),
            Some(LlvmIr::Invoke)  => todo!(),
            Some(LlvmIr::Call)  => IrToM4 {
                llvm_ir: LlvmIr::Call,
                cortex_wc: vec![CortexM4::PUSH, CortexM4::MOVreg, CortexM4::BL],
                cortex_bc: vec![CortexM4::B],
            },
            //check this more thoroughly
            Some(LlvmIr::PHI)  => IrToM4 {
                llvm_ir: LlvmIr::PHI,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            //check this more thoroughly
            Some(LlvmIr::Select)  => IrToM4 {
                llvm_ir: LlvmIr::Select,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            //check this more thoroughly
            Some(LlvmIr::VAArg) => IrToM4 {
                llvm_ir: LlvmIr::VAArg,
                cortex_wc: vec![CortexM4::B],
                cortex_bc: vec![CortexM4::B],
            },
            Some(LlvmIr::Add) => IrToM4 {
                llvm_ir: LlvmIr::Add,
                cortex_wc: vec![CortexM4::ADDpc],
                cortex_bc: vec![CortexM4::ADDreg],
            },
            Some(LlvmIr::Sub) => IrToM4 {
                llvm_ir: LlvmIr::Sub,
                cortex_wc: vec![CortexM4::SUB],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some(LlvmIr::Mul) => IrToM4 {
                llvm_ir: LlvmIr::Mul,
                cortex_wc: vec![CortexM4::MUL],
                cortex_bc: vec![CortexM4::MUL],
            },
            Some(LlvmIr::UDiv) => IrToM4 {
                llvm_ir: LlvmIr::UDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some(LlvmIr::SDiv) => IrToM4 {
                llvm_ir: LlvmIr::SDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some(LlvmIr::URem) => IrToM4 {
                llvm_ir: LlvmIr::URem,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some(LlvmIr::SRem) => IrToM4 {
                llvm_ir: LlvmIr::SRem,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            Some(LlvmIr::And) => IrToM4 {
                llvm_ir: LlvmIr::And,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            Some(LlvmIr::Or) => IrToM4 {
                llvm_ir: LlvmIr::Or,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            Some(LlvmIr::Xor) => IrToM4 {
                llvm_ir: LlvmIr::Xor,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            Some(LlvmIr::Shl) => IrToM4 {
                llvm_ir: LlvmIr::Shl,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            Some(LlvmIr::LShr) => IrToM4 {
                llvm_ir: LlvmIr::LShr,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            Some(LlvmIr::AShr) => IrToM4 {
                llvm_ir: LlvmIr::AShr,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            Some(LlvmIr::ICmp) => IrToM4 {
                llvm_ir: LlvmIr::ICmp,
                cortex_wc: vec![CortexM4::CMP],
                cortex_bc: vec![CortexM4::CMP],
            },
            //SUB is always with PC, therefor the sub instr
            //will always be worst-case. Undervalueing best-case isnt that
            //much of a biggie
            Some(LlvmIr::Alloca) => IrToM4 {
                llvm_ir: LlvmIr::Alloca,
                cortex_wc: vec![CortexM4::SUB, CortexM4::MOVpc],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some(LlvmIr::Load) => IrToM4 {
                llvm_ir: LlvmIr::Load,
                cortex_wc: vec![CortexM4::LDRreg],
                cortex_bc: vec![CortexM4::LDRpc],
            },
            Some(LlvmIr::Store) => IrToM4 {
                llvm_ir: LlvmIr::Store,
                cortex_wc: vec![CortexM4::STR],
                cortex_bc: vec![CortexM4::STR],
            },
            //check this more thoroughly
            Some(LlvmIr::GetElementPtr) => IrToM4 {
                llvm_ir: LlvmIr::GetElementPtr,
                cortex_wc: vec![CortexM4::ADDreg],
                cortex_bc: vec![CortexM4::ADDreg],
            },
            //check this more thoroughly
            Some(LlvmIr::Trunc) => IrToM4 {
                llvm_ir: LlvmIr::Trunc,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::ZExt) => IrToM4 {
                llvm_ir: LlvmIr::ZExt,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            //check this more thoroughly
            Some(LlvmIr::SExt) => IrToM4 {
                llvm_ir: LlvmIr::SExt,
                cortex_wc: vec![CortexM4::LSL],
                cortex_bc: vec![CortexM4::LSL],
            },
            //check this more thoroughly
            Some(LlvmIr::IntToPtr) => IrToM4 {
                llvm_ir: LlvmIr::IntToPtr,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::PtrToInt) => IrToM4 {
                llvm_ir: LlvmIr::PtrToInt,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::BitCast) => IrToM4 {
                llvm_ir: LlvmIr::BitCast,
                cortex_wc: vec![],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::FNeg) => IrToM4 {
                llvm_ir: LlvmIr::FNeg,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            Some(LlvmIr::FAdd) => IrToM4 {
                llvm_ir: LlvmIr::FAdd,
                cortex_wc: vec![CortexM4::ADDreg],
                cortex_bc: vec![CortexM4::ADDreg],
            },
            Some(LlvmIr::FSub) => IrToM4 {
                llvm_ir: LlvmIr::FSub,
                cortex_wc: vec![CortexM4::SUB],
                cortex_bc: vec![CortexM4::SUB],
            },
            Some(LlvmIr::FMul) => IrToM4 {
                llvm_ir: LlvmIr::FMul,
                cortex_wc: vec![CortexM4::MUL],
                cortex_bc: vec![CortexM4::MUL],
            },
            Some(LlvmIr::FDiv) => IrToM4 {
                llvm_ir: LlvmIr::FDiv,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],

            },
            //check this more thoroughly
            Some(LlvmIr::FRem) => IrToM4 {
                llvm_ir: LlvmIr::FRem,
                cortex_wc: vec![CortexM4::UDIV],
                cortex_bc: vec![CortexM4::UDIV],
            },
            //check this more thoroughly
            Some(LlvmIr::FPTrunc) => IrToM4 {
                llvm_ir: LlvmIr::FPTrunc,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::FPExt) => IrToM4 {
                llvm_ir: LlvmIr::FPExt,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![CortexM4::SXTH],
            },
            Some(LlvmIr::FPToUI) => IrToM4 {
                llvm_ir: LlvmIr::FPToUI,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![CortexM4::SXTH],
            },
            //check this more thoroughly
            Some(LlvmIr::FPToSI) => IrToM4 {
                llvm_ir: LlvmIr::FPToSI,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![CortexM4::SXTH],
            },
            //check this more thoroughly
            Some(LlvmIr::UIToFP) => IrToM4 {
                llvm_ir: LlvmIr::UIToFP,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![CortexM4::SXTH],
            },
            //check this more thoroughly
            Some(LlvmIr::SIToFP) => IrToM4 {
                llvm_ir: LlvmIr::SIToFP,
                cortex_wc: vec![CortexM4::SXTH],
                cortex_bc: vec![CortexM4::SXTH],
            },
            //check this more thoroughly
            Some(LlvmIr::FCmp) => IrToM4 {
                llvm_ir: LlvmIr::FCmp,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            //check this more thoroughly
            Some(LlvmIr::InsertValue) => IrToM4 {
                llvm_ir: LlvmIr::InsertValue,
                cortex_wc: vec![CortexM4::PUSH],
                cortex_bc:vec![CortexM4::PUSH],
            },
            //check this more thoroughly
            Some(LlvmIr::ExtractValue) => IrToM4 {
                llvm_ir: LlvmIr::ExtractValue,
                cortex_wc: vec![CortexM4::POP],
                cortex_bc: vec![CortexM4::POP]
            },
            //check this more thoroughly
            Some(LlvmIr::Fence) => IrToM4 {
                llvm_ir: LlvmIr::Fence,
                cortex_wc: vec![],
                cortex_bc: vec![],
            },
            //check this more thoroughly
            Some(LlvmIr::InsertElement) => IrToM4 {
                llvm_ir: LlvmIr::InsertElement,
                cortex_wc: vec![CortexM4::PUSH],
                cortex_bc:vec![CortexM4::PUSH],
            },
            //check this more thoroughly
            Some(LlvmIr::ExtractElement ) => IrToM4 {
                llvm_ir: LlvmIr::ExtractElement,
                cortex_wc: vec![CortexM4::POP],
                cortex_bc: vec![CortexM4::POP]

            },
            //check this more thoroughly
            Some(LlvmIr::ShuffleVector ) => IrToM4 {
                llvm_ir: LlvmIr::ShuffleVector,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            //Should just crash?
            Some(LlvmIr::AtomicRMW ) => IrToM4 {
                llvm_ir: LlvmIr::AtomicRMW,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            //Should just crash?
            Some(LlvmIr::AtomicCmpXchg ) => IrToM4 {
                llvm_ir: LlvmIr::AtomicCmpXchg,
                cortex_wc: vec![CortexM4::AND],
                cortex_bc: vec![CortexM4::AND],
            },
            None => todo!(),
        }
    }
    pub fn getUpper(self, b:u32, n:u32, w:u32) -> u32 {
        self.cortex_wc.into_iter().map(|x|x.getUpper(b,n,w)).sum()
    }

    pub fn getLower(self, b:u32, n:u32, w:u32) -> u32 {
        self.cortex_bc.into_iter().map(|x|x.getLower(b,n,w)).sum()
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