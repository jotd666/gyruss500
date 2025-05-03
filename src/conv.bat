@echo off

rem z80268k.py -o mit gyruss_z80.asm -c conv.s -d data_.inc -r 8000-A800 -m small
6809to68k.py -o mit gyruss_sub_6809.asm -c conv_sub.s -d data_6809.inc
pause
