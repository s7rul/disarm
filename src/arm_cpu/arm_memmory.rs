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
}