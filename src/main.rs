use disarm::*;

fn main() {
    let chunk: &[u8] = &[0x40, 0x1c, 0x70, 0x47];
    let dis = disassemble(chunk);

    println!("dis {:?}", dis);
}
