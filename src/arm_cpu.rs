use disarm::{*, ast::*};

mod arm_memmory;
use arm_memmory::*;

pub struct Cpu {
    registers: [u32;16],
    memmory: Memmory,
}

pub fn build() -> Cpu {
    let memmory = Memmory{data: vec![0 as u8;(u32::MAX as usize) + 1]};
    Cpu { registers: [0;16], memmory: memmory}
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

        let should_increment_PC = true;

        println!("executing: {instruction:?}");

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
}