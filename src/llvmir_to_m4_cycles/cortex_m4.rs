//https://developer.arm.com/documentation/100166/0001/Programmers-Model/CortexM4-set-summary/Table-of-processor-CortexM4s?lang=en

#[allow(unused_imports)]
use std::collections::HashMap;
use std::collections::HashSet;


#[derive(Clone,Debug)]
#[allow(dead_code)]
pub enum CortexM4 {
    MOVreg,
    MOVW,
    MOVT,
    MOVpc,
    ADDreg,
    ADDpc,
    ADC,
    ADR,
    SUB,
    SBC,
    RSB,
    MUL,
    MLA,
    MLS,
    SMULL,
    UMULL,
    SMLAL,
    UMLAL,
    SDIV,
    UDIV,
    SSAT,
    USAT,
    CMP,
    CMN,
    AND,
    EOR,
    ORR,
    ORN,
    BIC,
    MVN,
    TST,
    TEQ,
    LSL,
    LSR,
    ASR,
    ROR,
    RRX,
    CLZ,
    LDRreg,
    LDRpc,
    LDRH,
    LDRB,
    LDRSH,
    LDRSB,
    LDRT,
    LDRHT,
    LDRBT,
    LDRSHT,
    LDRSBT,
    LDRD,
    LDMreg,
    LDMpc,
    STR,
    STRH,
    STRB,
    STRSH,
    STRSB,
    STRT,
    STRHT,
    STRBT,
    STRSHT,
    STRSBT,
    STRD,
    STM,
    PUSH,
    POP,
    POPpc,
    LDREX,
    LDREXH,
    LDRREXB,
    STREX,
    STREXH,
    STREXB,
    CLREX,
    Bcc,//conditional branch
    B,
    BL,
    BX,
    BLX,
    CBZ,
    CBNZ,
    TBB,
    TBH,
    IT,
    CPSID,
    CPSIE,
    MRS,
    MSR,
    SXTH,
    SXTB,
    UXTH,
    UXTB,
    UBFX,
    SBFX,
    BFC,
    BFI,
    REV,
    REV16,
    REVSH,
    RBIT,
    SEV,
    WFE,
    WFI,
    NOP,
    ISB,
    DMB,
    DSB,
}

