import subprocess,os,struct,glob,tempfile
import shutil


gamename = "gyruss"
sox = "sox"

this_dir = os.path.dirname(__file__)
sound_dir = os.path.join(this_dir,"..","sounds")
src_dir = os.path.join(this_dir,"../../src/amiga")

# max 4 sounds at once
nb_mix_channels = 4
loop_channel = 3   # for non mixed player

if not shutil.which("sox"):
    raise Exception("sox command not in path, please install it")

shared_sound_dict = {

    "CREDIT_SND"               :{"index":0x1,"channel":3},
    "PLAYER_SINGLE_SHOT_SND"    :{"index":0x3,"priority":1,"channel":1},
    "WARP_SND"          :{"index":0x5,"priority":2,"channel":3},
    "WARP_2_SND"          :{"index":0x15,"priority":2,"channel":3},
    "STARTUP_SND"          :{"index":0xC,"priority":2,"channel":0},

    "ATTACK_WAVE_SND"          :{"index":0x6,"channel":2,"priority":20},
    "ENEMY_BOMB_DROPPED_SND"          :{"index":0x7,"channel":0},
    "PLAYER_EXPLOSION_SND"          :{"index":0x11,"priority":10,"channel":2},
    "PLAYER_KILLED_SND"          :{"index":0x10,"priority":10,"channel":2},
    "PLAYER_DOUBLE_SHOT_SND" : {"index":0x4,"priority":1,"channel":2},
    "AWARD_DOUBLE_SHOT_SND" : {"index":0xf,"channel":3,"priority":20},
    "BONUS_SHOT_SND" : {"index":0xe,"channel":3,"priority":20},
   "SWARM_ENEMY_KILLED_SND" : {"index":0x19,"channel":0},
   "ENEMY_KILLED_1A_SND" : {"index":0x1A,"channel":0},
   "ENEMY_KILLED_1B_SND" : {"index":0x1B,"channel":0},
   "CHANCE_SFX_SND" : {"index":0x14,"channel":3},
   "CHANCE_KILLED_SND" : {"index":0x23,"channel":0},
   "CHANCE_KILLED_2_SND" : {"index":0x22,"same_as":"CHANCE_KILLED_SND"},
   "PING_SND" : {"index":0x12,"channel":1},
   "SFX_16_SND" : {"index":0x16,"channel":1},
   "SCORE_SND" : {"index":0x13,"channel":1},
   "ICEBERG_SND" : {"index":0x1C,"channel":1,"priority":50},
   "BOSS_KILLED_1E_SND" : {"index":0x1E,"channel":1},
   "BOSS_KILLED_1F_SND" : {"index":0x1F,"channel":1},
   "BOSS_KILLED_20_SND" : {"index":0x20,"same_as":"BOSS_KILLED_1E_SND"},
   "HIGH_SCORE_17_SND" : {"index":0x17,"channel":1},
   "HIGH_SCORE_18_SND" : {"index":0x18,"channel":1},

   "DEATH_RAY_SND" : {"index":0xA,"channel":loop_channel,"loops":True},   # the only looped sound!
   "HUMMING_SND" : {"index":0x2,"loops":True,"channel":loop_channel},


}

music_volume = 28

tunes_dict = {    "TOCATTA_START_TUNE_SND"                :{"index":0X25,"pattern":0,"volume":music_volume,'loops':True},
    "TOCATTA_NEXT_TUNE_SND"                :{"index":0X28,"pattern":10,"volume":music_volume,'loops':True},
    "TOCATTA_PLANET_TUNE_SND"                :{"index":0X29,"pattern":0x28,"volume":music_volume,'loops':True}, # change when mod is updated
    "TOCATTA_OTHER_TUNE_SND"                :{"index":0X26,"pattern":0xB,"volume":music_volume,'loops':True}, # change when mod is updated
    "TOCATTA_YET_OTHER_TUNE_SND"                :{"index":0X27,"pattern":0x4,"volume":music_volume,'loops':True}, # change when mod is updated

    }

