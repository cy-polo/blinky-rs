#!/bin/bash

# Cross-platform flash script for ESP32 development
# Works on Linux, macOS, and Windows (Git Bash/WSL)

# Detect operating system
OS=$(uname -s)

# Source ESP-IDF environment variables on Unix-like systems only
if [[ "$OS" != "MINGW"* && "$OS" != "MSYS"* && "$OS" != "CYGWIN"* ]]; then
    # On Linux/macOS: source the ESP environment
    if [ -f "$HOME/export-esp.sh" ]; then
        echo "Sourcing ESP environment for $OS..."
        . $HOME/export-esp.sh
    fi
fi

# Kill any running espflash processes (cross-platform)
echo "Stopping any running espflash processes..."
case "$OS" in
    MINGW*|MSYS*|CYGWIN*)
        # Windows (Git Bash/MSYS2)
        taskkill //F //IM espflash.exe 2>/dev/null || true
        ;;
    *)
        # Linux/macOS/WSL
        pkill -f espflash 2>/dev/null || true
        ;;
esac

echo "Building and flashing ESP32 binary..."
# Build and flash the ESP32 binary to the device
cargo run