#[allow(dead_code)]
impl CortexM4 {
    pub fn get_upper(self, mut b:u32,n:u32,w:u32) -> u32 {
        let p=3;
        if b > p {
            b = p;
        }
        match self {
            CortexM4::MOVreg => 1,
            CortexM4::MOVW => 1,
            CortexM4::MOVT => 1,
            CortexM4::MOVpc => 1 + p,
            CortexM4::ADDreg => 1,
            CortexM4::ADDpc => 1 + p,
            CortexM4::ADC => 1,
            CortexM4::ADR => 1,
            CortexM4::SUB => 1,
            CortexM4::SBC => 1,
            CortexM4::RSB => 1,
            CortexM4::MUL => 1,
            CortexM4::MLA => 1,
            CortexM4::MLS => 1,
            CortexM4::SMULL => 1,
            CortexM4::UMULL => 1,
            CortexM4::SMLAL => 1,
            CortexM4::UMLAL => 1,
            CortexM4::SDIV => 12,
            CortexM4::UDIV => 12,
            CortexM4::SSAT => 1,
            CortexM4::USAT => 1,
            CortexM4::CMP => 1,
            CortexM4::CMN => 1,
            CortexM4::AND => 1,
            CortexM4::EOR => 1,
            CortexM4::ORR => 1,
            CortexM4::ORN => 1,
            CortexM4::BIC => 1,
            CortexM4::MVN => 1,
            CortexM4::TST => 1,
            CortexM4::TEQ => 1,
            CortexM4::LSL => 1,
            CortexM4::LSR => 1,
            CortexM4::ASR => 1,
            CortexM4::ROR => 1,
            CortexM4::RRX => 1,
            CortexM4::CLZ => 1,
            CortexM4::LDRreg => 2,
            CortexM4::LDRpc => 2 + p,
            CortexM4::LDRH => 2,
            CortexM4::LDRB => 2,
            CortexM4::LDRSH => 2,
            CortexM4::LDRSB => 2,
            CortexM4::LDRT => 2,
            CortexM4::LDRHT => 2,
            CortexM4::LDRBT => 2,
            CortexM4::LDRSHT => 2,
            CortexM4::LDRSBT => 2,
            CortexM4::LDRD => 1 + n,
            CortexM4::LDMreg => 1 + n,
            CortexM4::LDMpc => 1 + n + p,
            CortexM4::STR => 2,
            CortexM4::STRH => 2,
            CortexM4::STRB => 2,
            CortexM4::STRSH => 2,
            CortexM4::STRSB => 2,
            CortexM4::STRT => 2,
            CortexM4::STRHT => 2,
            CortexM4::STRBT => 2,
            CortexM4::STRSHT => 2,
            CortexM4::STRSBT => 2,
            CortexM4::STRD => 1 + n,
            CortexM4::STM => 1 + n,
            CortexM4::PUSH => 1 + n,
            CortexM4::POP => 1 + n,
            CortexM4::POPpc => 1 + n + p,
            CortexM4::LDREX => 2,
            CortexM4::LDREXH => 2,
            CortexM4::LDRREXB => 2,
            CortexM4::STREX => 2,
            CortexM4::STREXH => 2,
            CortexM4::STREXB => 2,
            CortexM4::CLREX => 1,
            CortexM4::Bcc => 1 + p,
            CortexM4::B => 1 + p,
            CortexM4::BL => 1 + p,
            CortexM4::BX => 1 + p,
            CortexM4::BLX => 1 + p,
            CortexM4::CBZ => 1 + p,
            CortexM4::CBNZ => 1 + p,
            CortexM4::TBB => 2 + p,
            CortexM4::TBH => 2 + p,
            CortexM4::IT => 1,
            CortexM4::CPSID => 2,
            CortexM4::CPSIE => 2,
            CortexM4::MRS => 2,
            CortexM4::MSR => 2,
            CortexM4::SXTH => 1,
            CortexM4::SXTB => 1,
            CortexM4::UXTH => 1,
            CortexM4::UXTB => 1,
            CortexM4::UBFX => 1,
            CortexM4::SBFX => 1,
            CortexM4::BFC => 1,
            CortexM4::BFI => 1,
            CortexM4::REV => 1,
            CortexM4::REV16 => 1,
            CortexM4::REVSH => 1,
            CortexM4::RBIT => 1,
            CortexM4::SEV => 1,
            CortexM4::WFE => 1 + w,
            CortexM4::WFI => 1 + w,
            CortexM4::NOP => 1,
            CortexM4::ISB => 1 + b,
            CortexM4::DMB => 1 + b,
            CortexM4::DSB => 1 + b,
        }
    }

