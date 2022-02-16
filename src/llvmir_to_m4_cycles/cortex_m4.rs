//https://developer.arm.com/documentation/100166/0001/Programmers-Model/Instruction-set-summary/Table-of-processor-instructions?lang=en

#[derive(Clone,Debug)]
pub enum CortexM4 {
    Move,
    Add,
    Subtract,
    Multiply,
    Divide,
    Saturate,
    Compare,
    Logical,
    Shift,
    Rotate,
    Count,
    Load,
    Store,
    Push,
    Pop,
    Semaphore,
    Branch,
    StateChange,
    Extend,
    BitField,
    Reverse,
    Hint,
    Barriers,
}

impl CortexM4 {
    //upper bound on number of cycles for a specific cortex m4 instruction set
    pub fn getUpper(self, mut b:u32, n:u32, w:u32) -> u32 {
        let p = 3;
        if b < p {
            b = p;
        }
        match self {
            CortexM4::Move => 1 + p,
            CortexM4::Add => 1 + p,
            CortexM4::Subtract => 1,
            CortexM4::Multiply => 1,
            CortexM4::Divide => 12,
            CortexM4::Saturate => 1,
            CortexM4::Compare => 1,
            CortexM4::Logical => 1,
            CortexM4::Shift => 1,
            CortexM4::Rotate => 1,
            CortexM4::Count => 1,
            CortexM4::Load => 1 + n + p,
            CortexM4::Store => 1 + n,
            CortexM4::Push => 1 + n,
            CortexM4::Pop => 1 + n + p,
            CortexM4::Semaphore => 2,
            CortexM4::Branch => 2 + p,
            CortexM4::StateChange => 2,
            CortexM4::Extend => 1,
            CortexM4::BitField => 1,
            CortexM4::Reverse => 1,
            CortexM4::Hint => 1 + w,
            CortexM4::Barriers => 1 + b
        }
    }
    //upper bound on number of cycles for a specific cortex m4 instruction set
    pub fn getLower(self, n:u32) -> u32 {
        let p = 1;
        match self {
            CortexM4::Move => 1,
            CortexM4::Add => 1,
            CortexM4::Subtract => 1,
            CortexM4::Multiply => 1,
            CortexM4::Divide => 2,
            CortexM4::Saturate => 1,
            CortexM4::Compare => 1,
            CortexM4::Logical => 1,
            CortexM4::Shift => 1,
            CortexM4::Rotate => 1,
            CortexM4::Count => 1,
            CortexM4::Load => 2,
            CortexM4::Store => 2,
            CortexM4::Push => 1 + n,
            CortexM4::Pop => 1 + n,
            CortexM4::Semaphore => 1,
            CortexM4::Branch => 1 + p,
            CortexM4::StateChange => 1,
            CortexM4::Extend => 1,
            CortexM4::BitField => 1,
            CortexM4::Reverse => 1,
            CortexM4::Hint => 1,
            CortexM4::Barriers => 1
        }
    }
}