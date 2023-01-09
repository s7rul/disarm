use disarm::{*, ast::*};

mod arm_memmory;
use arm_memmory::*;

#[derive(Debug)]
struct Flags {
    n: bool, // N bit [31] Negative condition code flag. Set to bit [31] of the result of the instruction. If the result is regarded as a two's complement signed integer, then N is set to 1 if the result is negative and set to 0 if it is positive or zero.
    z: bool, // Z bit [30] Zero condition code flag. Set to 1 if the result of the instruction is zero, and to 0 otherwise. A result of zero often indicates an equal result from a comparison. 
    c: bool, // C, bit [29] Carry condition code flag. Set to 1 if the instruction results in a carry condition, for example an unsigned overflow on an addition.
    v: bool, // V, bit [28] Overflow condition code flag. Set to 1 if the instruction results in an overflow condition, for example a signed overflow on an addition.
}

#[derive(Debug)]
pub struct Cpu {
    registers: [u32;16],
    flags: Flags,
    memmory: Memmory,
}

pub fn build() -> Cpu {
    let memmory = Memmory{data: vec![0 as u8;(u32::MAX as usize) + 1]};
    Cpu { registers: [0;16], memmory: memmory, flags: Flags { n: false, z: false, c: false, v: false }}
}

impl Cpu {
    pub fn load_program(&mut self, program: &Program) {
        println!("loading program");

        let start_addr = program.get_start_addr();
        println!("start address: {start_addr:x}");

        self.memmory.write_chunk(start_addr, program.get_text());
    }

    pub fn start(&mut self, start_addr: u32) {
        self.write_register(Register::PC, start_addr);

        for _ in 0..5 {
            self.tick();
        }
    }

    pub fn tick(&mut self) {
        let pc = self.registers[15];
        let data = self.memmory.read_4B(pc);
        let (instruction, rest) = match disassemble(&data) {
            Ok(x) => x,
            Err(_) => panic!(),
        };


        println!("executing: {instruction:?}");
        let should_increment_PC = self.execute(&instruction);

        self.print_registers_and_flags();

        if should_increment_PC {
            // increment PC
            match instruction {
                Thumb::Thumb16(_) => {
                    self.registers[15] += 2;
                },
                Thumb::Thumb32(_) => {
                    self.registers[15] += 4;
                }
            }
        }
    }

    pub fn print_instruction(&self, addr: u32) {
        let instruction = self.memmory.read_4B(addr);

        let interpretation = match disassemble(&instruction) {
            Ok((x, y)) => x,
            Err(_) => return,
        };

        println!("{:?}", interpretation);
    }
    
    fn read_register(&self, register: Register) -> u32 {
        let i: u8 = register.into();

        // special case for PC
        if i == 15 {
            self.registers[i as usize] + 4
        } else {
            self.registers[i as usize]
        }
    }

    fn write_register(&mut self, register: Register, value: u32) {
        let i: u8 = register.into();
        self.registers[i as usize] = value;
    } 

    pub fn print_registers_and_flags(&self) {
        println!("Flags N: {:?} Z: {:?} C: {:?} V:{:?}", self.flags.n, self.flags.z, self.flags.c, self.flags.v);
        for (i, n) in self.registers.iter().enumerate() {
            let reg: Register = (i as u8).try_into().unwrap();
            let s = *n as i32;
            println!("{reg:?}: {n:#x} signed: {s} unsigned: {n}")
        }
    }

    fn execute(&mut self, instruction: &Thumb) -> bool { // returns if pc should be incremented or not
        let should_increment_PC = true;

        match instruction {
            Thumb::Thumb16(inst16) => {
                match inst16 {
                    Thumb16::AddsImmT1(_, _, _) => todo!(),
                    Thumb16::BxT1(_) => todo!(),
                    Thumb16::CmpImmT1(_, _) => todo!(),
                    Thumb16::BImmT1(_, _) => todo!(),
                    Thumb16::MovsImmT1(rd, imm32) => {
                        /*if ConditionPassed() then
                            EncodingSpecificOperations();
                            result = imm32;
                            R[d] = result;
                            if setflags then
                                APSR.N = result<31>;
                                APSR.Z = IsZeroBit(result);
                                APSR.C = carry;
                                // APSR.V unchanged */
                        
                        self.write_register(*rd, *imm32);
                        // setflags always false here in ARMv6-M.
                    },
                    Thumb16::AddsRegT1(_, _, _) => todo!(),
                    Thumb16::DataProc(_, _, _) => todo!(),
                    Thumb16::MovT1(_, _) => todo!(),
                    Thumb16::LdrImmT1(_, _) => todo!(),
                    Thumb16::Stm(_, _) => todo!(),
                    Thumb16::BT2(_) => todo!(),
                    Thumb16::Ldm(_, _) => todo!(),
                    Thumb16::Push(_) => todo!(),
                    Thumb16::UdfT1(_) => todo!(),
                }
            },
            Thumb::Thumb32(inst32) => {
                match inst32 {
                    Thumb32::BlT1(_) => todo!(),
                }
            }
        }
        
        should_increment_PC
    }
}