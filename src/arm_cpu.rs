use disarm::{*, ast::*};

mod arm_memmory;
use arm_memmory::*;

macro_rules! deprecated {
    () => {
        panic!("deprecated instruction")
    };
    ($($arg:tt)+) => {
        panic!("deprecated instruction", format_args!($($arg)+))
    };
}

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
    special_registers: [u32; 12],
    flags: Flags,
    memmory: Memmory,
}

pub fn build() -> Cpu {
    let memmory = Memmory{data: vec![0 as u8;(u32::MAX as usize) + 1]};
    Cpu { should_branch: false, registers: [0;16], special_registers: [0;12], memmory: memmory, flags: Flags { n: false, z: false, c: false, v: false }}
}

impl Cpu {
    pub fn load_program(&mut self, program: &Program) {
        println!("loading program");

        let start_addr = program.get_start_addr();
        println!("start address: {start_addr:x}");

        let stack_start = program.get_start_stack();
        self.write_register(Register::MSP, stack_start);

        self.memmory.write_chunk(start_addr, program.get_text());
    }

    pub fn start(&mut self, start_addr: u32) {
        self.write_register(Register::PC, start_addr);

        while self.tick() {}
    }

    pub fn tick(&mut self) -> bool {
        // reset should branch
        self.should_branch = false;

        let pc = self.registers[15];
        let data = self.memmory.read_4B(pc);
        let (instruction, rest) = match disassemble(&data) {
            Ok(x) => x,
            Err(_) => panic!(),
        };

        if matches!(instruction, Thumb::Thumb16(Thumb16::Bkpt(_))) {
            return false
        }

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
        true
    }

    pub fn print_instruction(&self, addr: u32) {
        let instruction = self.memmory.read_4B(addr);

        let interpretation = match disassemble(&instruction) {
            Ok((x, y)) => x,
            Err(_) => return,
        };

        println!("{:?}", interpretation);
    }

    fn read_special_register(&self, register: SpecialRegister) -> u32 {
        let idx: u8 = register.into();
        match idx {
            0..=9 => {
                self.special_registers[idx as usize]
            }
            16 => { // PRIMASK register
                self.special_registers[10]
            }
            20 => { // CONTROL register
                self.special_registers[11]
            }
            _ => {
                println!("no a special register - should never get here");
                panic!()
            }
        }
    }

