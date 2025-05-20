import os,pathlib,shutil,json

from shared import *


used_name = "used_sprites"

merged_path_file = used_graphics_dir

# first 512 tiles are the player tiles. Game level 1 has all the moves, so we have to propagate those to
# all other levels. 512*16=8192 first bytes must be copied from level 1 logs



# merge sprites with existing file + moves from level 1
used_dump = data_dir / used_name
with open(used_dump,"rb") as f:
    new_contents = f.read()


old_used = merged_path_file / used_name
if old_used.exists():
    with open(old_used,"rb") as f:
        old_contents = f.read()
else:
    old_contents = bytes(16*512)

contents = bytes([a|b for a,b in zip(new_contents,old_contents)])

if old_contents == contents:
    print("Nothing new")
else:
    for i,(a,b) in enumerate(zip(old_contents,contents)):
        if a!=b:
            code,clut = divmod(i,16)
            print(f"New: code={code:02x}, clut={clut:02x}")
    with open(merged_path_file / used_name,"wb") as f:
        f.write(contents)

