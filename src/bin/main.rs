#![no_std]
#![no_main]

use esp_hal::{
    clock::CpuClock,
    delay::Delay,
    gpio::{Level, Output, OutputConfig},
    main,
};

esp_bootloader_esp_idf::esp_app_desc!();

#[main]
fn main() -> ! {
    let config = esp_hal::Config::default().with_cpu_clock(CpuClock::_80MHz);
    let peripherals = esp_hal::init(config);

    // Set GPIO2 as an output, and set its state high initially.
    let mut led = Output::new(peripherals.GPIO2, Level::High, OutputConfig::default());

    let delay = Delay::new();

    loop {
        led.toggle();
        delay.delay_millis(200);
    }
}

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}