    pub fn get_lower(self, b:u32,n:u32,w:u32) -> u32 {
        let p=1;
        match self {
            CortexM4::MOVreg => 1,
            CortexM4::MOVW => 1,
            CortexM4::MOVT => 1,
            CortexM4::MOVpc => 1 + p,
            CortexM4::ADDreg => 1,
            CortexM4::ADDpc => 1 + p,
            CortexM4::ADC => 1,
            CortexM4::ADR => 1,
            CortexM4::SUB => 1,
            CortexM4::SBC => 1,
            CortexM4::RSB => 1,
            CortexM4::MUL => 1,
            CortexM4::MLA => 1,
            CortexM4::MLS => 1,
            CortexM4::SMULL => 1,
            CortexM4::UMULL => 1,
            CortexM4::SMLAL => 1,
            CortexM4::UMLAL => 1,
            CortexM4::SDIV => 2,
            CortexM4::UDIV => 2,
            CortexM4::SSAT => 1,
            CortexM4::USAT => 1,
            CortexM4::CMP => 1,
            CortexM4::CMN => 1,
            CortexM4::AND => 1,
            CortexM4::EOR => 1,
            CortexM4::ORR => 1,
            CortexM4::ORN => 1,
            CortexM4::BIC => 1,
            CortexM4::MVN => 1,
            CortexM4::TST => 1,
            CortexM4::TEQ => 1,
            CortexM4::LSL => 1,
            CortexM4::LSR => 1,
            CortexM4::ASR => 1,
            CortexM4::ROR => 1,
            CortexM4::RRX => 1,
            CortexM4::CLZ => 1,
            CortexM4::LDRreg => 2,
            CortexM4::LDRpc => 2 + p,
            CortexM4::LDRH => 2,
            CortexM4::LDRB => 2,
            CortexM4::LDRSH => 2,
            CortexM4::LDRSB => 2,
            CortexM4::LDRT => 2,
            CortexM4::LDRHT => 2,
            CortexM4::LDRBT => 2,
            CortexM4::LDRSHT => 2,
            CortexM4::LDRSBT => 2,
            CortexM4::LDRD => 1 + n,
            CortexM4::LDMreg => 1 + n,
            CortexM4::LDMpc => 1 + n + p,
            CortexM4::STR => 2,
            CortexM4::STRH => 2,
            CortexM4::STRB => 2,
            CortexM4::STRSH => 2,
            CortexM4::STRSB => 2,
            CortexM4::STRT => 2,
            CortexM4::STRHT => 2,
            CortexM4::STRBT => 2,
            CortexM4::STRSHT => 2,
            CortexM4::STRSBT => 2,
            CortexM4::STRD => 1 + n,
            CortexM4::STM => 1 + n,
            CortexM4::PUSH => 1 + n,
            CortexM4::POP => 1 + n,
            CortexM4::POPpc => 1 + n + p,
            CortexM4::LDREX => 2,
            CortexM4::LDREXH => 2,
            CortexM4::LDRREXB => 2,
            CortexM4::STREX => 2,
            CortexM4::STREXH => 2,
            CortexM4::STREXB => 2,
            CortexM4::CLREX => 1,
            CortexM4::Bcc => 1,
            CortexM4::B => 1 + p,
            CortexM4::BL => 1 + p,
            CortexM4::BX => 1 + p,
            CortexM4::BLX => 1 + p,
            CortexM4::CBZ => 1,
            CortexM4::CBNZ => 1,
            CortexM4::TBB => 2 + p,
            CortexM4::TBH => 2 + p,
            CortexM4::IT => 0,
            CortexM4::CPSID => 1,
            CortexM4::CPSIE => 1,
            CortexM4::MRS => 1,
            CortexM4::MSR => 1,
            CortexM4::SXTH => 1,
            CortexM4::SXTB => 1,
            CortexM4::UXTH => 1,
            CortexM4::UXTB => 1,
            CortexM4::UBFX => 1,
            CortexM4::SBFX => 1,
            CortexM4::BFC => 1,
            CortexM4::BFI => 1,
            CortexM4::REV => 1,
            CortexM4::REV16 => 1,
            CortexM4::REVSH => 1,
            CortexM4::RBIT => 1,
            CortexM4::SEV => 1,
            CortexM4::WFE => 1 + w,
            CortexM4::WFI => 1 + w,
            CortexM4::NOP => 1,
            CortexM4::ISB => 1 + b,
            CortexM4::DMB => 1 + b,
            CortexM4::DSB => 1 + b,
        }
    }
}


