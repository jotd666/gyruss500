from PIL import Image,ImageOps
import os,sys,bitplanelib

from shared import *


sprite_names = get_sprite_names()

NB_SPRITES = 0x200

dump_it = True

if dump_it:
    if not os.path.exists(dump_dir):
        os.mkdir(dump_dir)
        with open(os.path.join(dump_dir,".gitignore"),"w") as f:
            f.write("*")


def dump_asm_bytes(*args,**kwargs):
    bitplanelib.dump_asm_bytes(*args,**kwargs,mit_format=True)


def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            os.remove(os.path.join(d,f))
    else:
        os.makedirs(d)

def load_tileset(image_name,palette_index,width,height,tileset_name,dumpdir,dump=False,name_dict=None,cluts=None,tile_number=0):

##    if isinstance(image_name,str):
##        full_image_path = os.path.join(this_dir,os.path.pardir,"sheets",
##                            tile_type,image_name)
##        tiles_1 = Image.open(full_image_path)
##    else:
    tiles_1 = image_name
    nb_rows = tiles_1.size[1] // height
    nb_cols = tiles_1.size[0] // width


    tileset_1 = []

    if dump:
        dump_subdir = os.path.join(dumpdir,tileset_name)
        if palette_index == 0 and tile_number == 0:
            ensure_empty(dump_subdir)

    palette = set()

    for j in range(nb_rows):
        for i in range(nb_cols):

            if cluts and palette_index not in cluts[tile_number]:
                # no clut declared for that tile
                tileset_1.append(None)
            else:

                img = Image.new("RGB",(width,height))
                img.paste(tiles_1,(-i*width,-j*height))

                # only consider colors of used tiles
                palette.update(set(bitplanelib.palette_extract(img)))


                tileset_1.append(img)
                if dump:
                    img = ImageOps.scale(img,5,resample=Image.Resampling.NEAREST)
                    if name_dict:
                        name = name_dict.get(tile_number,"unknown")
                    else:
                        name = "unknown"

                    img.save(os.path.join(dump_subdir,f"{name}_{tile_number:02x}_{palette_index:02x}.png"))

            tile_number += 1

    return sorted(set(palette)),tileset_1



sprite_cluts = [[] for _ in range(NB_SPRITES)]
##hw_sprite_cluts = [[] for _ in range(64)]
nb_planes = 5

nb_colors = 1<<nb_planes
# colors collected from tiles/sprites but reported by Marconelly@eab as not used. Seems to be right
colors_to_remove = {(104, 0, 251), (0, 255, 171)}




def add_sprite(index,cluts=[0]):
    if isinstance(index,range):
        pass
    elif not isinstance(index,(list,tuple)):
        index = [index]
    for idx in index:
        sprite_cluts[idx] = cluts

with open(used_graphics_dir / "used_sprites","rb") as f:
    for index in range(NB_SPRITES):
        d = f.read(16)
        cluts = [i for i,c in enumerate(d) if c]
        if cluts:
            add_sprite(index,cluts=cluts)

if dump_it:
    with open(dump_dir / "used_sprites.json","w") as f:
        sprite_cluts_dict = {hex(k):v for k,v in enumerate(sprite_cluts) if v}
        json.dump(sprite_cluts_dict,f,indent=2)

def add_hw_sprite(index,name,cluts=[0]):
    if isinstance(index,range):
        pass
    elif not isinstance(index,(list,tuple)):
        index = [index]
    for idx in index:
        sprite_names[idx] = name
        hw_sprite_cluts[idx] = cluts

# 24 bit colors that Marconelly reported as the only colors used, we'll see
#actually_used_colors = ["ff00fb", "0000fb", "0000ab", "2147fb", "0068fb", "00defb",
#"defffb", "00ff00", "009700", "97de00", "ffff00", "ffb800", "de9700", "b82100", "ff0000",
#680000"]
#actually_used_colors = {tuple(int(c[i:i+2],16) for i in range(0,6,2)) for c in actually_used_colors}


def remove_colors(imgname):

    img = Image.open(imgname)
    return img
    for x in range(img.size[0]):
        for y in range(img.size[1]):
            c = img.getpixel((x,y))
            if c in colors_to_remove:
                img.putpixel((x,y),(0,0,0))
    return img


