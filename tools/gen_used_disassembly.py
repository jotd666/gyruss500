import re,json

tr_re = re.compile("(\w+): (.{12})(.*)")

code = dict()
with open("gyruss_z80_unfiltered.asm") as f:
    for line in f:
        m = tr_re.match(line)
        if m:
            address,hexs,instruction = m.groups()
            code[address] = (hexs,instruction)

with open("executed.json") as f:
    executed = json.load(f)

out = dict()

for k,v in executed.items():
    if k in code:
        out[k] = code[k]
    else:
        out[k] = ("?"*11+" ",v)

end_of_sequence = False
first_inst = True

with open("gyruss_z80.asm","w") as f:
    for address,(hexs,instruction) in sorted(out.items()):
        toks = instruction.split()
        if not first_inst:
            # just had a end of sequence
            old_address = int(prev[0],16)
            new_address = int(address,16)
            old_size = len(prev[1][0].split())
            if not end_of_sequence and new_address != old_address+old_size:
                f.write(f"; partial sequence coverage loss {old_address:04X} => {new_address:04x} ({old_size:X})\n")
        f.write(f"{address}: {hexs}{instruction}\n")
        end_of_sequence = False
        if toks[0] in ["jp","jr","ret","rst"]:
            if toks[0]=="ret":
                if len(toks)==1:
                    end_of_sequence = True
            elif toks[1] == "rst" and toks[2]=="$30":
                end_of_sequence = True
            else:
                if "," not in toks[1]:
                    end_of_sequence = True
        prev = address,(hexs,instruction)
        first_inst = False
        if end_of_sequence:
            # extra linefeed after unconditionnal ret or jump
            f.write("\n")

##with open("gyruss_z80.asm","w") as f:
##    for address,(hexs,instruction) in sorted(out.items()):
##        f.write(f"{address}: {hexs}{instruction}\n")
##        toks = instruction.split()
##        add_linefeed = False
##        if toks[0] in ["jp","jr","ret"]:
##            if toks[0]=="ret":
##                if len(toks)==1:
##                    add_linefeed = True
##            else:
##                if "," not in toks[1]:
##                    add_linefeed = True
##        if add_linefeed:
##            # extra linefeed after unconditionnal ret or jump
##            f.write("\n")