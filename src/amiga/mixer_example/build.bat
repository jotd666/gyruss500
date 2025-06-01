m68k-amigaos-as -I.. -I../mit_includes -o obj/minimal_mixer.o minimal_mixer.68k
m68k-amigaos-as -o obj/samples.o samples.68k
m68k-amigaos-as -I.. -I../mit_includes -o obj/mixer.o ../mixer.68k
m68k-amigaos-as -I.. -I../mit_includes -o obj/converter.o ../converter.68k

m68k-amigaos-ld -o mixer_test obj/*.o
pause

