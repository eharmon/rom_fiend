# ROM Fiend: Macintosh DeclROM and System ROM file template for Hex Fiend

This repository includes a file template for [Hex Fiend](http://hexfiend.com), allowing you to
easily inspect and modify ROMs for classic Macintosh.

It supports most commonly used ROMs for 68k and Old World PowerPC Macs, including NuBus and System
ROMs in various capabilities.

New World ROMs are also detected but cannot be parsed yet.

## Installation
For a basic installataion, copy "Mac ROM.tcl" to your Hex Fiend template library.

You can do this automatically, which will also install support for System ROM Symbols by
running:
```
./install.sh
```
This installation script automatically symlinks the template and the required symbol maps into
your Hex Fiend template directory.

You can find more information about templates in this tutorial:

https://github.com/HexFiend/HexFiend/blob/master/templates/Tutorial.md

## Caveats
This template and/or installation method has not been tested with the App Store version of Hex
Fiend and may not work correctly.

## Errors
This file template attempts to handle certain errors automatically, including reversed and
byte-swapped ROMs. If this occurs an ERROR entry will appear at the top-level describing the
issue.

Parsing is still imperfect, and the template can occasionally miscalculate offsets causing
incorrect data reads. When this occurs an ERROR entry will appear at the level where a
miscalculated offset occurred. Unfortunately this error detection can currently cause unexpected
nesting.

## Supported Data Types
- Declaration ROM (DeclROM)
    - NuBus, PDS, and built-in peripherals on 68020+ Macs, including PowerPC.
    - These define plug-and-play parameters for devices, including memory mappings, driver support,
      and basic identification.
    - Almost all data types are supported. Unsupported entries are marked with "TODO" in the Hex
      Fiend view.
    - Driver functions have approximated data lengths as these are difficult to compute
      automatically.
- Extended DeclROM
    - Built-in peripheral definitions in Universal System ROMs after the PowerBook 160 and before a
      later PowerPC device.
    - This is a superset of the normal DeclROM, allowing for multiple data directories to be
      defined which are selected from on system boot.
    - Supports the same data types as regular DeclROMs.
- System ROM Header
    - Basic information about the System ROM. Supported for all System ROMs from the 128k to the
      final Old World ROMs.
- System ROM Resources
    - Toolbox resources including cursors, sounds, drivers, and some device support definitions.
    - Supported for all Universal System ROMs (IIci and newer) and Old World ROMs.
- System ROM Symbols
    - The table of symbols as defined in MPW 3.5, extracted by @cy384. This points to the address
      specified by the symbol, with no body, as that cannot be easily determined without
      decompiling each function.
    - Supports a subset of 68k ROMs. The setion will only be present if matching symbols are found.

## Unsupported Data Types
- System ROM tables
    - Used for some low-level hardware configuration.
    - These are encoded inline with assembly and thus are difficult to parse with Hex Fiend without hardcoding per ROM.
