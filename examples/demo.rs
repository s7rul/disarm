use disarm::{Program, arm_cpu};

fn main() {
    let mut chunk: &[u8] = &[
        0x09, 0x20, // mov r0, #9
        //0x0a, 0x20, // mov r0, #10
        //0x0e, 0x20, // mov r0, #14
        0x0a, 0x28, // cmp	r0, #10
        0x02, 0xd8, // bhi	0x10e <cond_function+0xa> @ imm = #4
        0x01, 0x21, // movs	r1, #1
        0x08, 0x18, // adds	r0, r1, r0
        0x00, 0xbe, // bkpt 0
        0x00, 0x21, // movs	r1, #0
        0xc9, 0x43, // mvns	r1, r1
        0x08, 0x18, // adds	r0, r1, r0
        0x00, 0xbe, // bkpt 0
    ];
    let program = Program::build(chunk, 0x104, 0x20000000);
    let mut cpu = arm_cpu::build();
    cpu.load_program(&program);

    cpu.start(0x104);
}