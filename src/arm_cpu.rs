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
    should_branch: bool,
    registers: [u32;16],
    flags: Flags,
    memmory: Memmory,
}

pub fn build() -> Cpu {
    let memmory = Memmory{data: vec![0 as u8;(u32::MAX as usize) + 1]};
    Cpu { should_branch: false, registers: [0;16], memmory: memmory, flags: Flags { n: false, z: false, c: false, v: false }}
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

        for _ in 0..500 {
            self.tick();
        }
    }

    pub fn tick(&mut self) {
        // reset should branch
        self.should_branch = false;

        let pc = self.registers[15];
        let data = self.memmory.read_4B(pc);
        let (instruction, rest) = match disassemble(&data) {
            Ok(x) => x,
            Err(_) => panic!(),
        };


        println!("executing: {instruction:?}");
        self.execute(&instruction);

        self.print_registers_and_flags();

        if !self.should_branch {
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

        // special case for PC
        if i == 15 {
            self.should_branch = true; // if PC is written to always branch
            let to_write = value & 0xfffffffe; // set lowest bit to 0 forcing alignment
            self.registers[i as usize] = to_write;
        } else {
            self.registers[i as usize] = value;
        }
    } 

    pub fn print_registers_and_flags(&self) {
        println!("Flags N: {:?} Z: {:?} C: {:?} V:{:?}", self.flags.n, self.flags.z, self.flags.c, self.flags.v);
        for (i, n) in self.registers.iter().enumerate() {
            let reg: Register = (i as u8).try_into().unwrap();
            let s = *n as i32;
            println!("{reg:?}: {n:#x} signed: {s} unsigned: {n}")
        }
    }

    fn execute(&mut self, instruction: &Thumb) { // returns if pc should be incremented or not
        match instruction {
            Thumb::Thumb16(inst16) => {
                match inst16 {
                    Thumb16::AddsImmT1(_, _, _) => todo!(),
                    Thumb16::BxT1(rm) => {
                        self.do_bx(*rm);
                    },
                    Thumb16::CmpImmT1(_, _) => todo!(),
                    Thumb16::BImmT1(_, _) => todo!(),
                    Thumb16::MovsImmT1(rd, imm32) => {
                        self.do_movs_imm(*rd, *imm32);
                    },
                    Thumb16::AddsRegT1(_, _, _) => todo!(),
                    Thumb16::DataProc(dp_op_code, r1, r2) => {
                        self.do_data_proc(dp_op_code, r1, r2);
                    },
                    Thumb16::MovT1(rm, rd) => {
                        let result = self.read_register(*rm);
                        self.write_register(*rd, result);
                    },
                    Thumb16::LdrImmT1(rt, imm32) => {
                        self.do_ldr_imm(*rt, *imm32);
                    },
                    Thumb16::Stm(_, _) => todo!(),
                    Thumb16::BT2(_) => todo!(),
                    Thumb16::Ldm(_, _) => todo!(),
                    Thumb16::Push(_) => todo!(),
                    Thumb16::UdfT1(_) => todo!(),
                }
            },
            Thumb::Thumb32(inst32) => {
                match inst32 {
                    Thumb32::BlT1(imm32) => {
                        self.do_bl(*imm32);
                    },
                }
            }
        }
    }

    fn do_data_proc(&mut self, dp_op_code: &DpOpcode, r1: &Register, r2: &Register) {
        match dp_op_code {
            DpOpcode::AND => todo!(),
            DpOpcode::OR => todo!(),
            DpOpcode::LSL => todo!(),
            DpOpcode::LSR => todo!(),
            DpOpcode::ASR => todo!(),
            DpOpcode::ADC => todo!(),
            DpOpcode::SBC => todo!(),
            DpOpcode::ROR => todo!(),
            DpOpcode::TST => todo!(),
            DpOpcode::RSB => todo!(),
            DpOpcode::CMP => {
                // r1 -> rm r2 -> rn
                self.do_cmp_r(*r1, *r2);
            },
            DpOpcode::CMN => todo!(),
            DpOpcode::ORR => todo!(),
            DpOpcode::MUL => todo!(),
            DpOpcode::BIC => todo!(),
            DpOpcode::MVN => {
                self.do_mvn_register(*r1, *r2);
            },
        }
    }

    fn do_mvn_register(&mut self, rd: Register, rm: Register) {
        /*
        if ConditionPassed() then
            EncodingSpecificOperations();
            (shifted, carry) = Shift_C(R[m], shift_t, shift_n, APSR.C); // do not shift
            result = NOT(shifted);
            R[d] = result;
            if setflags then // always true
                APSR.N = result<31>;
                APSR.Z = IsZeroBit(result);
                APSR.C = carry;
                // APSR.V unchanged§
        */

        let data_rm = self.read_register(rm);
        let data_rd = !data_rm;
        self.flags.z = data_rd == 0;
        self.flags.c = false; // no carry science no shift
        self.write_register(rd, data_rd);
    }

    fn do_bl(&mut self, imm32: u32) {
        /*
        if ConditionPassed() then
            EncodingSpecificOperations();
            next_instr_addr = PC;
            LR = next_instr_addr<31:1> : ‘1’;
            BranchWritePC(PC + imm32);
        */
        let next_instr_addr = self.read_register(Register::PC);
        self.write_register(Register::LR, next_instr_addr | 0b1);
        self.write_register(Register::PC, imm32 + next_instr_addr);
    }

    fn do_bx(&mut self, rm: Register) {
        // this should do stuff with privileges but have not implemented yet
        let addr = self.read_register(rm);
        self.write_register(Register::PC, addr);
    }

    fn do_ldr_imm(&mut self, rt: Register, imm32: u32) {
        /*
        if ConditionPassed() then
            EncodingSpecificOperations();
            base = Align(PC,4);
            address = if add then (base + imm32) else (base - imm32); // always add
            R[t] = MemU[address,4];
        */
        let pc = self.read_register(Register::PC);
        let base = align(pc, 4);
        let addr = base + imm32;
        let value = self.memmory.read_u32(addr);
        self.write_register(rt, value);
    }

    fn do_cmp_r(&mut self, rm: Register, rn: Register) {
        /*
        if ConditionPassed() then
            EncodingSpecificOperations();
            shifted = Shift(R[m], shift_t, shift_n, APSR.C);
            (result, carry, overflow) = AddWithCarry(R[n], NOT(shifted), ‘1’);
            APSR.N = result<31>;
            APSR.Z = IsZeroBit(result);
            APSR.C = carry;
            APSR.V = overflow;
        */

        let rn_val = self.read_register(rn);
        let rm_val = self.read_register(rm);
        self.add_with_carry_update_flags(rn_val, !rm_val, true);
    }

    fn add_with_carry_update_flags(&mut self, x: u32, y: u32, c: bool) -> u32 {
        /*
        (bits(N), bit, bit) AddWithCarry(bits(N) x, bits(N) y, bit carry_in)
            unsigned_sum = UInt(x) + UInt(y) + UInt(carry_in);
            signed_sum = SInt(x) + SInt(y) + UInt(carry_in);
            result = unsigned_sum<N-1:0>; // same value as signed_sum<N-1:0>
            carry_out = if UInt(result) == unsigned_sum then ‘0’ else ‘1’;
            overflow = if SInt(result) == signed_sum then ‘0’ else ‘1’;
            return (result, carry_out, overflow);
        */
        let u_sum = x as u64 + y as u64 + c as u64;
        let s_sum = x as i64 + y as i64 + c as i64;
        let result = u_sum as u32;

        let carry_out = result as u64 == u_sum;
        let overflow = (result as i32) as i64 == s_sum; // weird conversion to handle expansion properly

        self.flags.c = carry_out;
        self.flags.v = overflow;
        self.flags.z = result == 0;
        self.flags.n = (result as i32) < 0;
        result
    }

    fn do_movs_imm(&mut self, rd: Register, imm32: u32) {
        /*if ConditionPassed() then
            EncodingSpecificOperations();
            result = imm32;
            R[d] = result;
            if setflags then
                APSR.N = result<31>;
                APSR.Z = IsZeroBit(result);
                APSR.C = carry;
                // APSR.V unchanged */
        
        self.write_register(rd, imm32);
        // setflags always true here in ARMv6-M.
        self.set_flag_nz(imm32);
    }

    fn set_flag_nz(&mut self, result: u32) {
        self.flags.z = result == 0;
        self.flags.n = (result as i32) < 0;
    }
}

// defined on page 344
fn align(x: u32, y: u32) -> u32 {
    y * (x / y)
}