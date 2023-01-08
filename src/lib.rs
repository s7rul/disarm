use std::convert::{TryFrom, TryInto};
use elf::{*, endian::AnyEndian};

mod ast;
use ast::*;

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    ChunkNotLongEnough,
}

pub fn read_elf_file(path: &str) {
    println!("Trying to read elf file {path}.");
    let path = std::path::PathBuf::from(path);
    let file_data = match std::fs::read(path) {
        Ok(x) => x,
        Err(e) => {
            println!("Could not read file.");
            return
        },
    };

    let file = match ElfBytes::<AnyEndian>::minimal_parse(file_data.as_slice()) {
        Ok(x) => x,
        Err(_) => {
            println!("unable to parse file");
            return
        }
    };

    // find the .text section offset and size to extract program information
    let text_header = match file.section_header_by_name(".text") {
        Ok(x) => {
            match x {
                Some(n) => n,
                None => {
                    println!("No section .text found");
                    return
                }
            }
        },
        Err(_) => {
            println!("Unable to parse section table.");
            return;
        }
    };

    let offset = text_header.sh_offset;
    let size = text_header.sh_size;

    println!("Offset: {offset:#x} size: {size:#x}");

    let text_data = match file.section_data(&text_header){
        Ok(x) => match x.1 {
            Some(_) => {
                println!(".text data is compressed aborting");
                return
            },
            None => x.0
        },
        Err(_) => {
            println!("unable to parse");
            return
        }
    };

    let mut chunk = text_data;
    loop {
        let (inst, rest) = disassemble(chunk).unwrap();
        println!("{:?}", inst);
        if rest.len() == 0 {
            break;
        }
        chunk = rest;
    }
}

fn disassemble32(instr: u32) -> Thumb32 {
    let op1 = (instr >> 27) & 0b11;
    let op2 = (instr >> 15) & 0b1;

    println!("instr: {instr:032b}, op1: {op1:02b}, op2: {op2:01b}");

    let thumb = match (op1, op2) {
        (0b10, 0b1) => { // Branch and miscellaneous control A5.3.1
            let op1 = (instr >> 19) & 0b1111111;
            let op2 = (instr >> 12) & 0b111;

            match (op1, op2) {
                (0b1111111, 0b010) => { // always undefined
                    println!("Undefined instruction");
                    unimplemented!()
                },
                (0b0111000 | 0b0111001, 0b000 | 0b010) => { // MSR (register) B4.2.3
                    unimplemented!()
                },
                (0b0111011, 0b000 | 0b010) => { // Miscellaneous control instructions A5.3.1
                    unimplemented!()
                },
                (0b0111110 | 0b0111111, 0b000 | 0b010) => { // MRS B4.2.2
                    unimplemented!()
                },
                (_, 0b101 | 0b111) => { // BL A6.7.13EOR
                    let j1 = (instr >> 13) & 0b1;
                    let j2 = (instr >> 11) & 0b1;
                    let s = (instr >> 26) & 0b1;
                    let imm10 = (instr >> 16) & 0b1111111111;
                    let imm11 = instr & 0b11111111111;
                    let i1 = (!(j1 ^ s)) & 0b1;
                    let i2 = (!(j2 ^ s)) & 0b1;
                    let imm32 = (((((s << 24) | (i1 << 23) | (i2 << 22) | (imm10 << 12) | (imm11 << 1)) << 7) as i32) >> 7) as u32;
                    Thumb32::BlT1(imm32.try_into().unwrap())
                },
                _ => {
                    println!("Undefined instruction");
                    unimplemented!()
                },
            }
        },
        (_, _) => {
            println!("Undefined instruction");
            unimplemented!()
        }
    };

    thumb
}

