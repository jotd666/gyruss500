import os,re,pathlib,json
import collections

instruction_re = re.compile("(\w{4}): (.*)")

mame_dir = pathlib.Path(r"K:\Emulation\MAME")

def get_trace(tn):
    pcs = collections.Counter()
    with open(mame_dir / tn,"r") as f:
        nb_inst = 0
        for line in f:
            m = instruction_re.match(line)
            if m:
                nb_inst += 1
                pcs[m.groups()] += 1
    return pcs


# generated using log:     trace galaga.tr
# note: sub cpu log has a bug: trace won't consider tracelog instruction if "sub" is specified. So instead, break into subcpu
# then use trace on current cpu
lst = []
print("reading MAME trace file...")

#pcs = get_trace("maincpu.tr")
spcs = get_trace("subcpu.tr")

#filtered = {str(k):v for k,v in pcs.items() if v > 10000}
subfiltered = {str(k):v for k,v in spcs.items() if v > 10000}

print(json.dumps(subfiltered,indent=2))
