from PIL import Image,ImageOps
import os,pathlib

this_dir = os.path.dirname(os.path.abspath(__file__))

with open(os.path.join(this_dir,"sprites"),"rb") as f:
    m_spriteram = f.read()





def load_tileset(image_name,width,height,set_subdir,dump_prefix=""):
    full_image_path = os.path.join(this_dir,"sheets","sprites",set_subdir,image_name)
    tiles_1 = Image.open(full_image_path)
    nb_rows = tiles_1.size[1] // height
    nb_cols = tiles_1.size[0] // width

    dumpdir = pathlib.Path("dumps_")
    dumpdir.mkdir(exist_ok=True)

    tileset_1 = []
    k=0
    for j in range(nb_rows):
        for i in range(nb_cols):
            img = Image.new("RGBA",(width,height))
            img.paste(tiles_1,(-i*width,-j*height))
            tileset_1.append(img)
            if dump_prefix:
                img = ImageOps.scale(img,5,resample=Image.Resampling.NEAREST)
                img.save(os.path.join(dumpdir,f"{dump_prefix}_{k:02x}.png"))
            k += 1

    return tileset_1

def loadtiles(i,set_name):
    return load_tileset(f"pal_{i:02x}.png",16,8,set_name)

tile_sets_0 = [loadtiles(i,"set_0") for i in range(16)]
tile_sets_1 = [loadtiles(i,"set_1") for i in range(16)]
tile_set = [tile_sets_0,tile_sets_1]

result = Image.new("RGB",(256,256))

for offs in range(0xBC,-4,-4):
    x = m_spriteram[offs]
    y = 241 - m_spriteram[offs + 3]
    y = 256 -y # adding this to MAME formula else pic is not correct

    gfx_bank = m_spriteram[offs + 1] & 0x01
    code = ((m_spriteram[offs + 2] & 0x20) << 2) | (m_spriteram[offs + 1] >> 1)
    color = m_spriteram[offs + 2] & 0x0f
    flip_x = ~m_spriteram[offs + 2] & 0x40
    flip_y =  m_spriteram[offs + 2] & 0x80

    bank = tile_set[gfx_bank]
    im = bank[color][code]

    if flip_x:
        im = ImageOps.mirror(im)
    if flip_y:
        im = ImageOps.flip(im)

    result.paste(im,(y,x))

result.save("sprites.png")
