ROM Fiend: Macintosh DeclROM and System ROM file template for Hex Fiend
-----------------------------------------------------------------------

This repository includes a file template for [Hex Fiend](http://hexfiend.com), allowing you to
easily inspect and modify ROMs for classic Macintosh (68k and Old World PowerPC).

It supports most commonly used ROMs for 68020+ Macs, including the System ROM.

Installation
------------
To install, copy "Mac ROM.tcl" to your Hex Fiend template library. You can find more information
at this tutorial:

https://github.com/HexFiend/HexFiend/blob/master/templates/Tutorial.md

Errors
------
This file template attempts to handle certain errors automatically, including reversed and
byte-swapped ROMs. If this occurs an ERROR entry will appear at the top-level describing the
issue.

Parsing is still imperfect, and the template can occasionally miscalculate offsets causing
incorrect data reads. When this occurs an ERROR entry will appear at the level where a
miscalculated offset occurred. Unfortunately this error detection can currently cause unexpected
nesting.

Supported Data Types
--------------------
- Declaration ROM (DeclROM)
    - NuBus and PDS peripherals on 68020+ Macs. Also used for System ROMs before 4.0 (most
      machines released before the PowerBook 160).
    - These define plug-and-play parameters for devices, including memory mappings, driver support,
      and basic identification.
    - Almost all data types are supported. Unsupported entries are marked with "TODO" in the Hex
      Fiend view.
- Extended DeclROM
    - Board definitions in System ROMs after the PowerBook 160.
    - This is a superset of the normal DeclROM, allowing for multiple data directories to be
      defined which are selected from on system boot.
    - Supports the same data types as regular DeclROMs.
- System ROM Resources
    - Toolbox resources including cursors, sounds, drivers, and some device support definitions.

Unsupported Data Types
----------------------
- System ROM tables
    - Used for some low-level hardware configuration.
    - These are encoded inline with assembly and thus are difficult to parse with Hex Fiend without hardcoding per ROM.
