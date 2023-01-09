use disarm::*;

mod arm_cpu;
use arm_cpu::*;

fn main() {
    //let chunk: &[u8] = &[0x40, 0x1c, 0x70, 0x47];
    //let dis = disassemble(chunk);

    //println!("dis {:?}", dis);
    let path = "app/target/thumbv6m-none-eabi/release/examples/inc";
    println!("Trying to read elf file {path}.");
    let path = std::path::PathBuf::from(path);
    let file_data = match std::fs::read(path) {
        Ok(x) => x,
        Err(e) => {
            println!("Could not read file.");
            return
        },
    };

    let program = match read_elf_file(&file_data) {
        Ok(x) => x,
        Err(_) => return,
    };

    let mut cpu:Cpu = build();
    cpu.load_program(&program);

    cpu.start(program.get_start_addr());
}
