//! Prints "Hello, world!" on the host console using semihosting

#![no_main]
#![no_std]

use panic_halt as _;
use stm32l0 as _; // vector table
use core::arch::asm;

use cortex_m_rt::entry;
use cortex_m_semihosting::{debug, hprintln};

#[entry]
fn main() -> ! {
    unsafe {
        asm!{
            "stm 2, {4}",
            "stm 0!, {2}",
        }
    }

    loop {}
}