sprite_sheet_dicts = [{i:remove_colors(os.path.join(sheets_path,"sprites",f"set_{z}",f"pal_{i:02x}.png")) for i in range(16)} for z in (0,1)]
tile_sheet_dict = {i:remove_colors(os.path.join(sheets_path,"tiles",f"pal_{i:02x}.png")) for i in range(16)}

tile_palette = set()
tile_set_list = []

for i,tsd in tile_sheet_dict.items():
    tp,tile_set = load_tileset(tsd,i,8,8,"tiles",dump_dir,dump=dump_it,name_dict=None)
    tile_set_list.append(tile_set)
    tile_palette.update(tp)

sprite_palette = set()
sprite_set_list = [[] for _ in range(16)]
hw_sprite_set_list = []

for j,sprite_sheet_dict in enumerate(sprite_sheet_dicts):
    for clut_index,tsd in sprite_sheet_dict.items():
        # BOBs
        cluts = sprite_cluts
        sp,sprite_set = load_tileset(tsd,clut_index,16,8,"sprites",dump_dir,dump=dump_it,
        name_dict=sprite_names,cluts=sprite_cluts,
        tile_number=j*0x100)
        sprite_set_list[clut_index] += sprite_set
        sprite_palette.update(sp)


# sprite_set_list is now a 16x512 matrix of sprite tiles

    # Hardware sprites
##    cluts = hw_sprite_cluts
##    _,hw_sprite_set = load_tileset(tsd,i,16,"hw_sprites",dump_dir,dump=dump_it,name_dict=sprite_names,cluts=cluts)
##    hw_sprite_set_list.append(hw_sprite_set)


full_palette = sorted(sprite_palette | tile_palette)

#full_palette_rgb4 = {(x>>4,y>>4,z>>4) for x,y,z in full_palette}
#actually_used_colors_rgb4 = {(x>>4,y>>4,z>>4) for x,y,z in actually_used_colors}
#unused_colors = full_palette_rgb4 - actually_used_colors_rgb4
#print([(hex(x<<4),hex(y<<4),hex(z<<4)) for x,y,z in unused_colors])

# pad just in case we don't have 16 colors (but we have)
full_palette += (nb_colors-len(full_palette)) * [(0x10,0x20,0x30)]



plane_orientations = [("standard",lambda x:x),
("flip",ImageOps.flip),
("mirror",ImageOps.mirror),
("flip_mirror",lambda x:ImageOps.flip(ImageOps.mirror(x)))]

def read_tileset(img_set_list,palette,plane_orientation_flags,cache,is_bob):
    next_cache_id = 1
    tile_table = []
    for n,img_set in enumerate(img_set_list):
        tile_entry = []
        for i,tile in enumerate(img_set):
            entry = dict()
            if tile:

                for b,(plane_name,plane_func) in zip(plane_orientation_flags,plane_orientations):
                    if b:

                        actual_nb_planes = nb_planes
                        wtile = plane_func(tile)

                        if is_bob:
                            y_start,wtile = bitplanelib.autocrop_y(wtile)
                            height = wtile.size[1]
                            actual_nb_planes += 1
                            bitplane_data = bitplanelib.palette_image2raw(wtile,None,palette,generate_mask=True,blit_pad=True)
                        else:
                            height = 8
                            y_start = 0
                            bitplane_data = bitplanelib.palette_image2raw(wtile,None,palette)

                        plane_size = len(bitplane_data) // actual_nb_planes
                        bitplane_plane_ids = []
                        for j in range(actual_nb_planes):
                            offset = j*plane_size
                            bitplane = bitplane_data[offset:offset+plane_size]

                            cache_id = cache.get(bitplane)
                            if cache_id is not None:
                                bitplane_plane_ids.append(cache_id)
                            else:
                                if any(bitplane):
                                    cache[bitplane] = next_cache_id
                                    bitplane_plane_ids.append(next_cache_id)
                                    next_cache_id += 1
                                else:
                                    bitplane_plane_ids.append(0)  # blank
                        entry[plane_name] = {"height":height,"y_start":y_start,"bitplanes":bitplane_plane_ids}

            tile_entry.append(entry)

        tile_table.append(tile_entry)

    new_tile_table = [[[] for _ in range(16)] for _ in range(len(tile_table[0]))]

    # reorder/transpose. We have 16 * 256 we need 256 * 16
    for i,u in enumerate(tile_table):
        for j,v in enumerate(u):
            new_tile_table[j][i] = v

    return new_tile_table

