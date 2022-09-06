// A6.3 Conditional Execution
use num_enum::{IntoPrimitive, TryFromPrimitive};

#[derive(Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
#[repr(u8)]
pub enum Cond {
    EQ = 0b0000,
    NE = 0b0001,
    CS = 0b0010,
    CC = 0b0011,
    MI = 0b0100,
    PL = 0b0101,
    VS = 0b0110,
    VC = 0b0111,
    HI = 0b1000,
    LS = 0b1001,
    GE = 0b1010,
    LT = 0b1011,
    GT = 0b1100,
    LE = 0b1101,
    None = 0b1110,
}

// A5.2.2 Data processing
#[derive(Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
#[repr(u8)]

pub enum DpOpcode {
    AND,
    OR,
    LSL,
    LSR,
    ASR,
    ADC,
    SBC,
    ROR,
    TST,
    RSB,
    CMP,
    CMN,
    ORR,
    MUL,
    BIC,
    MVN,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Instruction {
    And,
    Or,
    Lsl,
    Lsr,
    Asr,
    Adc,
    Sbc,
    Ror,
    Tst,
    Rsb,
    Cmp,
    Orr,
    Mul,
    Bic,
    Mvn,
}

#[derive(Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
#[repr(u8)]
pub enum Register {
    R0,
    R1,
    R2,
    R3,
    R4,
    R5,
    R6,
    R7,
    R8,
    R9,
    R10,
    R11,
    R12,
    MSP,
    LR,
    PC,
}

type Imm3 = u8;
type Imm8 = u8;
type Rn = Register;
type Rd = Register;
type Rm = Register;

#[derive(Debug, PartialEq, Eq)]
pub enum Thumb16 {
    AddsT1(Imm3, Rn, Rd),
    BxT1(Rm),
    CmpT1(Rn, Imm8),
    BT1(Cond, Imm8),
}
