from PIL import Image,ImageOps
import os

this_dir = os.path.dirname(os.path.abspath(__file__))

with open(os.path.join(this_dir,"ram_in_game"),"rb") as f:
    contents = f.read()


side = 8
transparent = (254,254,254)  # not possible to get it in the game

blank_image = Image.new("RGB",(side,side),color=transparent)



def load_tileset(image_name,game_gfx,side,dump_prefix=""):
    full_image_path = os.path.join(this_dir,"sheets",image_name)
    tiles_1 = Image.open(full_image_path)
    nb_rows = tiles_1.size[1] // side
    nb_cols = tiles_1.size[0] // side

    dumpdir = "dumps"

    tileset_1 = []
    k=0
    for j in range(nb_rows):
        for i in range(nb_cols):
            img = Image.new("RGBA",(side,side))
            img.paste(tiles_1,(-i*side,-j*side))
            tileset_1.append(img)
            if dump_prefix:
                img = ImageOps.scale(img,5,resample=Image.Resampling.NEAREST)
                img.save(os.path.join(dumpdir,f"{dump_prefix}_{k:02x}.png"))
            k += 1

    return tileset_1