fn init_cc() -> HashSet<String>{
    let mut conditional_codes = HashSet::new();
    conditional_codes.insert("eq".to_string());
    conditional_codes.insert("ne".to_string());
    conditional_codes.insert("cs".to_string());
    conditional_codes.insert("hs".to_string());
    conditional_codes.insert("cc".to_string());
    conditional_codes.insert("lo".to_string());
    conditional_codes.insert("mi".to_string());
    conditional_codes.insert("pl".to_string());
    conditional_codes.insert("vs".to_string());
    conditional_codes.insert("vc".to_string());
    conditional_codes.insert("hi".to_string());
    conditional_codes.insert("ls".to_string());
    conditional_codes.insert("ge".to_string());
    conditional_codes.insert("lt".to_string());
    conditional_codes.insert("gt".to_string());
    conditional_codes.insert("le".to_string());
    conditional_codes
}

fn init_instruction_map() -> HashMap<String, CortexM4>{
    let mut instr_map = HashMap::new();
    //Could also be move to pc
    instr_map.insert("mov".to_string(), CortexM4::MOVreg);
    instr_map.insert("movw".to_string(), CortexM4::MOVW);
    instr_map.insert("movt".to_string(), CortexM4::MOVT);
    //Could also be add to pc
    instr_map.insert("add".to_string(), CortexM4::ADDreg);
    instr_map.insert("adc".to_string(), CortexM4::ADC);
    instr_map.insert("adr".to_string(), CortexM4::ADR);
    instr_map.insert("sub".to_string(), CortexM4::SUB);
    instr_map.insert("sbc".to_string(), CortexM4::SBC);
    instr_map.insert("rsb".to_string(), CortexM4::RSB);
    instr_map.insert("mul".to_string(), CortexM4::MUL);
    instr_map.insert("mla".to_string(), CortexM4::MLA);
    instr_map.insert("mls".to_string(), CortexM4::MLS);
    instr_map.insert("smull".to_string(), CortexM4::SMULL);
    instr_map.insert("umull".to_string(), CortexM4::UMULL);
    instr_map.insert("smlal".to_string(), CortexM4::SMLAL);
    instr_map.insert("umlal".to_string(), CortexM4::UMLAL);
    instr_map.insert("sdiv".to_string(), CortexM4::SDIV);
    instr_map.insert("udiv".to_string(), CortexM4::UDIV);
    instr_map.insert("ssat".to_string(), CortexM4::SSAT);
    instr_map.insert("usat".to_string(), CortexM4::USAT);
    instr_map.insert("cmp".to_string(), CortexM4::CMP);
    instr_map.insert("cmn".to_string(), CortexM4::CMN);
    instr_map.insert("and".to_string(), CortexM4::AND);
    instr_map.insert("eor".to_string(), CortexM4::EOR);
    instr_map.insert("orr".to_string(), CortexM4::ORR);
    instr_map.insert("orn".to_string(), CortexM4::ORN);
    instr_map.insert("bic".to_string(), CortexM4::BIC);
    instr_map.insert("mvn".to_string(), CortexM4::MVN);
    instr_map.insert("tst".to_string(), CortexM4::TST);
    instr_map.insert("teq".to_string(), CortexM4::TEQ);
    instr_map.insert("lsl".to_string(), CortexM4::LSL);
    instr_map.insert("lsr".to_string(), CortexM4::LSR);
    instr_map.insert("asr".to_string(), CortexM4::ASR);
    instr_map.insert("ror".to_string(), CortexM4::ROR);
    instr_map.insert("rrx".to_string(), CortexM4::RRX);
    instr_map.insert("clz".to_string(), CortexM4::CLZ);
    //Could also be to pc
    instr_map.insert("ldr".to_string(), CortexM4::LDRreg);
    instr_map.insert("ldrh".to_string(), CortexM4::LDRH);
    instr_map.insert("ldrb".to_string(), CortexM4::LDRB);
    instr_map.insert("ldrsh".to_string(), CortexM4::LDRSH);
    instr_map.insert("ldrsb".to_string(), CortexM4::LDRSB);
    instr_map.insert("ldrt".to_string(), CortexM4::LDRT);
    instr_map.insert("ldrht".to_string(), CortexM4::LDRHT);
    instr_map.insert("ldrbt".to_string(), CortexM4::LDRBT);
    instr_map.insert("ldrsht".to_string(), CortexM4::LDRSHT);
    instr_map.insert("ldrsbt".to_string(), CortexM4::LDRSBT);
    instr_map.insert("ldrd".to_string(), CortexM4::LDRD);
    //Could also include pc
    instr_map.insert("ldm".to_string(), CortexM4::LDMreg);
    instr_map.insert("str".to_string(), CortexM4::STR);
    instr_map.insert("strh".to_string(), CortexM4::STRH);
    instr_map.insert("strb".to_string(), CortexM4::STRB);
    instr_map.insert("strsh".to_string(), CortexM4::STRSH);
    instr_map.insert("strsb".to_string(), CortexM4::STRSB);
    instr_map.insert("strt".to_string(), CortexM4::STRT);
    instr_map.insert("strht".to_string(), CortexM4::STRHT);
    instr_map.insert("strbt".to_string(), CortexM4::STRBT);
    instr_map.insert("strsht".to_string(), CortexM4::STRSHT);
    instr_map.insert("strsbt".to_string(), CortexM4::STRSBT);
    instr_map.insert("strd".to_string(), CortexM4::STRD);
    instr_map.insert("stm".to_string(), CortexM4::STM);
    instr_map.insert("push".to_string(), CortexM4::PUSH);
    //Could also pop pc
    instr_map.insert("pop".to_string(), CortexM4::POP);
    instr_map.insert("ldrex".to_string(), CortexM4::LDREX);
    instr_map.insert("ldrexh".to_string(), CortexM4::LDREXH);
    instr_map.insert("ldrexb".to_string(), CortexM4::LDRREXB);
    instr_map.insert("strex".to_string(), CortexM4::STREX);
    instr_map.insert("strexh".to_string(), CortexM4::STREXH);
    instr_map.insert("strexb".to_string(), CortexM4::STREXB);
    instr_map.insert("clrex".to_string(), CortexM4::CLREX);
    instr_map.insert("b".to_string(), CortexM4::B);
    instr_map.insert("bl".to_string(), CortexM4::BL);
    instr_map.insert("bx".to_string(), CortexM4::BX);
    instr_map.insert("blx".to_string(), CortexM4::BLX);
    instr_map.insert("cbz".to_string(), CortexM4::CBZ);
    instr_map.insert("cbnz".to_string(), CortexM4::CBNZ);
    instr_map.insert("tbb".to_string(), CortexM4::TBB);
    instr_map.insert("tbh".to_string(), CortexM4::TBH);
    instr_map.insert("it".to_string(), CortexM4::IT);
    instr_map.insert("cpsid".to_string(), CortexM4::CPSID);
    instr_map.insert("cpsie".to_string(), CortexM4::CPSIE);
    instr_map.insert("mrs".to_string(), CortexM4::MRS);
    instr_map.insert("msr".to_string(), CortexM4::MSR);
    instr_map.insert("sxth".to_string(), CortexM4::SXTH);
    instr_map.insert("sxtb".to_string(), CortexM4::SXTB);
    instr_map.insert("uxth".to_string(), CortexM4::UXTH);
    instr_map.insert("uxtb".to_string(), CortexM4::UXTB);
    instr_map.insert("ubfx".to_string(), CortexM4::UBFX);
    instr_map.insert("sbfx".to_string(), CortexM4::SBFX);
    instr_map.insert("bfc".to_string(), CortexM4::BFC);
    instr_map.insert("rev".to_string(), CortexM4::REV);
    instr_map.insert("rev16".to_string(), CortexM4::REV16);
    instr_map.insert("revsh".to_string(), CortexM4::REVSH);
    instr_map.insert("rbit".to_string(), CortexM4::RBIT);
    instr_map.insert("sev".to_string(), CortexM4::SEV);
    instr_map.insert("wfe".to_string(), CortexM4::WFE);
    instr_map.insert("wfi".to_string(), CortexM4::WFI);
    instr_map.insert("nop".to_string(), CortexM4::NOP);
    instr_map.insert("isb".to_string(), CortexM4::ISB);
    instr_map.insert("dmb".to_string(), CortexM4::DMB);
    instr_map.insert("dsb".to_string(), CortexM4::DSB);
    instr_map
}

