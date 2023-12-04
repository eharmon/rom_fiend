#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "Updating submodules..."
git submodule update --init

echo "Creating symlinks..."
ln -sf "$SCRIPT_DIR/Mac ROM.tcl" ~/Library/Application\ Support/com.ridiculousfish.HexFiend/Templates
ln -sf "$SCRIPT_DIR/rom_maps" ~/Library/Application\ Support/com.ridiculousfish.HexFiend/Templates

echo "Done!"
