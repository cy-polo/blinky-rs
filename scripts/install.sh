#!/bin/bash

# Install ESP development tools using rustup and cargo
# espup: Tool to install and manage ESP-IDF toolchain for Rust
# espflash: Tool to flash binaries to ESP32 devices and monitor serial output
rustup run stable cargo install espup@0.15.1 espflash@4.0.1 --locked

# Install ESP32 toolchain and set up the development environment
# This downloads and configures the Xtensa toolchain for ESP32 targets
espup install --targets esp32