def mixer_convert(suffix,freq):
    # BTW convert wav to mp3: ffmpeg -i input.wav -codec:a libmp3lame -b:a 330k output.mp3

    #wav_files = glob.glob("sounds/*.wav")

    sound_dict = {k:dict(v) for k,v in shared_sound_dict.items()}  # deepcopy
    sound_dict.update(tunes_dict)
    outfile = os.path.join(src_dir,f"sounds_{suffix}.68k")
    sndfile = os.path.join(src_dir,f"sound_entries_{suffix}.68k")


    hq_sample_rate = freq  # must be coherent with value in mixer.inc


    EMPTY_SND = "EMPTY_SND"

    dummy_sounds = {
    0,
    9,     # ice  (muted/empty)
    0XA,0x1D,   # death ray (muted/empty)
    }

    # set all channels to 3
    for s in sound_dict.values():
        if "pattern" not in s:
            s.update({"channel":3})

    with open(os.path.join(src_dir,"..","sounds.inc"),"w") as f:
        for k,v in sorted(sound_dict.items(),key = lambda x:x[1]["index"]):
            f.write(f"\t.equ\t{k},  0x{v['index']:x}\n")

    max_sound = 0x80  # max(x["index"] for x in sound_dict.values())+1
    sound_table = [""]*max_sound
    sound_table_set_1 = ["\t.long\t0,0"]*max_sound

    for d in dummy_sounds:
        sound_table_set_1[d] = "\t.word\t3,0,0,0   | valid but muted"



    snd_header = rf"""
    # sound tables
    #
    #

    .macro    SOUND_ENTRY    sound_name,size,priority,loop
    \sound_name\()_sound:
        .long   \size
        .long    \sound_name\()_raw
        .word   \loop           | loop
        .word    \priority
        .long   0           | loop offset
        .long   0           | plugin ptr
        .endm

"""

    def write_asm(contents,fw):
        n=0
        for c in contents:
            if n%16 == 0:
                fw.write("\n\t.byte\t0x{:x}".format(c))
            else:
                fw.write(",0x{:x}".format(c))
            n += 1
        fw.write("\n")

    music_module_label = f"{gamename}_tunes"

    raw_file = os.path.join(tempfile.gettempdir(),"out.raw")
    with open(sndfile,"w") as fst,open(outfile,"w") as fw:
        fst.write(snd_header)

        fw.write("\t.section\t.data\n")  # no need for chipmem!
        fw.write("\t.global\t{}\n".format(music_module_label))

        for wav_file,details in sound_dict.items():
            wav_name = os.path.basename(wav_file).lower()[:-4]
            if details.get("channel") is not None:
                fw.write("\t.global\t{}_raw\n".format(wav_name))


        for wav_entry,details in sound_dict.items():
            sound_index = details["index"]
            same_as = details.get("same_as")
            if same_as is not None:
                # reuse the same sample several times
                # introduced here to avoid duplicating sounds that sound 100% the same,
                # only with a different ID
                wav_entry = same_as
                details = sound_dict[wav_entry]
                wav = os.path.basename(wav_entry).lower()[:-4]  # same wav name as before
                loop = 0xFFFF if details.get('loops') else 1
                # create a new entry that points to the other sound data
                sound_table_set_1[sound_index] = f"\t.word\t1,{loop}\n\t.long\t{wav}_sound"
            else:
                channel = details.get("channel")
                if channel is None:
                    # if music loops, ticks are set to 1 so sound orders only can happen once (else music is started 50 times per second!!)

                    sound_table_set_1[sound_index] = "\t.word\t{},{},{}\n\t.byte\t{},{}".format(2,details["pattern"],details.get("ticks",0),details["volume"],int(details["loops"]))
                else:
                    if sound_index in dummy_sounds:
                        continue

                    wav_name = os.path.basename(wav_entry).lower()[:-4]
                    wav_file = os.path.join(sound_dir,wav_name+".wav")

                    def get_sox_cmd(sr,output):
                        return [sox,"--volume","0.8",wav_file,"--channels","1","-D","--bits","8","-r",str(sr),"--encoding","signed-integer",output]


                    used_sampling_rate = hq_sample_rate
                    used_priority = details.get("priority",10)

                    cmd = get_sox_cmd(used_sampling_rate,raw_file)

                    subprocess.check_call(cmd)
                    with open(raw_file,"rb") as f:
                        contents = f.read()

                    # compute max amplitude so we can feed the sound chip with an amped sound sample
                    # and reduce the replay volume. this gives better sound quality than replaying at max volume
                    # (thanks no9 for the tip!)
                    signed_data = [x if x < 128 else x-256 for x in contents]
                    maxsigned = max(signed_data)
                    minsigned = min(signed_data)

                    # higher => lower volume
                    amp_ratio = max(maxsigned,abs(minsigned))/110

                    # JOTD: for that one, I'm using maxxed out sfx by no9, no amp
                    #amp_ratio = 0.9

                    wav = os.path.splitext(wav_name)[0]
    ##                if amp_ratio > 1:
    ##                    print(f"{wav}: volume peaked {amp_ratio}")
    ##                    amp_ratio = 1
                    loop = 0xFFFF if details.get('loops') else 1

                    sound_table_set_1[sound_index] = f"\t.word\t1,{loop}\n\t.long\t{wav}_sound"


                    sound_table[sound_index] = "    SOUND_ENTRY {},{},{},{}\n".format(wav,len(signed_data),used_priority,loop)


                    amp_ratio *= nb_mix_channels

                    if amp_ratio > 0:

                        maxed_contents = [int(x/amp_ratio) for x in signed_data]
                    else:
                        maxed_contents = signed_data

                    #maxed_contents = signed_data

                    signed_contents = bytes([x if x >= 0 else 256+x for x in maxed_contents])
                    # pre-pad with 0W, used by ptplayer for idling
                    if signed_contents[0] != b'\x00' and signed_contents[1] != b'\x00':
                        # add zeroes
                        signed_contents = struct.pack(">H",0) + signed_contents

                    contents = signed_contents
                    # align on 16-bit
                    if len(contents)%2:
                        contents += b'\x00'
                    # pre-pad with 0W, used by ptplayer for idling
                    if contents[0] != b'\x00' and contents[1] != b'\x00':
                        # add zeroes
                        contents = b'\x00\x00' + contents

                    fw.write("{}_raw:   | {} bytes".format(wav,len(contents)))

                    write_asm(contents,fw)


        # make sure next section will be aligned
        with open(os.path.join(sound_dir,f"{gamename}_conv.mod"),"rb") as f:
            contents = f.read()

        # module needs chipmem!
        fw.write("\t.section\t.datachip\n")

        fw.write("{}:".format(music_module_label))
        write_asm(contents,fw)
        fw.write("\t.align\t8\n")


        fst.writelines(sound_table)
        fst.write("\n\t.global\t{0}\n\n{0}:\n".format("sound_table"))
        for i,st in enumerate(sound_table_set_1):
            fst.write(st)
            fst.write(" | {}\n".format(i))

