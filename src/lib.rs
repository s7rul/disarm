use num_enum::{IntoPrimitive, TryFromPrimitive};
use std::convert::TryFrom;

// A6.3 Conditional Execution
#[derive(Debug, PartialEq, Eq)]
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
type Rn = Register;
type Rd = Register;
type Rm = Register;

#[derive(Debug, PartialEq, Eq)]
pub enum Thumb16 {
    AddsT1(Imm3, Rn, Rd),
    BxT1(Rm),
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    ChunkNotLongEnough,
}

pub fn disassemble(chunk: &[u8]) -> Result<(Thumb16, &[u8]), Error> {
    if chunk.len() < 2 {
        return Err(Error::ChunkNotLongEnough);
    }

    // perhaps better to use the `byteorder` crate
    let arr: [u8; 2] = chunk[0..=1].try_into().unwrap();
    let rest = &chunk[2..];
    let instr = u16::from_le_bytes(arr);

    let op6 = instr >> 10; // b15..10
    println!("opcode {:06b}", op6);

    let thumb16 = match op6 {
        // 00xxxx Shift (immediate), add, subtract, move, and compare on page A5-79
        0b000000..=0b001111 => {
            println!("00xxxx Shift (immediate), add, subtract, move, and compare on page A5-79");
            let op5 = (instr >> 9) & 0b11111;
            match op5 {
                // 000xx Logical Shift Left (a)     LSL (immediate) on page A6-135
                0b00000..=0b00011 => {
                    unimplemented!()
                }

                // 001xx Logical Shift Right        LSR (immediate) on page A6-137
                0b00100..=0b00111 => {
                    unimplemented!()
                }

                // 010xx Arithmetic Shift Right     ASR (immediate) on page A6-108
                0b01000..=0b01011 => {
                    unimplemented!()
                }

                // 01100 Add register               ADD (register) on page A6-102
                0b01100 => {
                    unimplemented!()
                }

                // 01101 Subtract register          SUB (register) on page A6-165
                0b01101 => {
                    unimplemented!()
                }

                // 01110 Add 3-bit immediate        ADD (immediate) on page A6-101
                0b01110 => {
                    // A6.7.2 ADD (immediate)
                    let imm3 = ((instr >> 6) & 0b111) as u8;
                    let rn = ((instr >> 3) & 0b111) as u8;
                    let rd = ((instr >> 0) & 0b111) as u8;
                    Thumb16::AddsT1(imm3, rn.try_into().unwrap(), rd.try_into().unwrap())
                }

                // 01111 Subtract 3-bit immediate   SUB (immediate) on page A6-164
                0b01111 => {
                    unimplemented!()
                }

                // 100xx Move                       MOV (immediate) on page A6-139
                0b10000..=0b10011 => {
                    unimplemented!()
                }

                // 101xx Compare                    CMP (immediate) on page A6-117
                0b10100..=0b10111 => {
                    unimplemented!()
                }
                // 110xx Add 8-bit immediate        ADD (immediate) on page A6-101
                0b11000..=0b11011 => {
                    unimplemented!()
                }
                // 111xx Subtract 8-bit immediate   SUB (immediate) on page A6-164
                0b11100..=0b11111 => {
                    unimplemented!()
                }
                _ => unimplemented!(),
            }
        }

        // 010000 Data processing on page A5-80
        0b010000 => {
            println!("010000 Data processing on page A5-80");
            let dp_op_index = ((instr >> 6) & 0b1111) as u8;
            println!("index {}", dp_op_index);
            let dp_op = DpOpcode::try_from(dp_op_index).unwrap();
            println!("dp {:?}", dp_op);
            unimplemented!()
        }

        // 010001 Special data instructions and branch and exchange on page A5-81
        0b010001 => {
            println!("010001 Special data instructions and branch and exchange on page A5-81");

            let op4 = (instr >> 6) & 0b1111;

            match op4 {
                // 00xx Add Registers       ADD (register) on page A6-102
                0b0000..=0b0011 => {
                    unimplemented!()
                }

                // 0100 UNPREDICTABLE       -
                0b0100 => {
                    unimplemented!()
                }
                // 0101 Compare Registers   CMP (register) on page A6-118
                0b0101 => {
                    unimplemented!()
                }

                // 011x
                0b0110..=0b0111 => {
                    unimplemented!()
                }

                // 10xx Move Registers      MOV (register) on page A6-140
                0b1000..=0b1011 => {
                    unimplemented!()
                }
                // 110x Branch and Exchange BX on page A6-115
                0b1100..=0b1101 => {
                    let rm = ((instr >> 3) & 0b1111) as u8;
                    assert!(instr & 0b111 == 0);
                    Thumb16::BxT1(rm.try_into().unwrap())
                }

                // 111x Branch with Link and Exchange BLX (register) on page A6-114
                0b1110..=0b1111 => {
                    unimplemented!()
                }
                _ => unimplemented!(),
            }
        }

        // 01001x Load from Literal Pool, see LDR (literal) on page A6-127
        0b010010..=0b010011 => {
            println!("01001x Load from Literal Pool, see LDR (literal) on page A6-127");
            unimplemented!()
        }

        // 0101xx Load/store single data item on page A5-82
        0b010100..=0b010111 => {
            println!("0101xx Load/store single data item on page A5-82");
            unimplemented!()
        }

        // 011xxx Load/store single data item on page A5-82
        0b011000..=0b011111 => {
            println!("0101xx Load/store single data item on page A5-82");
            unimplemented!()
        }

        // 011xxx Load/store single data item on page A5-82
        0b100000..=0b100111 => {
            println!("0101xx Load/store single data item on page A5-82");
            unimplemented!()
        }

        // 10100x Generate PC-relative address, see ADR on page A6-106
        0b101000..=0b101001 => {
            println!("10100x Generate PC-relative address, see ADR on page A6-106");
            unimplemented!()
        }

        // 10101x Generate SP-relative address, see ADD (SP plus immediate) on page A6-104
        0b101010..=0b101011 => {
            println!(
                "10101x Generate SP-relative address, see ADD (SP plus immediate) on page A6-104"
            );
            unimplemented!()
        }

        // 1011xx Miscellaneous 16-bit instructions on page A5-83
        0b101100..=0b101111 => {
            println!("1011xx Miscellaneous 16-bit instructions on page A5-83");
            unimplemented!()
        }

        // 11000x Store multiple registers, see STM, STMIA, STMEA on page A6-157
        0b110000..=0b110001 => {
            println!("11000x Store multiple registers, see STM, STMIA, STMEA on page A6-157");
            unimplemented!()
        }

        // 11001x Load multiple registers, see LDM, LDMIA, LDMFD on page A6-125
        0b110010..=0b110011 => {
            println!("11001x Load multiple registers, see LDM, LDMIA, LDMFD on page A6-125");
            unimplemented!()
        }

        // 1101xx Conditional branch, and Supervisor Call on page A5-84
        0b110100..=0b110111 => {
            println!("1101xx Conditional branch, and Supervisor Call on page A5-84");
            unimplemented!()
        }

        // 11100x Unconditional Branch, see B on page A6-110
        0b111000..=0b111001 => {
            println!("11100x Unconditional Branch, see B on page A6-110");
            unimplemented!()
        }

        _ => {
            println!("illegal opcode {:b}", op6);
            unimplemented!()
        }
    };
    Ok((thumb16, rest))
}

#[test]
fn test_inc() {
    /*
    00000100 <inc_function>:
         100: 40 1c        	adds	r0, r0, #1
         102: 70 47        	bx	lr
    */
    let mut chunk: &[u8] = &[0x40, 0x1c, 0x70, 0x47];

    // ugly should use an iterator somehow
    loop {
        let (inst, rest) = disassemble(chunk).unwrap();
        println!("{:?}", inst);
        if rest.len() == 0 {
            break;
        };
        chunk = rest
    }
}
