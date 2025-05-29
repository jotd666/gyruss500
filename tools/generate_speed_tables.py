import math,sys

max_angle_index = 256

def convert(v):
    dv = int(v*256)
    if dv < 0:
        dv += 0x10000
    return dv

speeds = [1,1.2,1.4]
with open("../src/amiga/star_speed_tables.68k","w") as f:
    f.write("star_speed_table:\n")
    for i,speed in enumerate(speeds):
        f.write(f"\t.long\tstar_speed_{i}\n")

    for i,speed in enumerate(speeds):
        f.write(f"star_speed_{i}:  | {speed} pixels / tick\n")
        for angle_index in range(0,max_angle_index):
            angle = (2*math.pi*angle_index/max_angle_index)
            dx = convert(math.cos(angle)*speed)
            dy = convert(math.sin(angle)*speed)
            degrees_angle = 360*angle_index/max_angle_index
            f.write(f"\t.word   0x{dx:04x},0x{dy:04x}  |  {degrees_angle} degrees\n")
