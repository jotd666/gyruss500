import re,json

tr_re = re.compile("(\w+): (.*)")

valid_addresses = dict()

with open("gyruss.tr") as f:
    for line in f:
        m = tr_re.match(line)
        if m:
            address = m.group(1)
            valid_addresses[address] = m.group(2)

with open("executed.json","w") as f:
    json.dump(valid_addresses,f,indent=2)
