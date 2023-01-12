
#[derive(Debug)]
pub struct Memmory {
    pub data: Vec<u8>,
}

impl Memmory {
    pub fn write_chunk(&mut self, start_addr: u32, data: &[u8]) {
        for (i, n) in data.iter().enumerate() {
            self.data[i + start_addr as usize] = *n;
        }
    }

    pub fn read_4B(&self, addr: u32) -> [u8; 4] {
        let mut ret: [u8; 4] = [0; 4];
        let i = addr as usize;
        for (j, x) in self.data[i..i + 4].to_owned().iter().enumerate() {
            ret[j] = *x;
        }
        ret
    }

    pub fn read_u32(&self, addr: u32) -> u32 {
        let chunk = self.read_4B(addr);
        let value = u32::from_le_bytes(chunk);
        value
    }

    pub fn write_u32(&mut self, addr: u32, value: u32) {
        let chunk = value.to_le_bytes();
        self.write_chunk(addr, &chunk);
    } 
}