pub struct StringToCortexM4 {
    conditional_codes: HashSet<String>,
    instr_map: HashMap<String, CortexM4>,
}

impl StringToCortexM4 {

    pub fn new() -> StringToCortexM4 {
        StringToCortexM4 {
            conditional_codes: init_cc(),
            instr_map: init_instruction_map(),
        }
    }

    pub fn get_upper_bound_cycles(&self, instr: &str) -> u32{
        let width_removed = self.remove_width_spec(instr);
        let cc_removed = self.remove_conditional_code(&width_removed);
        if self.instr_map.contains_key(&cc_removed) {
            return self.instr_map.get(&cc_removed).unwrap().clone().get_upper(3, 1, 1) as u32;
        }
        let mut s_removed = self.remove_s(&width_removed);
        if self.instr_map.contains_key(&s_removed) {
            return self.instr_map.get(&s_removed).unwrap().clone().get_upper(3, 1, 1) as u32;
        }
        else {
            s_removed = self.remove_s(&cc_removed);
            if self.instr_map.contains_key(&s_removed) {
                return self.instr_map.get(&s_removed).unwrap().clone().get_upper(3, 1, 1) as u32;
            }
            println!("@@@@@@@@@@@@@@@@@@@@ unrecognized instruction: {} @@@@@@@@@@@@@@@@@@@@ ", instr);
            return 1;
        }
    }