def std_convert(suffix,freq):
    def discard_sound(name):

        entry = sound_dict.pop(name)
        dummy_sounds.append(entry["index"])

    def same_sound(n1,n2):
        sound_dict[n1]["same_as"] = n2


    if not shutil.which("sox"):
        raise Exception("sox command not in path, please install it")
    # BTW convert wav to mp3: ffmpeg -i input.wav -codec:a libmp3lame -b:a 330k output.mp3

    #wav_files = glob.glob("sounds/*.wav")


    outfile = os.path.join(src_dir,f"sounds_{suffix}.68k")
    sndfile = os.path.join(src_dir,f"sound_entries_{suffix}.68k")


    hq_sample_rate = freq  # must be coherent with value in mixer.inc


    loop_channel = 3

    EMPTY_SND = "EMPTY_SND"
    sound_dict = {}
    for k,v in shared_sound_dict.items():
        v = v.copy()
        v["sample_rate"] = hq_sample_rate
        sound_dict[k] = v


    dummy_sounds = {0x24,   # sound stop?
    0,
    0x2,  # hummiing sound
    9,     # ice  (muted/empty)
    0x1D,   # death ray (muted/empty)
    0x17,0x18  # highscore entry, not really useful, saves precious mem

    }
    # remove tunes from sound list
    for v in tunes_dict.values():
        dummy_sounds.add(v["index"])

    # merge similar sounds to save memory

    same_sound("WARP_2_SND","WARP_SND")
    same_sound("PLAYER_DOUBLE_SHOT_SND","PLAYER_SINGLE_SHOT_SND")
    same_sound("ENEMY_KILLED_1A_SND","ENEMY_KILLED_1B_SND")
    same_sound("BOSS_KILLED_1F_SND","BOSS_KILLED_1E_SND")

    with open(os.path.join(src_dir,"..","sounds.inc"),"w") as f:
        for k,v in sorted(sound_dict.items(),key = lambda x:x[1]["index"]):
            f.write(f"\t.equ\t{k},  0x{v['index']:x}\n")

    max_sound = 0x100  # max(x["index"] for x in sound_dict.values())+1
    sound_table = [""]*max_sound
    sound_table_set_1 = ["\t.long\t0,0"]*max_sound

    for d in dummy_sounds:
        sound_table_set_1[d] = "\t.word\t3,0,0,0   | valid but muted"



    snd_header = rf"""
    # sound tables
    #
    # the "sound_table" table has 8 bytes per entry
    # first word: 0: no entry, 1: sample, 2: pattern from music module
    # second word: 0 except for music module: pattern number
    # longword: sample data pointer if sample, 0 if no entry and
    # 2 words: 0/1 noloop/loop followed by duration in ticks
    #
    FXFREQBASE = 3579564

        .macro    SOUND_ENTRY    sound_name,size,channel,soundfreq,volume,priority
    \sound_name\()_sound:
        .long    \sound_name\()_raw
        .word   \size
        .word   FXFREQBASE/\soundfreq,\volume
        .byte    \channel
        .byte    \priority
        .endm

    """

    def write_asm(contents,fw):
        n=0
        for c in contents:
            if n%16 == 0:
                fw.write("\n\t.byte\t0x{:x}".format(c))
            else:
                fw.write(",0x{:x}".format(c))
            n += 1
        fw.write("\n")


    raw_file = os.path.join(tempfile.gettempdir(),"out.raw")
    with open(sndfile,"w") as fst,open(outfile,"w") as fw:
        fst.write(snd_header)

        fw.write("\t.section\t.datachip\n")

        for wav_file,details in sound_dict.items():
            wav_name = os.path.basename(wav_file).lower()[:-4]
            if details.get("channel") is not None:
                fw.write("\t.global\t{}_raw\n".format(wav_name))


        for wav_entry,details in sound_dict.items():
            sound_index = details["index"]
            channel = details.get("channel")

            if channel is None and "same_as" not in details:
                # if music loops, ticks are set to 1 so sound orders only can happen once (else music is started 50 times per second!!)

                sound_table_set_1[sound_index] = "\t.word\t{},{},{}\n\t.byte\t{},{}".format(2,details["pattern"],details.get("ticks",0),details["volume"],int(details["loops"]))
            else:
                if sound_index in dummy_sounds:
                    continue
                wav_name = os.path.basename(wav_entry).lower()[:-4]
                same_as = details.get("same_as")
                if same_as is not None:
                    # reuse the same sample several times
                    # introduced here to avoid duplicating sounds that sound 100% the same,
                    # only with a different ID
                    wav_entry = same_as
                    details = sound_dict[wav_entry]
                    wav = os.path.basename(wav_entry).lower()[:-4]  # same wav name as before
                    loop = 1 if details.get('loops') else 0
                    # create a new entry that points to the other sound data
                    sound_table_set_1[sound_index] = f"\t.word\t1,{loop}\n\t.long\t{wav}_sound"
                else:
                    wav_file = os.path.join(sound_dir,wav_name+".wav")

                    def get_sox_cmd(sr,output):
                        return [sox,"--volume","0.8",wav_file,"--channels","1","-D","--bits","8","-r",str(sr),"--encoding","signed-integer",output]


                    used_sampling_rate = details["sample_rate"]
                    used_priority = details.get("priority",1)

                    cmd = get_sox_cmd(used_sampling_rate,raw_file)

                    subprocess.check_call(cmd)
                    with open(raw_file,"rb") as f:
                        contents = f.read()

                    # compute max amplitude so we can feed the sound chip with an amped sound sample
                    # and reduce the replay volume. this gives better sound quality than replaying at max volume
                    # (thanks no9 for the tip!)
                    signed_data = [x if x < 128 else x-256 for x in contents]
                    maxsigned = max(signed_data)
                    minsigned = min(signed_data)

                    amp_ratio = max(maxsigned,abs(minsigned))/128

                    # JOTD: for that one, I'm using maxxed out sfx by no9, no amp
                    amp_ratio = 1

                    wav = os.path.splitext(wav_name)[0]
                    if amp_ratio > 1:
                        print(f"{wav}: volume peaked {amp_ratio}")
                        amp_ratio = 1
                    sound_table[sound_index] = "    SOUND_ENTRY {},{},{},{},{},{}\n".format(wav,len(signed_data)//2,channel,used_sampling_rate,int(64*amp_ratio),used_priority)
                    sound_table_set_1[sound_index] = f"\t.word\t1,{int(details.get('loops',0))}\n\t.long\t{wav}_sound"

    ##                if amp_ratio > 0:
    ##                    maxed_contents = [int(x/amp_ratio) for x in signed_data]
    ##                else:
    ##                    maxed_contents = signed_data

                    maxed_contents = signed_data

                    signed_contents = bytes([x if x >= 0 else 256+x for x in maxed_contents])
                    # pre-pad with 0W, used by ptplayer for idling
                    if signed_contents[0] != b'\x00' and signed_contents[1] != b'\x00':
                        # add zeroes
                        signed_contents = struct.pack(">H",0) + signed_contents

                    contents = signed_contents
                    # align on 16-bit
                    if len(contents)%2:
                        contents += b'\x00'
                    # pre-pad with 0W, used by ptplayer for idling
                    if contents[0] != b'\x00' and contents[1] != b'\x00':
                        # add zeroes
                        contents = b'\x00\x00' + contents

                    fw.write("{}_raw:   | {} bytes".format(wav,len(contents)))

                    if len(contents)>65530:
                        raise Exception(f"Sound {wav_entry} is too long")
                    write_asm(contents,fw)






        fst.writelines(sound_table)
        fst.write("\n\t.global\t{0}\n\n{0}:\n".format("sound_table"))
        for i,st in enumerate(sound_table_set_1):
            fst.write(st)
            fst.write(" | {}\n".format(i))


mixer_convert(suffix="2mb",freq=11025)
std_convert(suffix="1mb",freq=8192)

