fn main() {
    // Set up the linker script for ESP32
    println!("cargo:rustc-link-arg=-Tlinkall.x");
}
