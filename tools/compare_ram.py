with open("ok_level_1","rb") as f:
    ok = f.read()
with open("buggy_level_1","rb") as f:
    buggy = f.read()

doesnt_matter = set(range(0x9000,0x9010)) | {0x9400,0x9406,0x9410,0x9413,
0x9414,0X9432,0x9433,0x944e,0x9606}

#doesnt_matter = set(range(0x9000,0x948A))

for i,(a,b) in enumerate(zip(ok,buggy),0x9000):
    if i in doesnt_matter:
        continue
    if a != b:
        print(f"diff {i:04x} OK={a:02x} FAIL={b:02x}")

mix_index = 0x48A  # OK
mix_index = 0x400  # FAIL
mix_index = 0x440 # FAIL
mix_index = 0x460  # FAIL
mix_index = 0x470 # FAIL
mix_index = 0x480  # OK
mix_index = 0x47A  # OK
mix_index = 0x476  # FAIL
mix_index = 0x478  # OK

mixed = ok[0:mix_index]+buggy[mix_index:]
with open(r"C:\Users\Public\Documents\Amiga Files\WinUAE\mixed_level_1","wb") as f:
    f.write(mixed)