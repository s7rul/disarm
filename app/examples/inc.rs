#![no_main]
#![no_std]

use panic_halt as _;
use stm32l0 as _; // vector table

use cortex_m_rt::entry;
use cortex_m_semihosting::{debug, hprintln};

#[inline(never)]
#[no_mangle]
fn inc_function(x: u32) -> u32 {
    x + 1
}

#[inline(never)]
#[no_mangle]
fn cond_function(x: u32) -> u32 {
    if x > 10 {
        x - 1
    } else {
        x + 1
    }
}

#[inline(never)]
#[no_mangle]
fn cond_function2(x: u32, y: u32) -> u32 {
    if x > y {
        x + y * 2
    } else {
        y - x / 5
    }
}

#[entry]
fn main() -> ! {
    hprintln!("inc(1) = {}", inc_function(1));
    hprintln!("cond(1) = {}", cond_function(1));
    hprintln!("cond(11) = {}", cond_function(11));

    hprintln!("cond2(1, 11) = {}", cond_function2(1, 11));
    hprintln!("cond2(11, 1) = {}", cond_function2(11, 1));

    // exit QEMU
    // NOTE do not run this on hardware; it can corrupt OpenOCD state
    debug::exit(debug::EXIT_SUCCESS);

    loop {}
}