    pub fn get_lower_bound_cycles(&self, instr: &str) -> u32{
        let width_removed = self.remove_width_spec(instr);
        let cc_removed = self.remove_conditional_code(&width_removed);
        if self.instr_map.contains_key(&cc_removed) {
            return self.instr_map.get(&cc_removed).unwrap().clone().get_lower(0, 1, 1) as u32;
        }
        let mut s_removed = self.remove_s(&width_removed);
        if self.instr_map.contains_key(&s_removed) {
            return self.instr_map.get(&s_removed).unwrap().clone().get_lower(0, 1, 1) as u32;
        }
        else {
            s_removed = self.remove_s(&cc_removed);
            if self.instr_map.contains_key(&s_removed) {
                return self.instr_map.get(&s_removed).unwrap().clone().get_lower(0, 1, 1) as u32;
            }
            println!("@@@@@@@@@@@@@@@@@@@@ unrecognized instruction: {} @@@@@@@@@@@@@@@@@@@@ ", instr);
            return 1;
        }
    }

    fn remove_conditional_code(&self, instruction: &str)  -> String{
        if instruction.len() < 3 {
            return instruction.to_string();
        }
        let end = &instruction[(instruction.len() - 2)..instruction.len()];
        let ret;
        if self.conditional_codes.contains(end) {
            ret = &instruction[0..(instruction.len() - 2)];
            //Exceptions, these instructions end with conditional codes
            if ret == "t" {
                return "teq".to_string();
            }
            if ret == "s" {
                return "svc".to_string();
            }
            if ret == "m" {
                return "mls".to_string();
            }
            return ret.to_string();
        }
        return instruction.to_string();
    }

    fn remove_s(&self, instruction: &str) -> String {
        if instruction.ends_with("s"){
            return instruction[0..instruction.len()-1].to_string();
        }
        instruction.to_string()
    }

    fn remove_width_spec(&self, instruction: &str) -> String {
        let split: Vec<&str> = instruction.split(".").collect();
        if split.len() == 2 {
            return split[0].to_string();
        }
        return instruction.to_string();
    }

}