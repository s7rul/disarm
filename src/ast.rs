// A6.3 Conditional Execution
use num_enum::{IntoPrimitive, TryFromPrimitive};

#[derive(Copy, Clone, Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
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

#[derive(Copy, Clone, Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
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

#[derive(Copy, Clone, Debug, PartialEq, Eq, TryFromPrimitive, IntoPrimitive)]
#[repr(u8)]
pub enum SpecialRegister {
    APSR = 0,
    IAPSR = 1,
    EAPSR = 2,
    XPSR = 3,
    IPSR = 5,
    EPSR = 6,
    IEPSR = 7,
    MSP = 8,
    PSP = 9,
    PRIMASK = 16,
    CONTROL = 20,
}

type Imm3 = u8;
type Imm8 = u8;
type Imm32 = u32;
type Imm32S = i32;
type Rn = Register;
type Rd = Register;
type Rm = Register;
type Rt = Register;

#[derive(Debug, PartialEq, Eq, Copy, Clone)]
pub struct RegisterList(pub u16);

#[derive(Debug, PartialEq, Eq)]
pub enum Thumb16 {
    AddsImmT1(Imm32, Rn, Rd),
    BxT1(Rm),
    CmpImmT1(Rn, Imm32),
    BImmT1(Cond, Imm32),
    MovsImmT1(Rd, Imm32),
    AddsRegT1(Rm, Rn, Rd),
    DataProc(DpOpcode, Register, Register),
    MovT1(Rm, Rd),
    LdrImmT1(Rt, Imm32),
    Stm(Rn, RegisterList),
    BT2(Imm32),
    Ldm(Rn, RegisterList),
    Push(RegisterList),
    UdfT1(Imm32),
    AddSpImmT1(Rd, Imm32),
    SubSpSpImmT1(Imm32),
    STRImmT2(Rt, Imm32),
    Bkpt(Imm32),
}

#[derive(Debug, PartialEq, Eq)]
pub enum Thumb32 {
    BlT1(Imm32),
    MsrT1(Rn, SpecialRegister),
    MrsT1(Rd, SpecialRegister),
}

#[derive(Debug, PartialEq, Eq)]
pub enum Thumb {
    Thumb16(Thumb16),
    Thumb32(Thumb32),
}

impl RegisterList {
    pub fn to_vec(&self) -> Vec<Register> {
        let mut ret = vec![];

        for i in 0..16 {
            if (self.0 >> i) & 0b1 == 1 {
                ret.push(i.try_into().unwrap());
            }
        }
        
        ret
    }
}