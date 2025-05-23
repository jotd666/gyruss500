from PIL import Image,ImageOps
import os,sys,bitplanelib,subprocess,json,pathlib

this_dir = pathlib.Path(__file__).absolute().parent

data_dir = this_dir / ".." / ".."
src_dir = this_dir / ".." / ".." / "src" / "amiga"

sheets_path = this_dir / ".." / "sheets"
dump_dir = this_dir / "dumps"

used_sprite_cluts_file = this_dir / "used_sprite_cluts.json"
used_tile_cluts_file = this_dir / "used_tile_cluts.json"
used_graphics_dir = this_dir / "used_graphics"

def palette_pad(palette,pad_nb):
    palette += (pad_nb-len(palette)) * [(0x10,0x20,0x30)]

def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            x = os.path.join(d,f)
            if os.path.isfile(x):
                os.remove(x)
    else:
        os.makedirs(d)

def ensure_exists(d):
    if os.path.exists(d):
        pass
    else:
        os.makedirs(d)

def get_sprite_names():
    rval = {}
    def add_range(a,b,name):
        for i in range(a,b):
            rval[i] = name
    def add_dual_range(a,b,name):
        for i in range(a,b):
            rval[i] = name
            rval[i+0x100] = name
    def add(i,name):
            rval[i] = name

    add_dual_range(0x3A,0x3F,"small_blue_enemy")
    add_dual_range(1,0x13,"player_ship")
    add_range(0x1C0,0x1C5,"player_ship")
    add_dual_range(0xD0,0xD3,"player_ship")
    add_dual_range(0x34,0x39,"iceberg")
    add_dual_range(0x8A,0x90,"death_ray")
    add(0x134,"iceberg")
    add_dual_range(0xD4,0xDD,"earth")
    add_dual_range(0x2F,0x34,"explosion")
    add_dual_range(0xa0,0xcf,"blue_saucer")
    add_dual_range(0x4b,0x55,"side_satellite")
    add_dual_range(0xbc,0xc0,"bonus_satellite")
    add_dual_range(0xde,0xef,"blue_saucer")
    add_dual_range(0x71,0x77,"blue_saucer")
    add_dual_range(0x18,0x1f,"player_laser")
    add_dual_range(0x1f,0x23,"enemy_bomb")
    add_dual_range(0x78,0x7A,"neptune")

    return rval