tile_plane_cache = {}
tile_table = read_tileset(tile_set_list,full_palette,[True,False,False,False],cache=tile_plane_cache, is_bob=False)

bob_plane_cache = {}
sprite_table = read_tileset(sprite_set_list,full_palette,[True,False,True,False],cache=bob_plane_cache, is_bob=True)

with open(os.path.join(src_dir,"palette.68k"),"w") as f:
    bitplanelib.palette_dump(full_palette,f,bitplanelib.PALETTE_FORMAT_ASMGNU)

with open(os.path.join(src_dir,"graphics.68k"),"w") as f:
    f.write("\t.global\tcharacter_table\n")
    f.write("\t.global\tbob_table\n")

    f.write("character_table:\n")

    for i,tile_entry in enumerate(tile_table):
        f.write("\t.long\t")
        if tile_entry:
            f.write(f"tile_{i:02x}")
        else:
            f.write("0")
        f.write("\n")

    for i,tile_entry in enumerate(tile_table):
        if tile_entry:
            f.write(f"tile_{i:02x}:\n")
            for j,t in enumerate(tile_entry):
                f.write("\t.long\t")
                if t:
                    f.write(f"tile_{i:02x}_{j:02x}")
                else:
                    f.write("0")
                f.write("\n")


    for i,tile_entry in enumerate(tile_table):
        if tile_entry:
            for j,t in enumerate(tile_entry):
                if t:
                    name = f"tile_{i:02x}_{j:02x}"

                    f.write(f"{name}:\n")
                    for orientation,_ in plane_orientations:
                        f.write("* {}\n".format(orientation))
                        if orientation in t:
                            data = t[orientation]
                            for bitplane_id in data["bitplanes"]:
                                f.write("\t.long\t")
                                if bitplane_id:
                                    f.write(f"tile_plane_{bitplane_id:02d}")
                                else:
                                    f.write("0")
                                f.write("\n")
                            if len(t)==1:
                                # optim: only standard
                                break
                        else:
                            for _ in range(nb_planes):
                                f.write("\t.long\t0\n")



    for k,v in tile_plane_cache.items():
        f.write(f"tile_plane_{v:02d}:")
        dump_asm_bytes(k,f)

    f.write("bob_table:\n")
    for i,tile_entry in enumerate(sprite_table):
        f.write("\t.long\t")
        if tile_entry:
            prefix = sprite_names.get(i,"bob")
            f.write(f"{prefix}_{i:02x}")
        else:
            f.write("0")
        f.write("\n")

    for i,tile_entry in enumerate(sprite_table):
        if tile_entry:
            prefix = sprite_names.get(i,"bob")
            f.write(f"{prefix}_{i:02x}:\n")
            for j,t in enumerate(tile_entry):
                f.write("\t.long\t")
                if t:
                    f.write(f"{prefix}_{i:02x}_{j:02x}")
                else:
                    f.write("0")
                f.write("\n")


    for i,tile_entry in enumerate(sprite_table):
        if tile_entry:
            prefix = sprite_names.get(i,"bob")
            for j,t in enumerate(tile_entry):
                if t:
                    name = f"{prefix}_{i:02x}_{j:02x}"

                    f.write(f"{name}:\n")
                    height = 0
                    width = 4
                    offset = 0
                    for orientation,_ in plane_orientations:
                        if orientation in t:
                            height = t[orientation]["height"]
                            offset = t[orientation]["y_start"]
                            break
                    else:
                        raise Exception(f"height not found for {name}!!")
                    for orientation,_ in plane_orientations:
                        if orientation in t:
                            f.write("* {}\n".format(orientation))
                            f.write(f"\t.word\t{height},{width},{offset}\n")
                            for bitplane_id in t[orientation]["bitplanes"]:
                                f.write("\t.long\t")
                                if bitplane_id:
                                    f.write(f"bob_plane_{bitplane_id:02d}")
                                else:
                                    f.write("0")
                                f.write("\n")
                            if len(t)==1:
                                # optim: only standard
                                break

    f.write("\t.section\t.datachip\n")

    for k,v in bob_plane_cache.items():
        f.write(f"bob_plane_{v:02d}:")
        dump_asm_bytes(k,f)