fn disassemble16(instr: u16) -> Thumb16 {
    let op6 = instr >> 10; // b15..10
    println!("instruction {:016b} opcode {:06b}", instr, op6);

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
                    // A6.7.3 ADD (register) encoding T1
                    let rm = ((instr >> 6) & 0b111) as u8;
                    let rn = ((instr >> 3) & 0b111) as u8;
                    let rd = (instr & 0b111) as u8;
                    Thumb16::AddsRegT1(
                        rm.try_into().unwrap(),
                        rn.try_into().unwrap(),
                        rd.try_into().unwrap(),
                    )
                }

                // 01101 Subtract register          SUB (register) on page A6-165
                0b01101 => {
                    unimplemented!()
                }

                // 01110 Add 3-bit immediate        ADD (immediate) on page A6-101
                0b01110 => {
                    // A6.7.2 ADD (immediate)
                    let imm32 = ((instr >> 6) & 0b111) as u32;
                    let rn = ((instr >> 3) & 0b111) as u8;
                    let rd = ((instr >> 0) & 0b111) as u8;
                    Thumb16::AddsImmT1(imm32, rn.try_into().unwrap(), rd.try_into().unwrap())
                }

                // 01111 Subtract 3-bit immediate   SUB (immediate) on page A6-164
                0b01111 => {
                    unimplemented!()
                }

                // 100xx Move                       MOV (immediate) on page A6-139
                0b10000..=0b10011 => {
                    // A6.7.39 MOV (immediate) T1 Encoding
                    let imm32 = (instr & 0b11111111) as u32;
                    let rd = ((instr >> 8) & 0b111) as u8;

                    Thumb16::MovsImmT1(rd.try_into().unwrap(), imm32)
                }

                // 101xx Compare                    CMP (immediate) on page A6-117
                0b10100..=0b10111 => {
                    // A6.7.17 CMP (immediate)
                    let imm32 = (instr & 0b11111111) as u32;
                    let rn = ((instr >> 8) & 0b111) as u8;
                    Thumb16::CmpImmT1(rn.try_into().unwrap(), imm32)
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
            let reg_3 = ((instr >> 3) & 0b111) as u8;
            let reg_0 = (instr & 0b111) as u8;

            Thumb16::DataProc(dp_op, reg_3.try_into().unwrap(), reg_0.try_into().unwrap())
        }

        // 010001 Special data instructions and branch and exchange on page A5-81
        0b010001 => {
            println!("010001 Special data instructions and branch and exchange on page A5-81");

            let op4 = (instr >> 6) & 0b1111;
            println!("Op4: {:04b}", op4);

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
                    let rm = ((instr >> 3) & 0b1111) as u8;
                    let rd = (((instr >> 4) & 0b1000) | (instr & 0b111)) as u8;
                    Thumb16::MovT1(rm.try_into().unwrap(), rd.try_into().unwrap())
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
            let rt = ((instr >> 8) & 0b111) as u8;
            let imm32 = (instr & 0b11111111) << 2;
            Thumb16::LdrImmT1(rt.try_into().unwrap(), imm32.try_into().unwrap())
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
            let rn = ((instr >> 8) & 0b111) as u8;
            let registers: u16 = (instr & 0xff);
            println!("Registers: {registers:016b}");
            Thumb16::Stm(rn.try_into().unwrap(), registers)
        }

        // Register lists
        // {R2} = 0b0000000000000100
        // {R3} = 0b0000000000001000
        // 
        // 11001x Load multiple registers, see LDM, LDMIA, LDMFD on page A6-125
        0b110010..=0b110011 => {
            println!("11001x Load multiple registers, see LDM, LDMIA, LDMFD on page A6-125");
            let rn = ((instr >> 8) & 0b111) as u8;
            let registers: u16 = (instr & 0xff);
            println!("Registers: {registers:016b}");
            Thumb16::Ldm(rn.try_into().unwrap(), registers)
        }

        // 1101xx Conditional branch, and Supervisor Call on page A5-84
        0b110100..=0b110111 => {
            println!("1101xx Conditional branch, and Supervisor Call on page A5-84");
            let op4 = (instr >> 8) & 0b1111;
            match op4 {
                // 1110 Permanently UNDEFINED   UDF on page A6-171a
                0b1110 => {
                    unimplemented!()
                }

                // 1111 Supervisor Call         SVC on page A6-167
                0b1111 => {
                    unimplemented!()
                }
                // not 111x Conditional branch  B on page A6-110
                _ => {
                    // A6.7.10, Encoding T1
                    let imm32 = ((instr & 0xff) << 1) as u32;
                    let cond: u8 = ((instr >> 8) & 0b1111) as u8;

                    Thumb16::BImmT1(cond.try_into().unwrap(), imm32)
                }
            }
        }

        // 11100x Unconditional Branch, see B on page A6-110
        0b111000..=0b111001 => {
            println!("11100x Unconditional Branch, see B on page A6-110");
            let imm32 = (((((instr & 0b11111111111) << 1) as i32) << 20) >> 20);
            Thumb16::BT2(imm32)
        }

        _ => {
            println!("illegal opcode {:b}", op6);
            unimplemented!()
        }
    };

    thumb16
}

