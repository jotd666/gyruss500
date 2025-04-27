# this tool reads the asm file and binary ROM and inserts jump table data
# after rst $30 instructions

import re

with open("../src/gyruss_z80.asm","r") as f:
    lines = f.readlines()

with open("../assets/rom.bin","rb") as f:
    rom = f.read()

for i,line in enumerate(lines):
    toks = line.split()
    if "rst" in toks and "$30" in toks:
        address = int(line[0:4],16)+1
        # scan to find the first non-blank line
        for j in range(i+1,len(lines)):
            if lines[j].strip():
                break
        else:
            raise Exception("GRRRR")
        block_lines = ["; [jump_table]\n"]
        end_address = int(lines[j][0:4],16)
        binary_insert = rom[address:end_address]
        for k in range(0,len(binary_insert)&0xFFFE,2):
            value = binary_insert[k] + (binary_insert[k+1]<<8)
            bogus = ";  bogus" if value > 0x5FFF else ""
            bl = f"\t.word\t${value:04X}{bogus}\n"
            block_lines.append(bl)

        lines[i] += "".join(block_lines)
with open("../src/gyruss_z80_new.asm","w") as f:
    f.writelines(lines)