    fn write_special_register(&mut self, register: SpecialRegister, value: u32) {
        let idx: u8 = register.into();
        match idx {
            0..=9 => {
                self.special_registers[idx as usize] = value;
            }
            16 => { // PRIMASK register
                self.special_registers[10] = value;
            }
            20 => { // CONTROL register
                self.special_registers[11] = value;
            }
            _ => {
                println!("no a special register - should never get here");
                panic!()
            }
        }
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
                    Thumb16::AddsImmT1(imm32, rn, rd) => {
                        self.add_with_carry_register_imm(*rd, *rn, *imm32, false, true);
                    },
                    Thumb16::BxT1(rm) => {
                        self.do_bx(*rm);
                    },
                    Thumb16::CmpImmT1(rn, imm32) => {
                        let rn_data = self.read_register(*rn);
                        let result = self.add_with_carry_update_flags(rn_data, !*imm32, true) as i32;
                        println!("result: {result}");
                    },
                    Thumb16::BImmT1(cond, imm32) => {
                        self.do_bt1(*cond, *imm32);
                    },
                    Thumb16::MovsImmT1(rd, imm32) => {
                        self.do_movs_imm(*rd, *imm32);
                    },
                    Thumb16::AddsRegT1(rm, rn, rd) => {
                        self.add_with_carry_register_register(*rd, *rm, *rn, false, true);
                    },
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
                    Thumb16::Stm(rn, reg_list) => {
                        self.do_stm(*rn, *reg_list);
                    },
                    Thumb16::BT2(imm32) => {
                        let pc = self.read_register(Register::PC);
                        self.write_register(Register::PC, pc.wrapping_add(*imm32));
                    },
                    Thumb16::Ldm(_, _) => todo!(),
                    Thumb16::Push(reg_list) => {
                        self.do_push(*reg_list);
                    },
                    Thumb16::UdfT1(_) => todo!(),
                    Thumb16::AddSpImmT1(rd, imm32) => {
                        self.add_with_carry_register_imm(*rd, Register::MSP, *imm32, false, false);
                    },
                    Thumb16::SubSpSpImmT1(imm32) => {
                        self.add_with_carry_register_imm(Register::MSP, Register::MSP, !(*imm32), true, false);
                    },
                    Thumb16::STRImmT2(rt, imm32) => {
                        self.write_register_to_memmory_offset(*rt, Register::MSP, *imm32, true);
                    },
                    Thumb16::Bkpt(_) => todo!(),
                }
            },
            Thumb::Thumb32(inst32) => {
                match inst32 {
                    Thumb32::BlT1(imm32) => {
                        self.do_bl(*imm32);
                    },
                    Thumb32::MsrT1(rn, sr) => {
                        todo!()
                    },
                    Thumb32::MrsT1(rd, sr) => {
                        self.do_mrs(*rd, *sr);
                    }
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

    fn do_mrs(&mut self, rd: Register, sr: SpecialRegister) {
        /*
        R[d] = Zeros(32);
        case SYSm<7:3> of
            when ‘00000’
                if SYSm<0> == ‘1’ then
                    R[d]<8:0> = IPSR<8:0>;
                if SYSm<1> == ‘1’ then
                    R[d]<24> = ‘0’; // T-bit reads as zero
                if SYSm<2> == ‘0’ then
                    R[d]<31:27> = APSR<31:27>;
            when ‘00001’ // SP access
                if CurrentModeIsPrivileged() then
                    case SYSm<2:0> of
                        when ‘000’
                            R[d] = SP_main;
                        when ‘001’
                            R[d] = SP_process;
            when ‘00010’ // Priority mask or CONTROL access
                case SYSm<2:0> of
                    when ‘000’
                        R[d]<0> = if CurrentModeIsPrivileged() then PRIMASK<0> else ‘0’;
                    when ‘100’
                        R[d]<1:0> = CONTROL<1:0>;
        */

        let mut rd_to_write: u32 = 0;
        let special_idx: u8 = sr.into();
        match (special_idx >> 3) {
            0b00000 => {
                if (special_idx & 0b1) == 1 {
                    rd_to_write = (rd_to_write & 0xff00) | (self.special_registers[5] & 0xff);
                }
                if (special_idx & 0b10) == 0b10 {
                    rd_to_write = rd_to_write & !(1 << 24);
                }
                if (special_idx &0b100) == 0 {
                    rd_to_write = (rd_to_write & !(0b11111 << 27)) | (self.special_registers[0] & (0b11111 << 27));
                }
            }
            0b00001 => {
                if self.CurrentModeIsPrivileged() {
                    match (special_idx & 0b111) {
                        0b000 => {
                            rd_to_write = self.special_registers[8];
                        }
                        0b001 => {
                            rd_to_write = self.special_registers[9];
                        }
                        _ => panic!()
                    }
                }
            }
            0b00010 => {
                match (special_idx & 0b111) {
                    0b000 => {
                        rd_to_write = if self.CurrentModeIsPrivileged() {
                            self.special_registers[10] & 0b1
                        } else {
                            0b0
                        };
                    }
                    0b100 => {
                        rd_to_write = self.special_registers[11] & 0b11;
                    }
                    _ => panic!()
                }
            }
            _ => panic!()
        }
        self.write_register(rd, rd_to_write);
    }

    fn CurrentModeIsPrivileged(&self) -> bool {
        // always privileged for now
        true
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
        self.add_with_carry_register_imm(Register::PC, Register::PC, imm32, false, false);
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

    fn add_with_carry(x: u32, y: u32, c: bool) -> (u32, bool, bool) {
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
        let s_sum = (x as i32) as i64 + (y as i32) as i64 + (c as i32) as i64;
        let result = u_sum as u32;

        let carry_out = result as u64 != u_sum;
        let overflow = (result as i32) as i64 != s_sum; // weird conversion to handle expansion properly
        (result, carry_out, overflow)
    }

    fn add_with_carry_register_imm(&mut self, rd: Register, rm: Register, imm32: u32, c: bool, setflags: bool) {
        let rm_data = self.read_register(rm);
        let result = if setflags {
            self.add_with_carry_update_flags(rm_data, imm32, c)
        } else {
            Self::add_with_carry(rm_data, imm32, c).0
        };
        self.write_register(rd, result);
    }
    
    fn add_with_carry_register_register(&mut self, rd: Register, rm: Register, rn: Register, c: bool, setflags: bool) {
        let rm_data = self.read_register(rm);
        let rn_data = self.read_register(rn);
        let result = if setflags {
            self.add_with_carry_update_flags(rn_data, rm_data, c)
        } else {
            Self::add_with_carry(rn_data, rm_data, c).0
        };
        self.write_register(rd, result);
    }

    fn add_with_carry_update_flags(&mut self, x: u32, y: u32, c: bool) -> u32 {
        let (result, carry_out, overflow) = Self::add_with_carry(x, y, c);
        /*
        APSR.N = result<31>;
        APSR.Z = IsZeroBit(result);
        APSR.C = carry;
        APSR.V = overflow;
        */

        self.flags.c = carry_out;
        self.flags.v = overflow;
        self.flags.z = result == 0;
        self.flags.n = (result as i32) < 0;
        result
    }

    fn write_register_to_memmory(&mut self, rt: Register, addr: u32) {
        let value = self.read_register(rt);
        self.memmory.write_u32(addr, value);
    }

    // write a register rt to memmory with addr = offset + rn
    fn write_register_to_memmory_offset(&mut self, rt: Register, rn: Register, offset: u32, add: bool) {
        let rn_val = self.read_register(rn);
        let (addr, _, _) = Self::add_with_carry(rn_val, offset, false);
        self.write_register_to_memmory(rt, addr);
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

    fn do_bt1(&mut self, cond: Cond, imm32: u32) {
        if self.condition_passed(cond) {
            let pc = self.read_register(Register::PC);
            self.write_register(Register::PC, pc + imm32);
        }
    }

    fn do_push(&mut self, register_list: RegisterList) {
        let list = register_list.to_vec();
        let len = list.len() as u32;
        let sp = self.read_register(Register::MSP);
        let addr = sp - 4 * len;

        for (i, r) in list.iter().enumerate() {
            let value = self.read_register(*r);
            self.memmory.write_u32(addr + (4 * i as u32), value);
        }

        self.write_register(Register::MSP, sp - 4 * len);
    }
    
    fn do_stm(&mut self, rn: Register, register_list: RegisterList) {
        /*
        if ConditionPassed() then
            EncodingSpecificOperations();
            address = R[n];
            for i = 0 to 14
                if registers<i> == ‘1’ then
                    if i == n && wback && i != LowestSetBit(registers) then
                        MemA[address,4] = bits(32) UNKNOWN; // encoding T1 only
                    else
                        MemA[address,4] = R[i];
                    address = address + 4;
            if wback then R[n] = R[n] + 4*BitCount(registers);
        */

        let addr = self.read_register(rn);
        let list = register_list.to_vec();
        for (i, r) in list.iter().enumerate() {
            if *r == rn {
                deprecated!() // rn is not allowed to be in the list
            }

            let value = self.read_register(*r);
            self.memmory.write_u32(addr + (4 * i as u32), value);
        }

        self.write_register(rn, addr + (4 * list.len() as u32));
    }

    fn set_flag_nz(&mut self, result: u32) {
        self.flags.z = result == 0;
        self.flags.n = (result as i32) < 0;
    }

    fn condition_passed(&self, cond: Cond) -> bool {
        /*
        boolean ConditionPassed()
            cond = CurrentCond();
            // Evaluate base condition.
            case cond<3:1> of
                when ‘000’ result = (APSR.Z == ‘1’); // EQ or NE
                when ‘001’ result = (APSR.C == ‘1’); // CS or CC
                when ‘010’ result = (APSR.N == ‘1’); // MI or PL
                when ‘011’ result = (APSR.V == ‘1’); // VS or VC
                when ‘100’ result = (APSR.C == ‘1’) && (APSR.Z == ‘0’); // HI or LS
                when ‘101’ result = (APSR.N == APSR.V); // GE or LT
                when ‘110’ result = (APSR.N == APSR.V) && (APSR.Z == ‘0’); // GT or LE
                when ‘111’ result = TRUE; // AL
            // Condition flag values in the set ‘111x’ indicate the instruction is always executed.
            // Otherwise, invert condition if necessary.
            if cond<0> == ‘1’ && cond != ‘1111’ then
                result = !result;
            return result;
        */
        let result = match cond {
            Cond::EQ | Cond::NE => {
                self.flags.z
            },
            Cond::CS | Cond::CC => {
                self.flags.c
            },
            Cond::MI | Cond::PL => {
                self.flags.n
            },
            Cond::VS | Cond::VC => {
                self.flags.v
            },
            Cond::HI | Cond::LS => {
                self.flags.c && !self.flags.z
            },
            Cond::GE | Cond::LT => {
                self.flags.n == self.flags.v
            },
            Cond::GT | Cond::LE => {
                (self.flags.n == self.flags.v) && !self.flags.z
            },
            Cond::None => true
        };
        
        match cond {
            Cond::NE | Cond::CC | Cond::PL | Cond::VC | Cond::LS | Cond::LT | Cond::LE => {
                !result
            },
            _ => {
                result
            }
        }
    }
}

// defined on page 344
fn align(x: u32, y: u32) -> u32 {
    y * (x / y)
}


#[test]
fn demo_test() {
    let mut chunk: &[u8] = &[
        0x0f, 0x20, // mov r0, #10
        0x0a, 0x28, // cmp	r0, #10
        0x02, 0xd8, // bhi	0x10e <cond_function+0xa> @ imm = #4
        0x01, 0x21, // movs	r1, #1
        0x08, 0x18, // adds	r0, r1, r0
        0x70, 0x47, // bx	lr
        0x00, 0x21, // movs	r1, #0
        0xc9, 0x43, // mvns	r1, r1
        0x08, 0x18, // adds	r0, r1, r0
        0x00, 0xbe, // bkpt 0
    ];
    let program = Program::build(chunk, 0x104, 0x20000000);
    let mut cpu = build();
    cpu.load_program(&program);

    cpu.start(0x104);
}