pub fn disassemble(chunk: &[u8]) -> Result<(Thumb, &[u8]), Error> {
    if chunk.len() < 2 {
        return Err(Error::ChunkNotLongEnough);
    }

    let first = chunk[1] >> 3;

    let rest;

    let thumb = match first {
        0b11101..=0b11111 => { // 32 bit instruction
            println!("32 bit instruction");
            // perhaps better to use the `byteorder` crate
            let arr0: [u8; 2] = chunk[0..=1].try_into().unwrap();
            let arr1: [u8; 2] = chunk[2..=3].try_into().unwrap();
            rest = &chunk[4..];
            let instr = (u16::from_le_bytes(arr0) as u32) << 16 | (u16::from_le_bytes(arr1) as u32);
            Thumb::Thumb32(disassemble32(instr))
        },
        _ => { // 16 bit instruction
            println!("16 bit instruction");
            // perhaps better to use the `byteorder` crate
            let arr: [u8; 2] = chunk[0..=1].try_into().unwrap();
            rest = &chunk[2..];
            let instr = u16::from_le_bytes(arr);
            Thumb::Thumb16(disassemble16(instr))
        }
    };

    Ok((thumb, rest))
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

#[test]
fn test_cond() {
    /*
    00000104 <cond_function>:
      104: 0a 28        	cmp	r0, #10
      106: 02 d8        	bhi	0x10e <cond_function+0xa> @ imm = #4
      108: 01 21        	movs	r1, #1
      10a: 08 18        	adds	r0, r1, r0
      10c: 70 47        	bx	lr
      10e: 00 21        	movs	r1, #0
      110: c9 43        	mvns	r1, r1
      112: 08 18        	adds	r0, r1, r0
      114: 70 47        	bx	lr
    */

    let mut chunk: &[u8] = &[
        0x0a, 0x28, // cmp	r0, #10
        0x02, 0xd8, // bhi	0x10e <cond_function+0xa> @ imm = #4
        0x01, 0x21, // movs	r1, #1
        0x08, 0x18, // adds	r0, r1, r0
        0x70, 0x47, // bx	lr
        0x00, 0x21, // movs	r1, #0
        0xc9, 0x43, // mvns	r1, r1
        0x08, 0x18, // adds	r0, r1, r0
        0x70, 0x47, // bx	lr
    ];

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

#[test]
fn test_cond2() {
    /*
    00000116 <cond_function2>:
     116: b0 b5        	push	{r4, r5, r7, lr}
     118: 02 af        	add	r7, sp, #8
     11a: 0c 46        	mov	r4, r1
     11c: 05 46        	mov	r5, r0
     11e: 05 21        	movs	r1, #5
     120: 00 f0 e8 fb  	bl	0x8f4 <__aeabi_uidiv>   @ imm = #2000
     124: a5 42        	cmp	r5, r4
     126: 01 d8        	bhi	0x12c <cond_function2+0x16> @ imm = #2
     128: 20 1a        	subs	r0, r4, r0
     12a: b0 bd        	pop	{r4, r5, r7, pc}
     12c: 60 00        	lsls	r0, r4, #1
     12e: 40 19        	adds	r0, r0, r5
     130: b0 bd        	pop	{r4, r5, r7, pc}
    */

    let mut chunk: &[u8] = &[
        0xb0, 0xb5, // push	{r4, r5, r7, lr}
        0x02, 0xaf, // add	r7, sp, #8
        0x0c, 0x46, // mov	r4, r1
        0x05, 0x46, // mov	r5, r0
        0x05, 0x21, // movs	r1, #5
        0x00, 0xf0, // bl	0x8f4 <__aeabi_uidiv>   @ imm = #2000
        0xe8, 0xfb, //
        0xa5, 0x42, // cmp	r5, r4
        0x01, 0xd8, // bhi	0x12c <cond_function2+0x16> @ imm = #2
        0x20, 0x1a, // subs	r0, r4, r0
        0xb0, 0xbd, // pop	{r4, r5, r7, pc}
        0x60, 0x00, // lsls	r0, r4, #1
        0x40, 0x19, // adds	r0, r0, r5
        0xb0, 0xbd, // pop	{r4, r5, r7, pc}
    ];
}
