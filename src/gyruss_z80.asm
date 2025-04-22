0008: 85          add  a,l
0009: 6F          ld   l,a
000A: 30 01       jr   nc,$000D
000C: 24          inc  h
000D: 7E          ld   a,(hl)
000E: C9          ret

0010: 87          add  a,a
0011: DF          rst  $18
0012: 5E          ld   e,(hl)
0013: 23          inc  hl
0014: 56          ld   d,(hl)
0015: 23          inc  hl
0016: C9          ret

0018: 85          add  a,l
0019: 6F          ld   l,a
001A: D0          ret  nc
001B: 24          inc  h
001C: C9          ret

0020: 7B          ld   a,e
0021: D6 20       sub  $20
0023: 5F          ld   e,a
0024: D0          ret  nc
0025: 15          dec  d
0026: C9          ret

0030: E1          pop  hl
0031: D7          rst  $10
0032: EB          ex   de,hl
0033: E9          jp   (hl)

0038: E5          push hl
0039: 26 95       ld   h,$95
003B: 3A 32 94    ld   a,($9432)
003E: 6F          ld   l,a
003F: CB 7E       bit  7,(hl)
0041: 28 0A       jr   z,$004D
0043: 72          ld   (hl),d
0044: 2C          inc  l
0045: 73          ld   (hl),e
0046: 2C          inc  l
0047: 7D          ld   a,l
0048: E6 3F       and  $3F
004A: 32 32 94    ld   ($9432),a
004D: E1          pop  hl
004E: C9          ret

0050: 21 0A 96    ld   hl,$960A
0053: 34          inc  (hl)
0054: 34          inc  (hl)
0055: C9          ret

0058: D3 FF       out  ($FF),a
005A: CD 88 5C    call $5C88
005D: C9          ret

0066: C3 03 01    jp   $0103

0069: 31 00 A0    ld   sp,$A000
006C: 21 80 C1    ld   hl,$C180
006F: 06 08       ld   b,$08
0071: 36 00       ld   (hl),$00
0073: 23          inc  hl
0074: 10 FB       djnz $0071
0076: 32 00 C0    ld   ($C000),a
0079: 06 00       ld   b,$00
007B: 21 00 00    ld   hl,$0000
007E: AF          xor  a
007F: 86          add  a,(hl)
0080: 23          inc  hl
0081: 10 FC       djnz $007F
0083: D6 00       sub  $00
0085: C3 88 00    jp   $0088

0088: C3 DC 57    jp   $57DC

008B: CD 38 5C    call $5C38
008E: 3A 91 09    ld   a,($0991)
0091: 32 80 C1    ld   ($C180),a
0094: 32 00 C0    ld   ($C000),a
0097: C3 F7 05    jp   $05F7

009A: 21 20 84    ld   hl,$8420
009D: 0E 0E       ld   c,$0E
009F: 11 20 00    ld   de,$0020
00A2: 19          add  hl,de
00A3: 06 10       ld   b,$10
00A5: CD B0 00    call $00B0
00A8: 23          inc  hl
00A9: 23          inc  hl
00AA: 10 F9       djnz $00A5
00AC: 0D          dec  c
00AD: 20 F0       jr   nz,$009F
00AF: C9          ret

00B0: E5          push hl
00B1: 36 AF       ld   (hl),$AF
00B3: 23          inc  hl
00B4: 36 4F       ld   (hl),$4F
00B6: 11 1F 00    ld   de,$001F
00B9: 19          add  hl,de
00BA: 36 05       ld   (hl),$05
00BC: 23          inc  hl
00BD: 36 86       ld   (hl),$86
00BF: E1          pop  hl
00C0: C9          ret

00F9: 21 3B 86    ld   hl,$863B
00FC: 7E          ld   a,(hl)
00FD: D6 EE       sub  $EE
00FF: C0          ret  nz
0100: C3 0B 08    jp   $080B

0103: F5          push af
0104: C5          push bc
0105: D5          push de
0106: E5          push hl
0107: 08          ex   af,af'
0108: D9          exx
0109: F5          push af
010A: C5          push bc
010B: D5          push de
010C: E5          push hl
010D: DD E5       push ix
010F: FD E5       push iy
0111: 21 00 A7    ld   hl,$A700
0114: 7E          ld   a,(hl)
0115: 3C          inc  a
0116: E6 01       and  $01
0118: 77          ld   (hl),a
0119: 3E 01       ld   a,$01
011B: 32 01 A7    ld   ($A701),a
011E: AF          xor  a
011F: 32 02 A7    ld   ($A702),a
0122: CD 44 02    call $0244
0125: AF          xor  a
0126: 32 01 A7    ld   ($A701),a
0129: 3E 01       ld   a,$01
012B: 32 02 A7    ld   ($A702),a
012E: AF          xor  a
012F: 32 80 C1    ld   ($C180),a
0132: 32 00 C0    ld   ($C000),a
0135: 32 07 94    ld   ($9407),a
0138: 3A 62 96    ld   a,($9662)
013B: A7          and  a
013C: 28 0B       jr   z,$0149
013E: 3A 42 94    ld   a,($9442)    ; [uncovered] 
0141: A7          and  a    ; [uncovered] 
0142: 20 05       jr   nz,$0149    ; [uncovered] 
0144: 3E 01       ld   a,$01    ; [uncovered] 
0146: 32 07 94    ld   ($9407),a    ; [uncovered] 
0149: 3A 07 94    ld   a,($9407)
014C: 32 85 C1    ld   ($C185),a
014F: 3A 00 C0    ld   a,($C000)
0152: 2F          cpl
0153: 32 2D 94    ld   ($942D),a
0156: 3A 80 C0    ld   a,($C080)
0159: 2F          cpl
015A: 32 2E 94    ld   ($942E),a
015D: 3A A0 C0    ld   a,($C0A0)
0160: 2F          cpl
0161: 32 2F 94    ld   ($942F),a
0164: 3A C0 C0    ld   a,($C0C0)
0167: 2F          cpl
0168: 32 30 94    ld   ($9430),a
016B: 3A E0 C0    ld   a,($C0E0)
016E: 2F          cpl
016F: 32 31 94    ld   ($9431),a
0172: 21 00 94    ld   hl,$9400
0175: 34          inc  (hl)
0176: 21 4E 94    ld   hl,$944E
0179: 7E          ld   a,(hl)
017A: 3C          inc  a
017B: 27          daa
017C: 77          ld   (hl),a
017D: CD BC 10    call $10BC
0180: 21 92 01    ld   hl,$0192
0183: E5          push hl
0184: 3A 2B 94    ld   a,($942B)
0187: E6 03       and  $03
0189: F7          rst  $30

0192: CD 1F 5C    call $5C1F
0195: FD E1       pop  iy
0197: DD E1       pop  ix
0199: E1          pop  hl
019A: D1          pop  de
019B: C1          pop  bc
019C: F1          pop  af
019D: D9          exx
019E: 08          ex   af,af'
019F: E1          pop  hl
01A0: D1          pop  de
01A1: C1          pop  bc
01A2: 3E 01       ld   a,$01
01A4: 32 80 C1    ld   ($C180),a
01A7: F1          pop  af
01A8: C9          ret

01BB: 21 00 84    ld   hl,$8400
01BE: 22 09 94    ld   ($9409),hl
01C1: 3E 20       ld   a,$20
01C3: 32 08 94    ld   ($9408),a
01C6: 06 00       ld   b,$00
01C8: 21 A8 37    ld   hl,$37A8
01CB: AF          xor  a
01CC: 86          add  a,(hl)
01CD: 23          inc  hl
01CE: 10 FC       djnz $01CC
01D0: D6 3F       sub  $3F
01D2: C2 00 00    jp   nz,$0000
01D5: C9          ret

01D6: 21 04 84    ld   hl,$8404
01D9: 22 09 94    ld   ($9409),hl
01DC: 3E 1B       ld   a,$1B
01DE: 32 08 94    ld   ($9408),a
01E1: 06 F0       ld   b,$F0
01E3: 21 00 39    ld   hl,$3900
01E6: AF          xor  a
01E7: 86          add  a,(hl)
01E8: 23          inc  hl
01E9: 10 FC       djnz $01E7
01EB: D6 1E       sub  $1E
01ED: C2 AB 0F    jp   nz,$0FAB
01F0: C9          ret

0207: 2A 09 94    ld   hl,($9409)
020A: 06 20       ld   b,$20
020C: 11 20 00    ld   de,$0020
020F: 36 83       ld   (hl),$83
0211: CB 94       res  2,h
0213: 36 00       ld   (hl),$00
0215: CB D4       set  2,h
0217: 19          add  hl,de
0218: 10 F5       djnz $020F
021A: 2A 09 94    ld   hl,($9409)
021D: 23          inc  hl
021E: 22 09 94    ld   ($9409),hl
0221: 21 08 94    ld   hl,$9408
0224: 35          dec  (hl)
0225: C9          ret

0244: 3A 00 A7    ld   a,($A700)
0247: A7          and  a
0248: 21 00 98    ld   hl,$9800
024B: 11 00 A0    ld   de,$A000
024E: 28 03       jr   z,$0253
0250: 11 00 A2    ld   de,$A200
0253: ED A0       ldi
0255: ED A0       ldi
0257: ED A0       ldi
0259: ED A0       ldi
025B: ED A0       ldi
025D: ED A0       ldi
025F: ED A0       ldi
0261: ED A0       ldi
0263: ED A0       ldi
0265: ED A0       ldi
0267: ED A0       ldi
0269: ED A0       ldi
026B: ED A0       ldi
026D: ED A0       ldi
026F: ED A0       ldi
0271: ED A0       ldi
0273: ED A0       ldi
0275: ED A0       ldi
0277: ED A0       ldi
0279: ED A0       ldi
027B: ED A0       ldi
027D: ED A0       ldi
027F: ED A0       ldi
0281: ED A0       ldi
0283: ED A0       ldi
0285: ED A0       ldi
0287: ED A0       ldi
0289: ED A0       ldi
028B: ED A0       ldi
028D: ED A0       ldi
028F: ED A0       ldi
0291: ED A0       ldi
0293: ED A0       ldi
0295: ED A0       ldi
0297: ED A0       ldi
0299: ED A0       ldi
029B: ED A0       ldi
029D: ED A0       ldi
029F: ED A0       ldi
02A1: ED A0       ldi
02A3: ED A0       ldi
02A5: ED A0       ldi
02A7: ED A0       ldi
02A9: ED A0       ldi
02AB: ED A0       ldi
02AD: ED A0       ldi
02AF: ED A0       ldi
02B1: ED A0       ldi
02B3: ED A0       ldi
02B5: ED A0       ldi
02B7: ED A0       ldi
02B9: ED A0       ldi
02BB: ED A0       ldi
02BD: ED A0       ldi
02BF: ED A0       ldi
02C1: ED A0       ldi
02C3: ED A0       ldi
02C5: ED A0       ldi
02C7: ED A0       ldi
02C9: ED A0       ldi
02CB: ED A0       ldi
02CD: ED A0       ldi
02CF: ED A0       ldi
02D1: ED A0       ldi
02D3: ED A0       ldi
02D5: ED A0       ldi
02D7: ED A0       ldi
02D9: ED A0       ldi
02DB: ED A0       ldi
02DD: ED A0       ldi
02DF: ED A0       ldi
02E1: ED A0       ldi
02E3: ED A0       ldi
02E5: ED A0       ldi
02E7: ED A0       ldi
02E9: ED A0       ldi
02EB: ED A0       ldi
02ED: ED A0       ldi
02EF: ED A0       ldi
02F1: ED A0       ldi
02F3: ED A0       ldi
02F5: ED A0       ldi
02F7: ED A0       ldi
02F9: ED A0       ldi
02FB: ED A0       ldi
02FD: ED A0       ldi
02FF: ED A0       ldi
0301: ED A0       ldi
0303: ED A0       ldi
0305: ED A0       ldi
0307: ED A0       ldi
0309: ED A0       ldi
030B: ED A0       ldi
030D: ED A0       ldi
030F: ED A0       ldi
0311: ED A0       ldi
0313: ED A0       ldi
0315: ED A0       ldi
0317: ED A0       ldi
0319: ED A0       ldi
031B: ED A0       ldi
031D: ED A0       ldi
031F: ED A0       ldi
0321: ED A0       ldi
0323: ED A0       ldi
0325: ED A0       ldi
0327: ED A0       ldi
0329: ED A0       ldi
032B: ED A0       ldi
032D: ED A0       ldi
032F: ED A0       ldi
0331: ED A0       ldi
0333: ED A0       ldi
0335: ED A0       ldi
0337: ED A0       ldi
0339: ED A0       ldi
033B: ED A0       ldi
033D: ED A0       ldi
033F: ED A0       ldi
0341: ED A0       ldi
0343: ED A0       ldi
0345: ED A0       ldi
0347: ED A0       ldi
0349: ED A0       ldi
034B: ED A0       ldi
034D: ED A0       ldi
034F: ED A0       ldi
0351: ED A0       ldi
0353: ED A0       ldi
0355: ED A0       ldi
0357: ED A0       ldi
0359: ED A0       ldi
035B: ED A0       ldi
035D: ED A0       ldi
035F: ED A0       ldi
0361: ED A0       ldi
0363: ED A0       ldi
0365: ED A0       ldi
0367: ED A0       ldi
0369: ED A0       ldi
036B: ED A0       ldi
036D: ED A0       ldi
036F: ED A0       ldi
0371: ED A0       ldi
0373: ED A0       ldi
0375: ED A0       ldi
0377: ED A0       ldi
0379: ED A0       ldi
037B: ED A0       ldi
037D: ED A0       ldi
037F: ED A0       ldi
0381: ED A0       ldi
0383: ED A0       ldi
0385: ED A0       ldi
0387: ED A0       ldi
0389: ED A0       ldi
038B: ED A0       ldi
038D: ED A0       ldi
038F: ED A0       ldi
0391: ED A0       ldi
0393: ED A0       ldi
0395: ED A0       ldi
0397: ED A0       ldi
0399: ED A0       ldi
039B: ED A0       ldi
039D: ED A0       ldi
039F: ED A0       ldi
03A1: ED A0       ldi
03A3: ED A0       ldi
03A5: ED A0       ldi
03A7: ED A0       ldi
03A9: ED A0       ldi
03AB: ED A0       ldi
03AD: ED A0       ldi
03AF: ED A0       ldi
03B1: ED A0       ldi
03B3: ED A0       ldi
03B5: ED A0       ldi
03B7: ED A0       ldi
03B9: ED A0       ldi
03BB: ED A0       ldi
03BD: ED A0       ldi
03BF: ED A0       ldi
03C1: ED A0       ldi
03C3: ED A0       ldi
03C5: ED A0       ldi
03C7: ED A0       ldi
03C9: ED A0       ldi
03CB: ED A0       ldi
03CD: ED A0       ldi
03CF: ED A0       ldi
03D1: ED A0       ldi
03D3: ED A0       ldi
03D5: ED A0       ldi
03D7: ED A0       ldi
03D9: ED A0       ldi
03DB: ED A0       ldi
03DD: ED A0       ldi
03DF: ED A0       ldi
03E1: ED A0       ldi
03E3: ED A0       ldi
03E5: ED A0       ldi
03E7: ED A0       ldi
03E9: ED A0       ldi
03EB: ED A0       ldi
03ED: ED A0       ldi
03EF: ED A0       ldi
03F1: ED A0       ldi
03F3: ED A0       ldi
03F5: ED A0       ldi
03F7: ED A0       ldi
03F9: ED A0       ldi
03FB: ED A0       ldi
03FD: ED A0       ldi
03FF: ED A0       ldi
0401: ED A0       ldi
0403: ED A0       ldi
0405: ED A0       ldi
0407: ED A0       ldi
0409: ED A0       ldi
040B: ED A0       ldi
040D: ED A0       ldi
040F: ED A0       ldi
0411: ED A0       ldi
0413: ED A0       ldi
0415: ED A0       ldi
0417: ED A0       ldi
0419: ED A0       ldi
041B: ED A0       ldi
041D: ED A0       ldi
041F: ED A0       ldi
0421: ED A0       ldi
0423: ED A0       ldi
0425: ED A0       ldi
0427: ED A0       ldi
0429: ED A0       ldi
042B: ED A0       ldi
042D: ED A0       ldi
042F: ED A0       ldi
0431: ED A0       ldi
0433: 14          inc  d
0434: 1E 00       ld   e,$00
0436: 21 00 99    ld   hl,$9900
0439: ED A0       ldi
043B: ED A0       ldi
043D: ED A0       ldi
043F: ED A0       ldi
0441: ED A0       ldi
0443: ED A0       ldi
0445: ED A0       ldi
0447: ED A0       ldi
0449: ED A0       ldi
044B: ED A0       ldi
044D: ED A0       ldi
044F: ED A0       ldi
0451: ED A0       ldi
0453: ED A0       ldi
0455: ED A0       ldi
0457: ED A0       ldi
0459: ED A0       ldi
045B: ED A0       ldi
045D: ED A0       ldi
045F: ED A0       ldi
0461: ED A0       ldi
0463: ED A0       ldi
0465: ED A0       ldi
0467: ED A0       ldi
0469: ED A0       ldi
046B: ED A0       ldi
046D: ED A0       ldi
046F: ED A0       ldi
0471: ED A0       ldi
0473: ED A0       ldi
0475: ED A0       ldi
0477: ED A0       ldi
0479: ED A0       ldi
047B: ED A0       ldi
047D: ED A0       ldi
047F: ED A0       ldi
0481: ED A0       ldi
0483: ED A0       ldi
0485: ED A0       ldi
0487: ED A0       ldi
0489: ED A0       ldi
048B: ED A0       ldi
048D: ED A0       ldi
048F: ED A0       ldi
0491: ED A0       ldi
0493: ED A0       ldi
0495: ED A0       ldi
0497: ED A0       ldi
0499: ED A0       ldi
049B: ED A0       ldi
049D: ED A0       ldi
049F: ED A0       ldi
04A1: ED A0       ldi
04A3: ED A0       ldi
04A5: ED A0       ldi
04A7: ED A0       ldi
04A9: ED A0       ldi
04AB: 2C          inc  l
04AC: 2C          inc  l
04AD: 1C          inc  e
04AE: 1C          inc  e
04AF: ED A0       ldi
04B1: ED A0       ldi
04B3: 2C          inc  l
04B4: 2C          inc  l
04B5: 1C          inc  e
04B6: 1C          inc  e
04B7: ED A0       ldi
04B9: ED A0       ldi
04BB: 2C          inc  l
04BC: 2C          inc  l
04BD: 1C          inc  e
04BE: 1C          inc  e
04BF: ED A0       ldi
04C1: ED A0       ldi
04C3: 2C          inc  l
04C4: 2C          inc  l
04C5: 1C          inc  e
04C6: 1C          inc  e
04C7: ED A0       ldi
04C9: ED A0       ldi
04CB: 2C          inc  l
04CC: 2C          inc  l
04CD: 1C          inc  e
04CE: 1C          inc  e
04CF: ED A0       ldi
04D1: ED A0       ldi
04D3: 2C          inc  l
04D4: 2C          inc  l
04D5: 1C          inc  e
04D6: 1C          inc  e
04D7: ED A0       ldi
04D9: ED A0       ldi
04DB: 2C          inc  l
04DC: 2C          inc  l
04DD: 1C          inc  e
04DE: 1C          inc  e
04DF: ED A0       ldi
04E1: ED A0       ldi
04E3: 2C          inc  l
04E4: 2C          inc  l
04E5: 1C          inc  e
04E6: 1C          inc  e
04E7: ED A0       ldi
04E9: C9          ret

04EA: 31 00 98    ld   sp,$9800
04ED: 32 00 C0    ld   ($C000),a
04F0: 21 80 C1    ld   hl,$C180
04F3: 06 08       ld   b,$08
04F5: 36 00       ld   (hl),$00
04F7: 23          inc  hl
04F8: 10 FB       djnz $04F5
04FA: 3A 00 60    ld   a,($6000)
04FD: FE 55       cp   $55
04FF: CA 00 60    jp   z,$6000
0502: AF          xor  a
0503: 32 00 C0    ld   ($C000),a
0506: 47          ld   b,a
0507: 21 10 0F    ld   hl,$0F10
050A: 86          add  a,(hl)
050B: 23          inc  hl
050C: 10 FC       djnz $050A
050E: D6 B3       sub  $B3
0510: 32 00 C0    ld   ($C000),a
0513: C2 85 37    jp   nz,$3785
0516: C3 69 00    jp   $0069

055C: CD 07 02    call $0207
055F: C0          ret  nz
0560: 3A 43 39    ld   a,($3943)
0563: 32 2C 94    ld   ($942C),a
0566: 3A AD 09    ld   a,($09AD)
0569: 32 2B 94    ld   ($942B),a
056C: 32 FF A7    ld   ($A7FF),a
056F: 06 80       ld   b,$80
0571: 21 78 37    ld   hl,$3778
0574: 97          sub  a
0575: AE          xor  (hl)
0576: 23          inc  hl
0577: 10 FC       djnz $0575
0579: C6 10       add  a,$10
057B: C2 45 18    jp   nz,$1845
057E: C9          ret

057F: 21 A0 40    ld   hl,$40A0
0582: 06 00       ld   b,$00
0584: 3E 00       ld   a,$00
0586: 86          add  a,(hl)
0587: 23          inc  hl
0588: 10 FC       djnz $0586
058A: C6 E5       add  a,$E5
058C: C2 76 48    jp   nz,$4876
058F: 11 98 33    ld   de,$3398
0592: 21 44 84    ld   hl,$8444
0595: 0E 1C       ld   c,$1C
0597: 06 07       ld   b,$07
0599: 1A          ld   a,(de)
059A: 77          ld   (hl),a
059B: CB 94       res  2,h
059D: 36 25       ld   (hl),$25
059F: CB D4       set  2,h
05A1: 2C          inc  l
05A2: 13          inc  de
05A3: 10 F4       djnz $0599
05A5: D5          push de
05A6: 11 19 00    ld   de,$0019
05A9: 19          add  hl,de
05AA: D1          pop  de
05AB: 0D          dec  c
05AC: 20 E9       jr   nz,$0597
05AE: C9          ret

05D7: 21 00 A0    ld   hl,$A000
05DA: 11 01 A0    ld   de,$A001
05DD: 01 FF 07    ld   bc,$07FF
05E0: 36 00       ld   (hl),$00
05E2: ED B0       ldir
05E4: 32 00 C0    ld   ($C000),a
05E7: C3 04 4A    jp   $4A04

05EA: 47          ld   b,a
05EB: 0F          rrca
05EC: 0F          rrca
05ED: 0F          rrca
05EE: 0F          rrca
05EF: E6 0F       and  $0F
05F1: C3 08 17    jp   $1708

05F4: C3 F7 05    jp   $05F7

05F7: 3A 65 58    ld   a,($5865)
05FA: 67          ld   h,a
05FB: 3A 33 94    ld   a,($9433)
05FE: 6F          ld   l,a
05FF: 7E          ld   a,(hl)
0600: 07          rlca
0601: DA F4 05    jp   c,$05F4
0604: 4E          ld   c,(hl)
0605: 36 FF       ld   (hl),$FF
0607: 23          inc  hl
0608: 46          ld   b,(hl)
0609: 36 FF       ld   (hl),$FF
060B: 23          inc  hl
060C: 7D          ld   a,l
060D: E6 3F       and  $3F
060F: 32 33 94    ld   ($9433),a
0612: 79          ld   a,c
0613: E6 0F       and  $0F
0615: 21 20 06    ld   hl,$0620
0618: D7          rst  $10
0619: 78          ld   a,b
061A: 21 F4 05    ld   hl,$05F4
061D: E5          push hl
061E: EB          ex   de,hl
061F: E9          jp   (hl)

066E: 21 65 94    ld   hl,$9465
0671: 36 06       ld   (hl),$06
0673: 01 00 00    ld   bc,$0000
0676: 10 FE       djnz $0676
0678: 32 00 C0    ld   ($C000),a
067B: 0D          dec  c
067C: 20 F8       jr   nz,$0676
067E: 35          dec  (hl)
067F: 20 F2       jr   nz,$0673
0681: AF          xor  a
0682: C3 8B 00    jp   $008B

0685: 4F          ld   c,a
0686: 06 00       ld   b,$00
0688: 3A 69 96    ld   a,($9669)
068B: A7          and  a
068C: CA DD 06    jp   z,$06DD
068F: 79          ld   a,c
0690: A7          and  a
0691: CA F7 06    jp   z,$06F7
0694: 21 3D 41    ld   hl,$413D
0697: 09          add  hl,bc
0698: 09          add  hl,bc
0699: 09          add  hl,bc
069A: 11 63 96    ld   de,$9663
069D: 3A 62 96    ld   a,($9662)
06A0: A7          and  a
06A1: 28 03       jr   z,$06A6
06A3: 11 66 96    ld   de,$9666    ; [uncovered] 
06A6: 1A          ld   a,(de)
06A7: 86          add  a,(hl)
06A8: 27          daa
06A9: 12          ld   (de),a
06AA: 13          inc  de
06AB: 23          inc  hl
06AC: 1A          ld   a,(de)
06AD: 8E          adc  a,(hl)
06AE: 27          daa
06AF: 12          ld   (de),a
06B0: 13          inc  de
06B1: 23          inc  hl
06B2: 1A          ld   a,(de)
06B3: 8E          adc  a,(hl)
06B4: 27          daa
06B5: 12          ld   (de),a
06B6: 21 0D 94    ld   hl,$940D
06B9: 01 03 00    ld   bc,$0003
06BC: 1A          ld   a,(de)
06BD: BE          cp   (hl)
06BE: 38 0F       jr   c,$06CF
06C0: 20 07       jr   nz,$06C9
06C2: 1B          dec  de
06C3: 2B          dec  hl
06C4: 0D          dec  c
06C5: 20 F5       jr   nz,$06BC
06C7: 18 06       jr   $06CF

06C9: EB          ex   de,hl
06CA: ED B8       lddr
06CC: CD 69 07    call $0769
06CF: 3A 62 96    ld   a,($9662)
06D2: A7          and  a
06D3: 20 05       jr   nz,$06DA
06D5: CD 55 07    call $0755
06D8: 18 03       jr   $06DD

06DD: C9          ret

06DE: CD 07 02    call $0207
06E1: C0          ret  nz
06E2: 21 E0 11    ld   hl,$11E0
06E5: 06 00       ld   b,$00
06E7: AF          xor  a
06E8: AE          xor  (hl)
06E9: 23          inc  hl
06EA: 10 FC       djnz $06E8
06EC: D6 06       sub  $06
06EE: C2 FE 42    jp   nz,$42FE
06F1: 16 07       ld   d,$07
06F3: FF          rst  $38
06F4: C3 0B 08    jp   $080B

06F7: 3A 58 94    ld   a,($9458)
06FA: A7          and  a
06FB: 20 1C       jr   nz,$0719
06FD: 3A 22 30    ld   a,($3022)
0700: CD E4 07    call $07E4
0703: CD 55 07    call $0755
0706: 3A 6F 00    ld   a,($006F)
0709: CD 1C 38    call $381C
070C: 11 01 85    ld   de,$8501
070F: 06 06       ld   b,$06
0711: 3A AC 37    ld   a,($37AC)
0714: 12          ld   (de),a
0715: E7          rst  $20
0716: 10 F9       djnz $0711
0718: C9          ret

0755: 11 81 87    ld   de,$8781
0758: 21 65 96    ld   hl,$9665
075B: 0E 10       ld   c,$10
075D: 18 12       jr   $0771

0769: 11 41 86    ld   de,$8641
076C: 21 0D 94    ld   hl,$940D
076F: 0E 11       ld   c,$11
0771: 06 00       ld   b,$00
0773: CD 9E 07    call $079E
0776: 2B          dec  hl
0777: CD 9E 07    call $079E
077A: 2B          dec  hl
077B: CD 7F 07    call $077F
077E: C9          ret

077F: 7E          ld   a,(hl)
0780: 0F          rrca
0781: 0F          rrca
0782: 0F          rrca
0783: 0F          rrca
0784: CD 8E 07    call $078E
0787: E7          rst  $20
0788: 7E          ld   a,(hl)
0789: CD 8E 07    call $078E
078C: E7          rst  $20
078D: C9          ret

078E: E6 0F       and  $0F
0790: E5          push hl
0791: 21 62 33    ld   hl,$3362
0794: CF          rst  $08
0795: E1          pop  hl
0796: 12          ld   (de),a
0797: CB 92       res  2,d
0799: 79          ld   a,c
079A: 12          ld   (de),a
079B: CB D2       set  2,d
079D: C9          ret

079E: 7E          ld   a,(hl)
079F: 0F          rrca
07A0: 0F          rrca
07A1: 0F          rrca
07A2: 0F          rrca
07A3: CD AD 07    call $07AD
07A6: E7          rst  $20
07A7: 7E          ld   a,(hl)
07A8: CD AD 07    call $07AD
07AB: E7          rst  $20
07AC: C9          ret

07AD: E6 0F       and  $0F
07AF: 28 03       jr   z,$07B4
07B1: 04          inc  b
07B2: 18 07       jr   $07BB

07B4: 3E 0A       ld   a,$0A
07B6: 04          inc  b
07B7: 05          dec  b
07B8: 28 01       jr   z,$07BB
07BA: AF          xor  a
07BB: E5          push hl
07BC: 21 62 33    ld   hl,$3362
07BF: CF          rst  $08
07C0: E1          pop  hl
07C1: 12          ld   (de),a
07C2: CB 92       res  2,d
07C4: 79          ld   a,c
07C5: 12          ld   (de),a
07C6: CB D2       set  2,d
07C8: C9          ret

07E4: 21 A6 40    ld   hl,$40A6
07E7: D7          rst  $10
07E8: EB          ex   de,hl
07E9: 5E          ld   e,(hl)
07EA: 23          inc  hl
07EB: 56          ld   d,(hl)
07EC: 23          inc  hl
07ED: 4E          ld   c,(hl)
07EE: 23          inc  hl
07EF: 7E          ld   a,(hl)
07F0: FE 9E       cp   $9E
07F2: C8          ret  z
07F3: 12          ld   (de),a
07F4: CB 92       res  2,d
07F6: 79          ld   a,c
07F7: 12          ld   (de),a
07F8: CB D2       set  2,d
07FA: 23          inc  hl
07FB: E7          rst  $20
07FC: C3 EF 07    jp   $07EF

080B: 21 2C 94    ld   hl,$942C
080E: 34          inc  (hl)
080F: C9          ret

0828: 21 7C 4B    ld   hl,$4B7C
082B: E5          push hl
082C: 3A 2C 94    ld   a,($942C)
082F: F7          rst  $30

089A: 3A 0B 96    ld   a,($960B)
089D: A7          and  a
089E: CA B6 5D    jp   z,$5DB6
08A1: 3C          inc  a
08A2: E6 03       and  $03
08A4: F7          rst  $30

08AD: 3A 0B 96    ld   a,($960B)
08B0: C3 A1 08    jp   $08A1

08B3: CD 04 38    call $3804
08B6: CD A1 0E    call $0EA1
08B9: CD 0E 59    call $590E
08BC: CD 86 16    call $1686
08BF: CD 57 18    call $1857
08C2: CD 30 1F    call $1F30
08C5: CD 4B 32    call $324B
08C8: CD 90 21    call $2190
08CB: CD F3 22    call $22F3
08CE: CD 16 45    call $4516
08D1: CD 16 48    call $4816
08D4: CD 17 16    call $1617
08D7: CD 03 22    call $2203
08DA: 3A 00 90    ld   a,($9000)
08DD: 3C          inc  a
08DE: CA A6 09    jp   z,$09A6
08E1: 3D          dec  a
08E2: C0          ret  nz
08E3: 21 10 90    ld   hl,$9010
08E6: 11 10 00    ld   de,$0010
08E9: 06 0A       ld   b,$0A
08EB: 3A 69 96    ld   a,($9669)
08EE: A7          and  a
08EF: CA 75 0D    jp   z,$0D75
08F2: 7E          ld   a,(hl)
08F3: A7          and  a
08F4: C0          ret  nz
08F5: 19          add  hl,de
08F6: 10 F3       djnz $08EB
08F8: CD D2 09    call $09D2
08FB: 3A 58 94    ld   a,($9458)
08FE: A7          and  a
08FF: 28 03       jr   z,$0904
0901: CD 43 0E    call $0E43    ; [uncovered] 
0904: 11 05 01    ld   de,$0105
0907: FF          rst  $38
0908: 3A 58 94    ld   a,($9458)
090B: A7          and  a
090C: 28 02       jr   z,$0910
090E: 1C          inc  e    ; [uncovered] 
090F: FF          rst  $38    ; [uncovered] 
0910: AF          xor  a
0911: 32 0E 93    ld   ($930E),a
0914: 32 FD A7    ld   ($A7FD),a
0917: 32 9E 91    ld   ($919E),a
091A: 21 1D 96    ld   hl,$961D
091D: 34          inc  (hl)
091E: 21 00 96    ld   hl,$9600
0921: 35          dec  (hl)
0922: F5          push af
0923: 3A 62 96    ld   a,($9662)
0926: A7          and  a
0927: 11 20 96    ld   de,$9620
092A: 28 03       jr   z,$092F
092C: 11 40 96    ld   de,$9640    ; [uncovered] 
092F: 21 00 96    ld   hl,$9600
0932: 01 20 00    ld   bc,$0020
0935: ED B0       ldir
0937: F1          pop  af
0938: 28 4F       jr   z,$0989
093A: 3A 62 96    ld   a,($9662)
093D: A7          and  a
093E: 21 40 96    ld   hl,$9640
0941: 28 03       jr   z,$0946
0943: 21 20 96    ld   hl,$9620    ; [uncovered] 
0946: 7E          ld   a,(hl)
0947: A7          and  a
0948: 28 09       jr   z,$0953
094A: 3A 62 96    ld   a,($9662)    ; [uncovered] 
094D: 3C          inc  a    ; [uncovered] 
094E: E6 01       and  $01    ; [uncovered] 
0950: 32 62 96    ld   ($9662),a    ; [uncovered] 
0953: 3E 5A       ld   a,$5A
0955: 32 65 94    ld   ($9465),a
0958: 3A 67 00    ld   a,($0067)
095B: 32 2C 94    ld   ($942C),a
095E: C9          ret

0980: CD 00 14    call $1400
0983: 32 00 C0    ld   ($C000),a
0986: C3 C3 52    jp   $52C3

0989: 11 09 01    ld   de,$0109
098C: 3A 62 96    ld   a,($9662)
098F: A7          and  a
0990: 28 01       jr   z,$0993
0992: 1C          inc  e    ; [uncovered] 
0993: FF          rst  $38
0994: 11 0B 01    ld   de,$010B
0997: FF          rst  $38
0998: 3E B4       ld   a,$B4
099A: 32 65 94    ld   ($9465),a
099D: CD F2 3A    call $3AF2
09A0: CD 43 0E    call $0E43
09A3: C3 0B 08    jp   $080B

09A6: 3A 00 94    ld   a,($9400)
09A9: E6 0F       and  $0F
09AB: C8          ret  z
09AC: 3A 01 96    ld   a,($9601)
09AF: A7          and  a
09B0: C0          ret  nz
09B1: 3A 05 96    ld   a,($9605)
09B4: A7          and  a
09B5: C0          ret  nz
09B6: 3A F0 92    ld   a,($92F0)
09B9: A7          and  a
09BA: C0          ret  nz
09BB: 3A A0 90    ld   a,($90A0)
09BE: A7          and  a
09BF: C0          ret  nz
09C0: 3A BE 92    ld   a,($92BE)
09C3: A7          and  a
09C4: C0          ret  nz
09C5: 21 8E 91    ld   hl,$918E
09C8: 35          dec  (hl)
09C9: C0          ret  nz
09CA: 3D          dec  a
09CB: 32 0C 96    ld   ($960C),a
09CE: C3 BA 0D    jp   $0DBA

09D2: 3A 62 96    ld   a,($9662)
09D5: E6 01       and  $01
09D7: 20 12       jr   nz,$09EB
09D9: 21 B0 90    ld   hl,$90B0
09DC: 11 10 00    ld   de,$0010
09DF: D9          exx
09E0: 21 B5 90    ld   hl,$90B5
09E3: 11 10 00    ld   de,$0010
09E6: 06 24       ld   b,$24
09E8: C3 FA 09    jp   $09FA

09FA: D9          exx
09FB: 7E          ld   a,(hl)
09FC: 3C          inc  a
09FD: 20 07       jr   nz,$0A06
09FF: D9          exx
0A00: 36 FF       ld   (hl),$FF
0A02: D9          exx
0A03: C3 14 0A    jp   $0A14

0A06: 3D          dec  a
0A07: 28 07       jr   z,$0A10
0A09: 3A 05 96    ld   a,($9605)    ; [uncovered] 
0A0C: 3D          dec  a    ; [uncovered] 
0A0D: 32 05 96    ld   ($9605),a    ; [uncovered] 
0A10: D9          exx
0A11: 36 00       ld   (hl),$00
0A13: D9          exx
0A14: 19          add  hl,de
0A15: D9          exx
0A16: 19          add  hl,de
0A17: 10 E1       djnz $09FA
0A19: C9          ret

0A1A: 3E FC       ld   a,$FC
0A1C: 32 3B 94    ld   ($943B),a
0A1F: CD 31 38    call $3831
0A22: 3A 00 94    ld   a,($9400)
0A25: E6 01       and  $01
0A27: C2 ED 0A    jp   nz,$0AED
0A2A: CD 20 17    call $1720
0A2D: 21 15 94    ld   hl,$9415
0A30: 0F          rrca
0A31: CB 16       rl   (hl)
0A33: 23          inc  hl
0A34: 0F          rrca
0A35: CB 16       rl   (hl)
0A37: 23          inc  hl
0A38: 0F          rrca
0A39: 0F          rrca
0A3A: 0F          rrca
0A3B: CB 16       rl   (hl)
0A3D: 23          inc  hl
0A3E: 0F          rrca
0A3F: CB 16       rl   (hl)
0A41: 7E          ld   a,(hl)
0A42: E6 07       and  $07
0A44: 3D          dec  a
0A45: 28 3B       jr   z,$0A82
0A47: 2B          dec  hl
0A48: 7E          ld   a,(hl)
0A49: E6 07       and  $07
0A4B: 3D          dec  a
0A4C: 28 34       jr   z,$0A82
0A4E: 2B          dec  hl
0A4F: 7E          ld   a,(hl)
0A50: FE FF       cp   $FF
0A52: CC E2 0A    call z,$0AE2
0A55: E6 07       and  $07
0A57: 3D          dec  a
0A58: 28 1B       jr   z,$0A75
0A5A: 2B          dec  hl
0A5B: 7E          ld   a,(hl)
0A5C: FE 7F       cp   $7F
0A5E: CC E2 0A    call z,$0AE2
0A61: E6 07       and  $07
0A63: 3D          dec  a
0A64: 28 02       jr   z,$0A68
0A66: 18 5D       jr   $0AC5

0A68: 21 19 94    ld   hl,$9419
0A6B: 35          dec  (hl)
0A6C: 7E          ld   a,(hl)
0A6D: FE 80       cp   $80
0A6F: 38 3F       jr   c,$0AB0
0A71: 36 1A       ld   (hl),$1A
0A73: 18 3B       jr   $0AB0

0A75: 21 19 94    ld   hl,$9419
0A78: 34          inc  (hl)
0A79: 7E          ld   a,(hl)
0A7A: FE 1B       cp   $1B
0A7C: 38 32       jr   c,$0AB0
0A7E: 36 00       ld   (hl),$00    ; [uncovered] 
0A80: 18 2E       jr   $0AB0    ; [uncovered] 

0A82: 3A 19 94    ld   a,($9419)
0A85: 21 DC 4D    ld   hl,$4DDC
0A88: CF          rst  $08
0A89: 2A 11 94    ld   hl,($9411)
0A8C: ED 5B 13 94 ld   de,($9413)
0A90: 12          ld   (de),a
0A91: 77          ld   (hl),a
0A92: 3A 10 94    ld   a,($9410)
0A95: CB 92       res  2,d
0A97: 12          ld   (de),a
0A98: CB D2       set  2,d
0A9A: E7          rst  $20
0A9B: 23          inc  hl
0A9C: 22 11 94    ld   ($9411),hl
0A9F: ED 53 13 94 ld   ($9413),de
0AA3: 21 1A 94    ld   hl,$941A
0AA6: 35          dec  (hl)
0AA7: 28 2E       jr   z,$0AD7
0AA9: AF          xor  a
0AAA: 32 19 94    ld   ($9419),a
0AAD: CD AA 5D    call $5DAA
0AB0: ED 5B 13 94 ld   de,($9413)
0AB4: 3A 19 94    ld   a,($9419)
0AB7: 21 DC 4D    ld   hl,$4DDC
0ABA: CF          rst  $08
0ABB: 12          ld   (de),a
0ABC: CB 92       res  2,d
0ABE: 3E 0E       ld   a,$0E
0AC0: 12          ld   (de),a
0AC1: AF          xor  a
0AC2: 32 1C 94    ld   ($941C),a
0AC5: 3A 00 94    ld   a,($9400)
0AC8: E6 07       and  $07
0ACA: 20 37       jr   nz,$0B03
0ACC: 21 65 94    ld   hl,$9465
0ACF: 35          dec  (hl)
0AD0: 20 31       jr   nz,$0B03
0AD2: 2A 13 94    ld   hl,($9413)    ; [uncovered] 
0AD5: 36 83       ld   (hl),$83    ; [uncovered] 
0AD7: 3E 78       ld   a,$78
0AD9: 32 65 94    ld   ($9465),a
0ADC: CD AA 5D    call $5DAA
0ADF: C3 0B 08    jp   $080B

0AED: 21 1C 94    ld   hl,$941C
0AF0: 34          inc  (hl)
0AF1: 2A 13 94    ld   hl,($9413)
0AF4: CB 94       res  2,h
0AF6: 3A 1C 94    ld   a,($941C)
0AF9: CB 67       bit  4,a
0AFB: 28 04       jr   z,$0B01
0AFD: 36 0E       ld   (hl),$0E
0AFF: 18 02       jr   $0B03

0B01: 36 01       ld   (hl),$01
0B03: 21 40 96    ld   hl,$9640
0B06: 3A 20 96    ld   a,($9620)
0B09: B6          or   (hl)
0B0A: C0          ret  nz
0B0B: 3A 40 94    ld   a,($9440)
0B0E: A7          and  a
0B0F: 20 20       jr   nz,$0B31
0B11: 3A 06 94    ld   a,($9406)
0B14: FE 01       cp   $01
0B16: D8          ret  c
0B17: 28 0D       jr   z,$0B26
0B19: 3A 2E 94    ld   a,($942E)    ; [uncovered] 
0B1C: E6 18       and  $18    ; [uncovered] 
0B1E: C8          ret  z    ; [uncovered] 
0B1F: FE 08       cp   $08    ; [uncovered] 
0B21: 28 0B       jr   z,$0B2E    ; [uncovered] 
0B23: C3 8A 10    jp   $108A    ; [uncovered] 

0B26: 3A 2E 94    ld   a,($942E)
0B29: E6 18       and  $18
0B2B: FE 08       cp   $08
0B2D: C0          ret  nz
0B2E: C3 A0 10    jp   $10A0    ; [uncovered] 

0B42: C3 A0 10    call $3B2D
0B45: CD 43 0E    call $0E43
0B48: AF          xor  a
0B49: 32 69 96    ld   ($9669),a
0B4C: 32 62 96    ld   ($9662),a
0B4F: AF          xor  a
0B50: 2A 10 0A    ld   hl,($0A10)
0B53: ED 5B 12 0A ld   de,($0A12)
0B57: ED 4B 14 0A ld   bc,($0A14)
0B5B: 19          add  hl,de
0B5C: 09          add  hl,bc
0B5D: 85          add  a,l
0B5E: 84          add  a,h
0B5F: D6 DA       sub  $DA
0B61: C2 64 29    jp   nz,$2964
0B64: 3A 68 00    ld   a,($0068)
0B67: 32 2B 94    ld   ($942B),a
0B6A: 3A 02 01    ld   a,($0102)
0B6D: 32 2C 94    ld   ($942C),a
0B70: C9          ret

0B71: CD 04 38    call $3804
0B74: CD 68 4B    call $4B68
0B77: CD F2 3A    call $3AF2
0B7A: 3A 0B 96    ld   a,($960B)
0B7D: 0F          rrca
0B7E: 0F          rrca
0B7F: E6 07       and  $07
0B81: C6 20       add  a,$20
0B83: 5F          ld   e,a
0B84: 16 01       ld   d,$01
0B86: FF          rst  $38
0B87: 3E 96       ld   a,$96
0B89: 32 65 94    ld   ($9465),a
0B8C: CD CE 5D    call $5DCE
0B8F: CD 86 1B    call $1B86
0B92: 3E FB       ld   a,$FB
0B94: 32 3B 94    ld   ($943B),a
0B97: C3 0B 08    jp   $080B

0B9A: CD 31 38    call $3831
0B9D: CD E0 1B    call $1BE0
0BA0: A7          and  a
0BA1: CA B1 0B    jp   z,$0BB1
0BA4: 21 65 94    ld   hl,$9465
0BA7: 7E          ld   a,(hl)
0BA8: A7          and  a
0BA9: C8          ret  z
0BAA: 35          dec  (hl)
0BAB: C0          ret  nz
0BAC: 11 20 03    ld   de,$0320
0BAF: FF          rst  $38
0BB0: C9          ret

0BB1: 21 65 94    ld   hl,$9465
0BB4: 36 06       ld   (hl),$06
0BB6: C3 0B 08    jp   $080B

0BB9: 3E FC       ld   a,$FC
0BBB: 32 3B 94    ld   ($943B),a
0BBE: CD 31 38    call $3831
0BC1: 21 65 94    ld   hl,$9465
0BC4: 35          dec  (hl)
0BC5: C0          ret  nz
0BC6: 36 F0       ld   (hl),$F0
0BC8: CD 92 4E    call $4E92
0BCB: 11 14 01    ld   de,$0114
0BCE: FF          rst  $38
0BCF: CD 9A 5C    call $5C9A
0BD2: 3A FE 10    ld   a,($10FE)
0BD5: 32 00 90    ld   ($9000),a
0BD8: 06 40       ld   b,$40
0BDA: 3A 07 94    ld   a,($9407)
0BDD: 0F          rrca
0BDE: E6 80       and  $80
0BE0: 80          add  a,b
0BE1: 32 01 90    ld   ($9001),a
0BE4: C3 0B 08    jp   $080B

0BE7: 3E FD       ld   a,$FD
0BE9: 32 3B 94    ld   ($943B),a
0BEC: CD 31 38    call $3831
0BEF: CD 57 18    call $1857
0BF2: CD B6 0C    call $0CB6
0BF5: 21 65 94    ld   hl,$9465
0BF8: 35          dec  (hl)
0BF9: C0          ret  nz
0BFA: 11 14 03    ld   de,$0314
0BFD: FF          rst  $38
0BFE: CD 82 5C    call $5C82
0C01: C3 0B 08    jp   $080B

0C04: CD 31 38    call $3831
0C07: CD 86 16    call $1686
0C0A: CD 0E 59    call $590E
0C0D: CD 57 18    call $1857
0C10: CD 30 1F    call $1F30
0C13: CD 4B 32    call $324B
0C16: CD F3 22    call $22F3
0C19: CD 17 16    call $1617
0C1C: 3A 05 96    ld   a,($9605)
0C1F: A7          and  a
0C20: C0          ret  nz
0C21: 21 8E 91    ld   hl,$918E
0C24: 7E          ld   a,(hl)
0C25: A7          and  a
0C26: 28 02       jr   z,$0C2A
0C28: 35          dec  (hl)
0C29: C9          ret

0C2A: 21 65 94    ld   hl,$9465
0C2D: 36 64       ld   (hl),$64
0C2F: AF          xor  a
0C30: 32 AE 91    ld   ($91AE),a
0C33: 3A 7E 91    ld   a,($917E)
0C36: FE 40       cp   $40
0C38: 38 19       jr   c,$0C53
0C3A: 11 19 01    ld   de,$0119    ; [uncovered] 
0C3D: FF          rst  $38    ; [uncovered] 
0C3E: 1E 1E       ld   e,$1E    ; [uncovered] 
0C40: FF          rst  $38    ; [uncovered] 
0C41: 3A 08 12    ld   a,($1208)    ; [uncovered] 
0C44: 32 7E 91    ld   ($917E),a    ; [uncovered] 
0C47: 3A EA 24    ld   a,($24EA)    ; [uncovered] 
0C4A: 32 4E 93    ld   ($934E),a    ; [uncovered] 
0C4D: CD 92 5D    call $5D92    ; [uncovered] 
0C50: C3 7A 0C    jp   $0C7A    ; [uncovered] 

0C53: 11 18 01    ld   de,$0118
0C56: FF          rst  $38
0C57: 11 1A 01    ld   de,$011A
0C5A: FF          rst  $38
0C5B: 1C          inc  e
0C5C: FF          rst  $38
0C5D: 11 52 86    ld   de,$8652
0C60: 3A 7E 91    ld   a,($917E)
0C63: 0E 01       ld   c,$01
0C65: CD EA 05    call $05EA
0C68: 3A 7E 91    ld   a,($917E)
0C6B: 11 B2 85    ld   de,$85B2
0C6E: CD EA 05    call $05EA
0C71: CD 88 5C    call $5C88
0C74: CD D4 5D    call $5DD4
0C77: C3 0B 08    jp   $080B

0C98: 3E FC       ld   a,$FC
0C9A: 32 3B 94    ld   ($943B),a
0C9D: CD 31 38    call $3831
0CA0: CD 57 18    call $1857
0CA3: CD 30 1F    call $1F30
0CA6: CD B6 0C    call $0CB6
0CA9: 21 65 94    ld   hl,$9465
0CAC: 35          dec  (hl)
0CAD: C0          ret  nz
0CAE: 21 65 94    ld   hl,$9465
0CB1: 36 78       ld   (hl),$78
0CB3: C3 0B 08    jp   $080B

0CB6: 3A 00 94    ld   a,($9400)
0CB9: 47          ld   b,a
0CBA: E6 07       and  $07
0CBC: C0          ret  nz
0CBD: 78          ld   a,b
0CBE: 0F          rrca
0CBF: 0F          rrca
0CC0: 0F          rrca
0CC1: E6 03       and  $03
0CC3: 21 F3 0C    ld   hl,$0CF3
0CC6: CF          rst  $08
0CC7: 21 2E 83    ld   hl,$832E
0CCA: 11 DB FF    ld   de,$FFDB
0CCD: 0E 14       ld   c,$14
0CCF: 06 05       ld   b,$05
0CD1: 77          ld   (hl),a
0CD2: 2C          inc  l
0CD3: 10 FC       djnz $0CD1
0CD5: 19          add  hl,de
0CD6: 0D          dec  c
0CD7: 20 F6       jr   nz,$0CCF
0CD9: C9          ret

0CF7: 3E FC       ld   a,$FC
0CF9: 32 3B 94    ld   ($943B),a
0CFC: CD 31 38    call $3831
0CFF: CD B6 0C    call $0CB6
0D02: CD 57 18    call $1857
0D05: CD 30 1F    call $1F30
0D08: CD 17 16    call $1617
0D0B: 21 4E 93    ld   hl,$934E
0D0E: 7E          ld   a,(hl)
0D0F: A7          and  a
0D10: 20 5C       jr   nz,$0D6E
0D12: 3A 7E 91    ld   a,($917E)
0D15: A7          and  a
0D16: 28 25       jr   z,$0D3D
0D18: 3A 00 94    ld   a,($9400)
0D1B: E6 07       and  $07
0D1D: C0          ret  nz
0D1E: 21 7E 91    ld   hl,$917E
0D21: 11 02 04    ld   de,$0402
0D24: 7E          ld   a,(hl)
0D25: D6 01       sub  $01
0D27: 27          daa
0D28: 77          ld   (hl),a
0D29: 28 0E       jr   z,$0D39
0D2B: 1C          inc  e
0D2C: 7E          ld   a,(hl)
0D2D: D6 01       sub  $01
0D2F: 27          daa
0D30: 77          ld   (hl),a
0D31: 28 06       jr   z,$0D39
0D33: 1C          inc  e
0D34: 7E          ld   a,(hl)
0D35: D6 01       sub  $01
0D37: 27          daa
0D38: 77          ld   (hl),a
0D39: FF          rst  $38
0D3A: CD 8C 5D    call $5D8C
0D3D: 21 65 94    ld   hl,$9465
0D40: 35          dec  (hl)
0D41: C0          ret  nz
0D42: CD 2D 3B    call $3B2D
0D45: 3A 26 35    ld   a,($3526)
0D48: 32 2C 94    ld   ($942C),a
0D4B: 11 19 03    ld   de,$0319
0D4E: FF          rst  $38
0D4F: 1C          inc  e
0D50: FF          rst  $38
0D51: 1C          inc  e
0D52: FF          rst  $38
0D53: 1E 1E       ld   e,$1E
0D55: FF          rst  $38
0D56: 3A 34 41    ld   a,($4134)
0D59: 32 52 86    ld   ($8652),a
0D5C: 32 32 86    ld   ($8632),a
0D5F: 32 B2 85    ld   ($85B2),a
0D62: 32 92 85    ld   ($8592),a
0D65: 32 D2 85    ld   ($85D2),a
0D68: 32 72 86    ld   ($8672),a
0D6B: C3 BA 0D    jp   $0DBA

0D75: 3A 18 44    ld   a,($4418)
0D78: 32 2C 94    ld   ($942C),a
0D7B: 3A B0 46    ld   a,($46B0)
0D7E: 32 2B 94    ld   ($942B),a
0D81: 3A F5 57    ld   a,($57F5)
0D84: 32 03 98    ld   ($9803),a
0D87: 32 07 98    ld   ($9807),a
0D8A: 32 0B 98    ld   ($980B),a
0D8D: 32 0F 98    ld   ($980F),a
0D90: CD 43 0E    call $0E43
0D93: CD D4 5D    call $5DD4
0D96: C9          ret

0D97: CD 31 38    call $3831
0D9A: CD E0 1B    call $1BE0
0D9D: A7          and  a
0D9E: C0          ret  nz
0D9F: CD 2E 17    call $172E
0DA2: 3A 59 58    ld   a,($5859)
0DA5: 32 2C 94    ld   ($942C),a
0DA8: 11 00 05    ld   de,$0500
0DAB: 01 00 80    ld   bc,$8000
0DAE: 1A          ld   a,(de)
0DAF: 81          add  a,c
0DB0: 4F          ld   c,a
0DB1: 13          inc  de
0DB2: 10 FA       djnz $0DAE
0DB4: D6 C9       sub  $C9
0DB6: C2 00 00    jp   nz,$0000
0DB9: C9          ret

0DBA: 3A 69 96    ld   a,($9669)
0DBD: A7          and  a
0DBE: CA 75 0D    jp   z,$0D75
0DC1: CD 43 0E    call $0E43
0DC4: CD D2 09    call $09D2
0DC7: 21 09 96    ld   hl,$9609
0DCA: 34          inc  (hl)
0DCB: 46          ld   b,(hl)
0DCC: 21 0B 96    ld   hl,$960B
0DCF: 34          inc  (hl)
0DD0: 7E          ld   a,(hl)
0DD1: FE 18       cp   $18
0DD3: 38 1D       jr   c,$0DF2
0DD5: 78          ld   a,b    ; [uncovered] 
0DD6: 1E 05       ld   e,$05    ; [uncovered] 
0DD8: D6 18       sub  $18    ; [uncovered] 
0DDA: 38 10       jr   c,$0DEC    ; [uncovered] 
0DDC: 1E 08       ld   e,$08    ; [uncovered] 
0DDE: D6 18       sub  $18    ; [uncovered] 
0DE0: 38 0A       jr   c,$0DEC    ; [uncovered] 
0DE2: 1E 0B       ld   e,$0B    ; [uncovered] 
0DE4: D6 18       sub  $18    ; [uncovered] 
0DE6: 38 04       jr   c,$0DEC    ; [uncovered] 
0DE8: 1E 00       ld   e,$00    ; [uncovered] 
0DEA: 18 EC       jr   $0DD8    ; [uncovered] 

0DF2: 78          ld   a,b
0DF3: 3C          inc  a
0DF4: E6 03       and  $03
0DF6: FE 03       cp   $03
0DF8: 28 6F       jr   z,$0E69
0DFA: CD D4 5D    call $5DD4
0DFD: CD 50 00    call $0050
0E00: 34          inc  (hl)
0E01: 7E          ld   a,(hl)
0E02: FE 12       cp   $12
0E04: 38 02       jr   c,$0E08
0E06: 36 11       ld   (hl),$11    ; [uncovered] 
0E08: 3E 24       ld   a,$24
0E0A: 32 01 96    ld   ($9601),a
0E0D: 32 05 96    ld   ($9605),a
0E10: AF          xor  a
0E11: 32 1D 96    ld   ($961D),a
0E14: 32 5E 91    ld   ($915E),a
0E17: 32 03 96    ld   ($9603),a
0E1A: 32 0D 96    ld   ($960D),a
0E1D: 32 2E 90    ld   ($902E),a
0E20: 32 3E 91    ld   ($913E),a
0E23: 32 02 96    ld   ($9602),a
0E26: 32 0E 90    ld   ($900E),a
0E29: 32 9E 91    ld   ($919E),a
0E2C: 32 10 96    ld   ($9610),a
0E2F: 16 05       ld   d,$05
0E31: FF          rst  $38
0E32: 21 65 94    ld   hl,$9465
0E35: 36 78       ld   (hl),$78
0E37: 21 2C 94    ld   hl,$942C
0E3A: 36 14       ld   (hl),$14
0E3C: CD F2 3A    call $3AF2
0E3F: C3 9A 5C    jp   $5C9A

0E43: AF          xor  a
0E44: 21 10 90    ld   hl,$9010
0E47: 11 10 00    ld   de,$0010
0E4A: 06 3D       ld   b,$3D
0E4C: 77          ld   (hl),a
0E4D: 19          add  hl,de
0E4E: 10 FC       djnz $0E4C
0E50: 21 10 98    ld   hl,$9810
0E53: 11 04 00    ld   de,$0004
0E56: 06 38       ld   b,$38
0E58: 77          ld   (hl),a
0E59: 19          add  hl,de
0E5A: 10 FC       djnz $0E58
0E5C: 21 00 99    ld   hl,$9900
0E5F: 11 04 00    ld   de,$0004
0E62: 06 0E       ld   b,$0E
0E64: 77          ld   (hl),a
0E65: 19          add  hl,de
0E66: 10 FC       djnz $0E64
0E68: C9          ret

0E69: CD 58 00    call $0058
0E6C: CD 9E 5D    call $5D9E
0E6F: 3E 33       ld   a,$33
0E71: 32 01 96    ld   ($9601),a
0E74: 32 05 96    ld   ($9605),a
0E77: 32 AE 91    ld   ($91AE),a
0E7A: AF          xor  a
0E7B: 32 0D 96    ld   ($960D),a
0E7E: 32 2E 90    ld   ($902E),a
0E81: 32 3E 91    ld   ($913E),a
0E84: 32 02 96    ld   ($9602),a
0E87: 32 7E 91    ld   ($917E),a
0E8A: 32 5E 91    ld   ($915E),a
0E8D: 16 05       ld   d,$05
0E8F: FF          rst  $38
0E90: 21 65 94    ld   hl,$9465
0E93: 36 78       ld   (hl),$78
0E95: 3E 0F       ld   a,$0F
0E97: 32 8E 91    ld   ($918E),a
0E9A: 3A 42 35    ld   a,($3542)
0E9D: 32 2C 94    ld   ($942C),a
0EA0: C9          ret

0EA1: 21 06 96    ld   hl,$9606
0EA4: CD C0 0E    call $0EC0
0EA7: D8          ret  c
0EA8: 21 5E 93    ld   hl,$935E
0EAB: 34          inc  (hl)
0EAC: 7E          ld   a,(hl)
0EAD: FE 32       cp   $32
0EAF: 20 03       jr   nz,$0EB4
0EB1: 32 EE 91    ld   ($91EE),a    ; [uncovered] 
0EB4: 21 08 96    ld   hl,$9608
0EB7: CD C0 0E    call $0EC0
0EBA: D8          ret  c
0EBB: 2D          dec  l
0EBC: CD C0 0E    call $0EC0
0EBF: C9          ret

0EC0: 7E          ld   a,(hl)
0EC1: C6 01       add  a,$01
0EC3: 27          daa
0EC4: 77          ld   (hl),a
0EC5: FE 60       cp   $60
0EC7: D8          ret  c
0EC8: 36 00       ld   (hl),$00
0ECA: C9          ret

0ECB: 21 00 98    ld   hl,$9800
0ECE: 11 04 00    ld   de,$0004
0ED1: AF          xor  a
0ED2: 06 3C       ld   b,$3C
0ED4: 77          ld   (hl),a
0ED5: 19          add  hl,de
0ED6: 10 FC       djnz $0ED4
0ED8: 21 00 99    ld   hl,$9900
0EDB: 06 0E       ld   b,$0E
0EDD: 77          ld   (hl),a
0EDE: 19          add  hl,de
0EDF: 10 FC       djnz $0EDD
0EE1: 21 03 98    ld   hl,$9803
0EE4: 06 04       ld   b,$04
0EE6: 77          ld   (hl),a
0EE7: 19          add  hl,de
0EE8: 10 FC       djnz $0EE6
0EEA: 32 FD A7    ld   ($A7FD),a
0EED: 32 FC A7    ld   ($A7FC),a
0EF0: 21 00 90    ld   hl,$9000
0EF3: 11 10 00    ld   de,$0010
0EF6: 06 3B       ld   b,$3B
0EF8: 36 00       ld   (hl),$00
0EFA: 19          add  hl,de
0EFB: 10 FB       djnz $0EF8
0EFD: C9          ret

0EFE: 3A 2C 94    ld   a,($942C)
0F01: F7          rst  $30

0F11: CD BB 01    call $01BB
0F14: 3A A9 37    ld   a,($37A9)
0F17: 2A AA 37    ld   hl,($37AA)
0F1A: DF          rst  $18
0F1B: AC          xor  h
0F1C: D6 EB       sub  $EB
0F1E: C2 00 00    jp   nz,$0000
0F21: C3 0B 08    jp   $080B

0F24: 21 4C 0F    ld   hl,$0F4C
0F27: E5          push hl
0F28: 3A 2C 94    ld   a,($942C)
0F2B: F7          rst  $30

0F4C: 3A 2B 94    ld   a,($942B)
0F4F: 3D          dec  a
0F50: CC 04 38    call z,$3804
0F53: 3A 06 94    ld   a,($9406)
0F56: A7          and  a
0F57: CA 67 0F    jp   z,$0F67
0F5A: 3A F1 00    ld   a,($00F1)
0F5D: 32 2B 94    ld   ($942B),a
0F60: 3A 12 01    ld   a,($0112)
0F63: 32 2C 94    ld   ($942C),a
0F66: C9          ret

0F67: 3A 40 94    ld   a,($9440)
0F6A: A7          and  a
0F6B: C8          ret  z
0F6C: 3A 2E 94    ld   a,($942E)    ; [uncovered] 
0F6F: E6 18       and  $18    ; [uncovered] 
0F71: C8          ret  z    ; [uncovered] 
0F72: CD CB 0E    call $0ECB    ; [uncovered] 
0F75: CD 88 5C    call $5C88    ; [uncovered] 
0F78: CD D4 5D    call $5DD4    ; [uncovered] 
0F7B: 3A 2E 94    ld   a,($942E)    ; [uncovered] 
0F7E: CB 67       bit  4,a    ; [uncovered] 
0F80: 20 05       jr   nz,$0F87    ; [uncovered] 
0F82: CB 5F       bit  3,a    ; [uncovered] 
0F84: 20 14       jr   nz,$0F9A    ; [uncovered] 
0F86: C9          ret    ; [uncovered] 

0FAB: 3A D9 06    ld   a,($06D9)
0FAE: 32 2B 94    ld   ($942B),a
0FB1: 3A 81 09    ld   a,($0981)
0FB4: 32 2C 94    ld   ($942C),a
0FB7: 3A 00 C0    ld   a,($C000)
0FBA: 2F          cpl
0FBB: 0F          rrca
0FBC: 0F          rrca
0FBD: 0F          rrca
0FBE: 0F          rrca
0FBF: E6 07       and  $07
0FC1: 32 44 94    ld   ($9444),a
0FC4: C9          ret

1019: CD 0F 13    call $130F
101C: C3 9D 59    jp   $599D

101F: CD 04 38    call $3804
1022: 3A 2C 94    ld   a,($942C)
1025: F7          rst  $30

1043: CD B6 0C    call $0CB6
1046: 3A 2E 94    ld   a,($942E)
1049: CB 5F       bit  3,a
104B: C2 A0 10    jp   nz,$10A0
104E: 3A 06 94    ld   a,($9406)
1051: 3D          dec  a
1052: C8          ret  z
1053: 11 17 01    ld   de,$0117    ; [uncovered] 
1056: FF          rst  $38    ; [uncovered] 
1057: C3 0B 08    jp   $080B    ; [uncovered] 

105A: CD B6 0C    call $0CB6
105D: 3A 2E 94    ld   a,($942E)
1060: CB 67       bit  4,a
1062: C2 8A 10    jp   nz,$108A
1065: CB 5F       bit  3,a
1067: C2 A0 10    jp   nz,$10A0
106A: 3A FB 85    ld   a,($85FB)
106D: D6 48       sub  $48
106F: C2 FF 07    jp   nz,$07FF
1072: C9          ret

10A0: 21 06 94    ld   hl,$9406
10A3: 7E          ld   a,(hl)
10A4: D6 01       sub  $01
10A6: 27          daa
10A7: 77          ld   (hl),a
10A8: 3A 58 94    ld   a,($9458)
10AB: AF          xor  a
10AC: 32 58 94    ld   ($9458),a
10AF: 32 40 96    ld   ($9640),a
10B2: 3C          inc  a
10B3: 32 69 96    ld   ($9669),a
10B6: CD 5A 13    call $135A
10B9: C3 AB 0F    jp   $0FAB

10BC: CD 4F 11    call $114F
10BF: CD C9 11    call $11C9
10C2: CD 88 11    call $1188
10C5: CD 0C 12    call $120C
10C8: CD EB 12    call $12EB
10CB: C9          ret

114F: 32 2E 94    ld   a,($942E)
1152: 0F          rrca
1153: 0F          rrca
1154: 0F          rrca
1155: 21 03 94    ld   hl,$9403
1158: CB 16       rl   (hl)
115A: 7E          ld   a,(hl)
115B: E6 07       and  $07
115D: FE 01       cp   $01
115F: C0          ret  nz
1160: CD 72 5C    call $5C72    ; [uncovered] 
1163: 0E 01       ld   c,$01    ; [uncovered] 
1165: C3 F6 11    jp   $11F6    ; [uncovered] 

1188: 3A 2E 94    ld   a,($942E)
118B: 21 4A 94    ld   hl,$944A
118E: 0F          rrca
118F: 0F          rrca
1190: CB 16       rl   (hl)
1192: 7E          ld   a,(hl)
1193: E6 07       and  $07
1195: FE 01       cp   $01
1197: C0          ret  nz
1198: EB          ex   de,hl    ; [uncovered] 
1199: CD 72 5C    call $5C72    ; [uncovered] 
119C: 21 02 94    ld   hl,$9402    ; [uncovered] 
119F: 34          inc  (hl)    ; [uncovered] 
11A0: EB          ex   de,hl    ; [uncovered] 
11A1: 23          inc  hl    ; [uncovered] 
11A2: 7E          ld   a,(hl)    ; [uncovered] 
11A3: C6 10       add  a,$10    ; [uncovered] 
11A5: 77          ld   (hl),a    ; [uncovered] 
11A6: 47          ld   b,a    ; [uncovered] 
11A7: 23          inc  hl    ; [uncovered] 
11A8: 7E          ld   a,(hl)    ; [uncovered] 
11A9: 90          sub  b    ; [uncovered] 
11AA: D0          ret  nc    ; [uncovered] 
11AB: 7E          ld   a,(hl)    ; [uncovered] 
11AC: 4F          ld   c,a    ; [uncovered] 
11AD: E6 F0       and  $F0    ; [uncovered] 
11AF: C6 10       add  a,$10    ; [uncovered] 
11B1: 2B          dec  hl    ; [uncovered] 
11B2: ED 44       neg    ; [uncovered] 
11B4: 86          add  a,(hl)    ; [uncovered] 
11B5: 77          ld   (hl),a    ; [uncovered] 
11B6: 18 3E       jr   $11F6    ; [uncovered] 

11C9: 3A 2E 94    ld   a,($942E)
11CC: 21 47 94    ld   hl,$9447
11CF: 0F          rrca
11D0: CB 16       rl   (hl)
11D2: 7E          ld   a,(hl)
11D3: E6 07       and  $07
11D5: FE 01       cp   $01
11D7: C0          ret  nz
11D8: EB          ex   de,hl
11D9: CD 72 5C    call $5C72
11DC: 21 01 94    ld   hl,$9401
11DF: 34          inc  (hl)
11E0: EB          ex   de,hl
11E1: 23          inc  hl
11E2: 7E          ld   a,(hl)
11E3: C6 10       add  a,$10
11E5: 77          ld   (hl),a
11E6: 47          ld   b,a
11E7: 23          inc  hl
11E8: 7E          ld   a,(hl)
11E9: 90          sub  b
11EA: D0          ret  nc
11EB: 7E          ld   a,(hl)
11EC: 4F          ld   c,a
11ED: E6 F0       and  $F0
11EF: C6 10       add  a,$10
11F1: 2B          dec  hl
11F2: ED 44       neg
11F4: 86          add  a,(hl)
11F5: 77          ld   (hl),a
11F6: 3A 40 94    ld   a,($9440)
11F9: A7          and  a
11FA: 20 10       jr   nz,$120C
11FC: 79          ld   a,c
11FD: E6 0F       and  $0F
11FF: 21 06 94    ld   hl,$9406
1202: 86          add  a,(hl)
1203: 27          daa
1204: 77          ld   (hl),a
1205: 30 02       jr   nc,$1209
1207: 36 99       ld   (hl),$99    ; [uncovered] 
1209: CD 5A 13    call $135A
120C: 3A 01 94    ld   a,($9401)
120F: A7          and  a
1210: C8          ret  z
1211: 21 04 94    ld   hl,$9404
1214: 7E          ld   a,(hl)
1215: A7          and  a
1216: 20 07       jr   nz,$121F
1218: 36 30       ld   (hl),$30
121A: 3C          inc  a
121B: 32 82 C1    ld   ($C182),a
121E: C9          ret

121F: 35          dec  (hl)
1220: CA E6 12    jp   z,$12E6
1223: 7E          ld   a,(hl)
1224: FE 18       cp   $18
1226: C0          ret  nz
1227: AF          xor  a
1228: 32 82 C1    ld   ($C182),a
122B: C9          ret

122C: 21 3F 94    ld   hl,$943F
122F: 7E          ld   a,(hl)
1230: A7          and  a
1231: 28 71       jr   z,$12A4
1233: FE 22       cp   $22
1235: 30 31       jr   nc,$1268
1237: FE 02       cp   $02
1239: 28 30       jr   z,$126B
123B: 35          dec  (hl)
123C: 28 68       jr   z,$12A6
123E: DD 21 00 93 ld   ix,$9300
1242: FD 21 00 99 ld   iy,$9900
1246: 06 0B       ld   b,$0B
1248: C5          push bc
1249: CD C5 4E    call $4EC5
124C: FD 36 01 28 ld   (iy+$01),$28
1250: FD 36 02 08 ld   (iy+$02),$08
1254: 11 04 00    ld   de,$0004
1257: FD 19       add  iy,de
1259: DD 19       add  ix,de
125B: DD 19       add  ix,de
125D: DD 19       add  ix,de
125F: DD 19       add  ix,de
1261: C1          pop  bc
1262: 10 E4       djnz $1248
1264: 3E 01       ld   a,$01
1266: A7          and  a
1267: C9          ret

1268: 35          dec  (hl)
1269: 18 F9       jr   $1264

126B: 35          dec  (hl)
126C: 21 50 5D    ld   hl,$5D50
126F: 06 40       ld   b,$40
1271: 97          sub  a
1272: AE          xor  (hl)
1273: 23          inc  hl
1274: 10 FC       djnz $1272
1276: C6 E7       add  a,$E7
1278: C2 92 18    jp   nz,$1892
127B: FD 21 00 98 ld   iy,$9800
127F: DD 21 00 90 ld   ix,$9000
1283: DD 36 00 FF ld   (ix+$00),$FF
1287: 21 00 93    ld   hl,$9300
128A: 11 10 00    ld   de,$0010
128D: AF          xor  a
128E: 06 0B       ld   b,$0B
1290: 77          ld   (hl),a
1291: 19          add  hl,de
1292: 10 FC       djnz $1290
1294: 21 00 99    ld   hl,$9900
1297: 06 2C       ld   b,$2C
1299: 77          ld   (hl),a
129A: 2C          inc  l
129B: 10 FC       djnz $1299
129D: 32 76 94    ld   ($9476),a
12A0: 32 3E 92    ld   ($923E),a
12A3: C9          ret

12A4: AF          xor  a
12A5: C9          ret

12A6: AF          xor  a
12A7: 32 FD A7    ld   ($A7FD),a
12AA: C9          ret

12E6: 21 01 94    ld   hl,$9401
12E9: 35          dec  (hl)
12EA: C9          ret

12EB: 3A 02 94    ld   a,($9402)
12EE: A7          and  a
12EF: C8          ret  z
12F0: 21 05 94    ld   hl,$9405    ; [uncovered] 
12F3: 7E          ld   a,(hl)    ; [uncovered] 
12F4: A7          and  a    ; [uncovered] 
12F5: 20 07       jr   nz,$12FE    ; [uncovered] 
12F7: 36 30       ld   (hl),$30    ; [uncovered] 
12F9: 3C          inc  a    ; [uncovered] 
12FA: 32 83 C1    ld   ($C183),a    ; [uncovered] 
12FD: C9          ret    ; [uncovered] 

130F: 3A 31 94    ld   a,($9431)
1312: E6 0F       and  $0F
1314: FE 0F       cp   $0F
1316: 20 05       jr   nz,$131D
1318: 21 40 94    ld   hl,$9440    ; [uncovered] 
131B: 36 FF       ld   (hl),$FF    ; [uncovered] 
131D: 21 3E 13    ld   hl,$133E
1320: CF          rst  $08
1321: 32 49 94    ld   ($9449),a
1324: 3A 31 94    ld   a,($9431)
1327: 0F          rrca
1328: 0F          rrca
1329: 0F          rrca
132A: 0F          rrca
132B: E6 0F       and  $0F
132D: FE 0F       cp   $0F
132F: 20 05       jr   nz,$1336
1331: 21 40 94    ld   hl,$9440    ; [uncovered] 
1334: 36 FF       ld   (hl),$FF    ; [uncovered] 
1336: 21 3E 13    ld   hl,$133E
1339: CF          rst  $08
133A: 32 4C 94    ld   ($944C),a
133D: C9          ret

135A: 0E 10       ld   c,$10
135C: 11 7F 84    ld   de,$847F
135F: 21 06 94    ld   hl,$9406
1362: CD 7F 07    call $077F
1365: C9          ret

1381: D9          exx
1382: 21 BF 94    ld   hl,$94BF
1385: 11 C0 94    ld   de,$94C0
1388: 01 10 00    ld   bc,$0010
138B: ED B8       lddr
138D: 21 C0 94    ld   hl,$94C0
1390: 3A B7 94    ld   a,($94B7)
1393: AE          xor  (hl)
1394: 32 B0 94    ld   ($94B0),a
1397: 21 00 94    ld   hl,$9400
139A: 86          add  a,(hl)
139B: D9          exx
139C: C9          ret

139D: CD 92 4E    call $4E92
13A0: CD CB 0E    call $0ECB
13A3: CD D6 01    call $01D6
13A6: CD 88 5C    call $5C88
13A9: CD D4 5D    call $5DD4
13AC: 21 C7 4B    ld   hl,$4BC7
13AF: AF          xor  a
13B0: 47          ld   b,a
13B1: 86          add  a,(hl)
13B2: 23          inc  hl
13B3: 10 FC       djnz $13B1
13B5: D6 C8       sub  $C8
13B7: C2 AB 0F    jp   nz,$0FAB
13BA: C3 0B 08    jp   $080B

13BD: 3E FB       ld   a,$FB
13BF: 32 3B 94    ld   ($943B),a
13C2: CD 31 38    call $3831
13C5: 21 65 94    ld   hl,$9465
13C8: 35          dec  (hl)
13C9: 7E          ld   a,(hl)
13CA: FE 3C       cp   $3C
13CC: CA B0 5D    jp   z,$5DB0
13CF: A7          and  a
13D0: C0          ret  nz
13D1: 3A 62 96    ld   a,($9662)
13D4: A7          and  a
13D5: 21 40 96    ld   hl,$9640
13D8: 28 03       jr   z,$13DD
13DA: 21 20 96    ld   hl,$9620    ; [uncovered] 
13DD: 7E          ld   a,(hl)
13DE: A7          and  a
13DF: C2 E5 13    jp   nz,$13E5
13E2: C3 0B 08    jp   $080B

1400: 21 0C 14    ld   hl,$140C
1403: 11 B0 94    ld   de,$94B0
1406: 01 11 00    ld   bc,$0011
1409: ED B0       ldir
140B: C9          ret

1428: 21 F4 4A    ld   hl,$4AF4
142B: 11 88 94    ld   de,$9488
142E: 01 28 00    ld   bc,$0028
1431: ED B0       ldir
1433: C9          ret

143E: 21 88 94    ld   hl,$9488
1441: 11 11 87    ld   de,$8711
1444: 0E 01       ld   c,$01
1446: CD 76 14    call $1476
1449: 21 90 94    ld   hl,$9490
144C: 11 13 87    ld   de,$8713
144F: 0E 00       ld   c,$00
1451: CD 76 14    call $1476
1454: 21 98 94    ld   hl,$9498
1457: 11 15 87    ld   de,$8715
145A: 0E 0F       ld   c,$0F
145C: CD 76 14    call $1476
145F: 21 A0 94    ld   hl,$94A0
1462: 11 17 87    ld   de,$8717
1465: 0E 0D       ld   c,$0D
1467: CD 76 14    call $1476
146A: 21 A8 94    ld   hl,$94A8
146D: 11 19 87    ld   de,$8719
1470: 0E 0E       ld   c,$0E
1472: CD 76 14    call $1476
1475: C9          ret

1476: E5          push hl
1477: 7E          ld   a,(hl)
1478: 87          add  a,a
1479: 86          add  a,(hl)
147A: 21 CC 14    ld   hl,$14CC
147D: CF          rst  $08
147E: 12          ld   (de),a
147F: CB 92       res  2,d
1481: 79          ld   a,c
1482: 12          ld   (de),a
1483: CB D2       set  2,d
1485: 23          inc  hl
1486: E7          rst  $20
1487: 7E          ld   a,(hl)
1488: 12          ld   (de),a
1489: CB 92       res  2,d
148B: 79          ld   a,c
148C: 12          ld   (de),a
148D: CB D2       set  2,d
148F: 23          inc  hl
1490: E7          rst  $20
1491: 7E          ld   a,(hl)
1492: 12          ld   (de),a
1493: CB 92       res  2,d
1495: 79          ld   a,c
1496: 12          ld   (de),a
1497: CB D2       set  2,d
1499: 21 80 FF    ld   hl,$FF80
149C: 19          add  hl,de
149D: EB          ex   de,hl
149E: E1          pop  hl
149F: 23          inc  hl
14A0: 23          inc  hl
14A1: 23          inc  hl
14A2: CD 71 07    call $0771
14A5: E5          push hl
14A6: 21 A0 FF    ld   hl,$FFA0
14A9: 19          add  hl,de
14AA: EB          ex   de,hl
14AB: E1          pop  hl
14AC: 23          inc  hl
14AD: 23          inc  hl
14AE: 23          inc  hl
14AF: 7E          ld   a,(hl)
14B0: 12          ld   (de),a
14B1: CB 92       res  2,d
14B3: 79          ld   a,c
14B4: 12          ld   (de),a
14B5: CB D2       set  2,d
14B7: 23          inc  hl
14B8: E7          rst  $20
14B9: 7E          ld   a,(hl)
14BA: 12          ld   (de),a
14BB: CB 92       res  2,d
14BD: 79          ld   a,c
14BE: 12          ld   (de),a
14BF: CB D2       set  2,d
14C1: 23          inc  hl
14C2: E7          rst  $20
14C3: 7E          ld   a,(hl)
14C4: 12          ld   (de),a
14C5: CB 92       res  2,d
14C7: 79          ld   a,c
14C8: 12          ld   (de),a
14C9: CB D2       set  2,d
14CB: C9          ret

155F: 11 00 01    ld   de,$0100
1562: FF          rst  $38
1563: 1C          inc  e
1564: FF          rst  $38
1565: 16 01       ld   d,$01
1567: 1E 0F       ld   e,$0F
1569: 3A 43 94    ld   a,($9443)
156C: A7          and  a
156D: 28 02       jr   z,$1571
156F: 1C          inc  e    ; [uncovered] 
1570: 1C          inc  e    ; [uncovered] 
1571: FF          rst  $38
1572: 1C          inc  e
1573: FF          rst  $38
1574: 1E 15       ld   e,$15
1576: FF          rst  $38
1577: 3A 06 94    ld   a,($9406)
157A: FE 02       cp   $02
157C: 30 18       jr   nc,$1596
157E: 1E 16       ld   e,$16
1580: FF          rst  $38
1581: 21 C1 24    ld   hl,$24C1
1584: 0E 00       ld   c,$00
1586: 3A 2C 94    ld   a,($942C)
1589: 96          sub  (hl)
158A: 23          inc  hl
158B: 0D          dec  c
158C: 20 FB       jr   nz,$1589
158E: EE 1E       xor  $1E
1590: 32 2C 94    ld   ($942C),a
1593: C3 0B 08    jp   $080B

1596: 1E 17       ld   e,$17
1598: FF          rst  $38
1599: 3A E8 05    ld   a,($05E8)
159C: 32 2C 94    ld   ($942C),a
159F: C9          ret

15A0: 21 8B 94    ld   hl,$948B
15A3: 06 05       ld   b,$05
15A5: 3A 62 96    ld   a,($9662)
15A8: A7          and  a
15A9: 11 65 96    ld   de,$9665
15AC: 28 03       jr   z,$15B1
15AE: 11 68 96    ld   de,$9668    ; [uncovered] 
15B1: E5          push hl
15B2: D5          push de
15B3: CD 08 16    call $1608
15B6: 30 09       jr   nc,$15C1
15B8: D1          pop  de
15B9: E1          pop  hl
15BA: 3E 08       ld   a,$08
15BC: CF          rst  $08
15BD: 10 F2       djnz $15B1
15BF: 37          scf    ; [uncovered] 
15C0: C9          ret    ; [uncovered] 

15C1: 05          dec  b
15C2: 28 3F       jr   z,$1603
15C4: 21 A7 94    ld   hl,$94A7
15C7: 11 AF 94    ld   de,$94AF
15CA: 78          ld   a,b
15CB: 87          add  a,a
15CC: 87          add  a,a
15CD: 87          add  a,a
15CE: 4F          ld   c,a
15CF: 06 00       ld   b,$00
15D1: ED B8       lddr
15D3: EB          ex   de,hl
15D4: 2B          dec  hl
15D5: 36 83       ld   (hl),$83
15D7: 2B          dec  hl
15D8: 36 83       ld   (hl),$83
15DA: 2B          dec  hl
15DB: 36 83       ld   (hl),$83
15DD: 22 11 94    ld   ($9411),hl
15E0: 2B          dec  hl
15E1: D1          pop  de
15E2: 01 03 00    ld   bc,$0003
15E5: EB          ex   de,hl
15E6: ED B8       lddr
15E8: 1A          ld   a,(de)
15E9: E1          pop  hl
15EA: 21 31 85    ld   hl,$8531
15ED: 87          add  a,a
15EE: CF          rst  $08
15EF: 22 13 94    ld   ($9413),hl
15F2: 21 88 94    ld   hl,$9488
15F5: 11 08 00    ld   de,$0008
15F8: 06 05       ld   b,$05
15FA: AF          xor  a
15FB: 77          ld   (hl),a
15FC: 19          add  hl,de
15FD: 3C          inc  a
15FE: 10 FB       djnz $15FB
1600: 37          scf
1601: 3F          ccf
1602: C9          ret

1603: 21 AF 94    ld   hl,$94AF
1606: 18 CC       jr   $15D4

1608: 0E 03       ld   c,$03
160A: 1A          ld   a,(de)
160B: BE          cp   (hl)
160C: D8          ret  c
160D: 20 05       jr   nz,$1614
160F: 1B          dec  de
1610: 2B          dec  hl
1611: 0D          dec  c
1612: 20 F6       jr   nz,$160A
1614: 37          scf
1615: 3F          ccf
1616: C9          ret

1617: 3A 69 96    ld   a,($9669)
161A: A7          and  a
161B: C8          ret  z
161C: 3A 43 94    ld   a,($9443)
161F: E6 01       and  $01
1621: 21 53 16    ld   hl,$1653
1624: 28 03       jr   z,$1629
1626: 21 F3 4B    ld   hl,$4BF3    ; [uncovered] 
1629: 4E          ld   c,(hl)
162A: 06 00       ld   b,$00
162C: 23          inc  hl
162D: 3A 62 96    ld   a,($9662)
1630: A7          and  a
1631: 3A 65 96    ld   a,($9665)
1634: 28 03       jr   z,$1639
1636: 3A 68 96    ld   a,($9668)    ; [uncovered] 
1639: ED B1       cpir
163B: 21 04 96    ld   hl,$9604
163E: 20 10       jr   nz,$1650
1640: CB 46       bit  0,(hl)
1642: C0          ret  nz
1643: CB C6       set  0,(hl)
1645: 21 00 96    ld   hl,$9600
1648: 7E          ld   a,(hl)
1649: 34          inc  (hl)
164A: 16 06       ld   d,$06
164C: FF          rst  $38
164D: C3 A4 5D    jp   $5DA4

1650: CB 86       res  0,(hl)
1652: C9          ret

1686: 21 EE 90    ld   hl,$90EE
1689: 7E          ld   a,(hl)
168A: A7          and  a
168B: 28 1A       jr   z,$16A7
168D: 35          dec  (hl)
168E: 20 38       jr   nz,$16C8
1690: 3A DE 90    ld   a,($90DE)
1693: 47          ld   b,a
1694: 3A 44 94    ld   a,($9444)
1697: 87          add  a,a
1698: 87          add  a,a
1699: D6 0C       sub  $0C
169B: ED 44       neg
169D: 80          add  a,b
169E: 32 7E 93    ld   ($937E),a
16A1: AF          xor  a
16A2: 32 9E 93    ld   ($939E),a
16A5: 18 21       jr   $16C8

16A7: 21 7E 93    ld   hl,$937E
16AA: 7E          ld   a,(hl)
16AB: A7          and  a
16AC: 20 19       jr   nz,$16C7
16AE: 3A AE 90    ld   a,($90AE)
16B1: A7          and  a
16B2: 28 14       jr   z,$16C8
16B4: 47          ld   b,a
16B5: 3A 44 94    ld   a,($9444)
16B8: 87          add  a,a
16B9: 87          add  a,a
16BA: D6 0C       sub  $0C
16BC: 80          add  a,b
16BD: 32 EE 90    ld   ($90EE),a
16C0: 3E 01       ld   a,$01
16C2: 32 9E 93    ld   ($939E),a
16C5: 18 01       jr   $16C8

16C7: 35          dec  (hl)
16C8: 21 BE 90    ld   hl,$90BE
16CB: 7E          ld   a,(hl)
16CC: A7          and  a
16CD: 28 01       jr   z,$16D0
16CF: 35          dec  (hl)
16D0: 21 FE 90    ld   hl,$90FE
16D3: 7E          ld   a,(hl)
16D4: A7          and  a
16D5: 28 01       jr   z,$16D8
16D7: 35          dec  (hl)
16D8: 21 6E 90    ld   hl,$906E
16DB: 7E          ld   a,(hl)
16DC: A7          and  a
16DD: 28 01       jr   z,$16E0
16DF: 35          dec  (hl)
16E0: 21 0E 91    ld   hl,$910E
16E3: 7E          ld   a,(hl)
16E4: A7          and  a
16E5: 28 01       jr   z,$16E8
16E7: 35          dec  (hl)
16E8: 3A 00 94    ld   a,($9400)
16EB: E6 01       and  $01
16ED: C8          ret  z
16EE: 21 AD 93    ld   hl,$93AD
16F1: 7E          ld   a,(hl)
16F2: A7          and  a
16F3: 28 01       jr   z,$16F6
16F5: 35          dec  (hl)    ; [uncovered] 
16F6: 21 CE 92    ld   hl,$92CE
16F9: 7E          ld   a,(hl)
16FA: A7          and  a
16FB: 28 01       jr   z,$16FE
16FD: 35          dec  (hl)
16FE: C9          ret

16FF: 47          ld   b,a
1700: 0F          rrca
1701: 0F          rrca
1702: 0F          rrca
1703: 0F          rrca
1704: E6 0F       and  $0F
1706: 28 09       jr   z,$1711
1708: CD 14 17    call $1714
170B: EB          ex   de,hl
170C: 11 E0 FF    ld   de,$FFE0
170F: 19          add  hl,de
1710: EB          ex   de,hl
1711: 78          ld   a,b
1712: E6 0F       and  $0F
1714: 21 62 33    ld   hl,$3362
1717: CF          rst  $08
1718: 12          ld   (de),a
1719: CB 92       res  2,d
171B: 79          ld   a,c
171C: 12          ld   (de),a
171D: CB D2       set  2,d
171F: C9          ret

1720: 3A 07 94    ld   a,($9407)
1723: A7          and  a
1724: 21 30 94    ld   hl,$9430
1727: 20 03       jr   nz,$172C
1729: 21 2F 94    ld   hl,$942F
172C: 7E          ld   a,(hl)
172D: C9          ret

172E: FD 21 00 98 ld   iy,$9800
1732: DD 21 00 90 ld   ix,$9000
1736: 06 40       ld   b,$40
1738: 3A 07 94    ld   a,($9407)
173B: A7          and  a
173C: 28 02       jr   z,$1740
173E: 06 C0       ld   b,$C0    ; [uncovered] 
1740: DD 70 01    ld   (ix+$01),b
1743: 3A 6D 06    ld   a,($066D)
1746: 32 00 90    ld   ($9000),a
1749: DD 21 10 90 ld   ix,$9010
174D: 3A 88 06    ld   a,($0688)
1750: 47          ld   b,a
1751: 3E 01       ld   a,$01
1753: 11 10 00    ld   de,$0010
1756: DD 77 0F    ld   (ix+$0f),a
1759: 3C          inc  a
175A: DD 19       add  ix,de
175C: 10 F8       djnz $1756
175E: 3A 1B 01    ld   a,($011B)
1761: 32 3F 94    ld   ($943F),a
1764: 32 FD A7    ld   ($A7FD),a
1767: 3A 69 96    ld   a,($9669)
176A: A7          and  a
176B: 20 23       jr   nz,$1790
176D: 3A 62 06    ld   a,($0662)
1770: 32 00 90    ld   ($9000),a
1773: CD 1F 19    call $191F
1776: 3A 50 94    ld   a,($9450)
1779: 3D          dec  a
177A: E6 03       and  $03
177C: 21 B7 17    ld   hl,$17B7
177F: D7          rst  $10
1780: 1A          ld   a,(de)
1781: 3C          inc  a
1782: 32 38 94    ld   ($9438),a
1785: 21 39 94    ld   hl,$9439
1788: 73          ld   (hl),e
1789: 2C          inc  l
178A: 72          ld   (hl),d
178B: AF          xor  a
178C: 32 4E 92    ld   ($924E),a
178F: C9          ret

1790: DD 21 00 93 ld   ix,$9300
1794: FD 21 00 99 ld   iy,$9900
1798: 21 FF 17    ld   hl,$17FF
179B: 06 0B       ld   b,$0B
179D: 11 04 00    ld   de,$0004
17A0: 3A 07 94    ld   a,($9407)
17A3: A7          and  a
17A4: 28 19       jr   z,$17BF
17A6: 7E          ld   a,(hl)    ; [uncovered] 
17A7: C6 0D       add  a,$0D    ; [uncovered] 
17A9: 2F          cpl    ; [uncovered] 
17AA: FD 77 03    ld   (iy+$03),a    ; [uncovered] 
17AD: 23          inc  hl    ; [uncovered] 
17AE: 7E          ld   a,(hl)    ; [uncovered] 
17AF: C6 07       add  a,$07    ; [uncovered] 
17B1: 2F          cpl    ; [uncovered] 
17B2: FD 77 00    ld   (iy+$00),a    ; [uncovered] 
17B5: 18 11       jr   $17C8    ; [uncovered] 

17BF: 18 11       ld   a,(hl)
17C0: 23          inc  hl
17C1: FD 77 03    ld   (iy+$03),a
17C4: 7E          ld   a,(hl)
17C5: FD 77 00    ld   (iy+$00),a
17C8: 23          inc  hl
17C9: FD 36 01 00 ld   (iy+$01),$00
17CD: FD 36 02 00 ld   (iy+$02),$00
17D1: 3A 07 94    ld   a,($9407)
17D4: 0F          rrca
17D5: E6 80       and  $80
17D7: 86          add  a,(hl)
17D8: 23          inc  hl
17D9: DD 77 01    ld   (ix+$01),a
17DC: DD 36 00 FF ld   (ix+$00),$FF
17E0: FD 19       add  iy,de
17E2: DD 19       add  ix,de
17E4: DD 19       add  ix,de
17E6: DD 19       add  ix,de
17E8: DD 19       add  ix,de
17EA: 10 B4       djnz $17A0
17EC: FD 36 00 00 ld   (iy+$00),$00
17F0: FD 36 01 00 ld   (iy+$01),$00
17F4: FD 36 02 00 ld   (iy+$02),$00
17F8: FD 36 03 00 ld   (iy+$03),$00
17FC: C3 3F 5D    jp   $5D3F

182B: 21 38 94    ld   hl,$9438
182E: 7E          ld   a,(hl)
182F: 47          ld   b,a
1830: E6 3F       and  $3F
1832: 28 07       jr   z,$183B
1834: 3D          dec  a
1835: 28 04       jr   z,$183B
1837: 05          dec  b
1838: 70          ld   (hl),b
1839: 18 0F       jr   $184A

183B: 23          inc  hl
183C: 5E          ld   e,(hl)
183D: 23          inc  hl
183E: 56          ld   d,(hl)
183F: 13          inc  de
1840: 72          ld   (hl),d
1841: 2B          dec  hl
1842: 73          ld   (hl),e
1843: EB          ex   de,hl
1844: 7E          ld   a,(hl)
1845: 1B          dec  de
1846: 3C          inc  a
1847: 12          ld   (de),a
1848: 18 E1       jr   $182B

184A: 78          ld   a,b
184B: CB 7F       bit  7,a
184D: C2 CC 18    jp   nz,$18CC
1850: CB 77       bit  6,a
1852: 20 44       jr   nz,$1898
1854: C3 10 19    jp   $1910

1857: DD 21 00 90 ld   ix,$9000
185B: FD 21 00 98 ld   iy,$9800
185F: DD 7E 00    ld   a,(ix+$00)
1862: A7          and  a
1863: C8          ret  z
1864: 3C          inc  a
1865: C2 4B 1A    jp   nz,$1A4B
1868: 3A 69 96    ld   a,($9669)
186B: A7          and  a
186C: CA 2B 18    jp   z,$182B
186F: CD 20 17    call $1720
1872: E6 0F       and  $0F
1874: CA 10 19    jp   z,$1910
1877: 21 1F 1D    ld   hl,$1D1F
187A: CF          rst  $08
187B: 47          ld   b,a
187C: 3A 07 94    ld   a,($9407)
187F: A7          and  a
1880: 28 04       jr   z,$1886
1882: 78          ld   a,b    ; [uncovered] 
1883: C6 80       add  a,$80    ; [uncovered] 
1885: 47          ld   b,a    ; [uncovered] 
1886: DD 7E 01    ld   a,(ix+$01)
1889: 90          sub  b
188A: CA 10 19    jp   z,$1910
188D: C6 02       add  a,$02
188F: FE 05       cp   $05
1891: DA 09 19    jp   c,$1909
1894: FE 80       cp   $80
1896: 30 34       jr   nc,$18CC
1898: 3A 3C 94    ld   a,($943C)
189B: CB 7F       bit  7,a
189D: 20 02       jr   nz,$18A1
189F: 3E 7F       ld   a,$7F
18A1: 3C          inc  a
18A2: FE 90       cp   $90
18A4: 38 03       jr   c,$18A9
18A6: 3A 74 4B    ld   a,($4B74)
18A9: 32 3C 94    ld   ($943C),a
18AC: E6 0F       and  $0F
18AE: 21 C7 19    ld   hl,$19C7
18B1: D7          rst  $10
18B2: DD 66 01    ld   h,(ix+$01)
18B5: DD 6E 05    ld   l,(ix+$05)
18B8: 19          add  hl,de
18B9: DD 74 01    ld   (ix+$01),h
18BC: DD 75 05    ld   (ix+$05),l
18BF: 7C          ld   a,h
18C0: D6 40       sub  $40
18C2: 32 0D 90    ld   ($900D),a
18C5: D6 80       sub  $80
18C7: 32 0C 90    ld   ($900C),a
18CA: 18 53       jr   $191F

18CC: 3A 3C 94    ld   a,($943C)
18CF: CB 77       bit  6,a
18D1: 20 03       jr   nz,$18D6
18D3: 3A 2D 12    ld   a,($122D)
18D6: 3C          inc  a
18D7: FE 50       cp   $50
18D9: 38 03       jr   c,$18DE
18DB: 3A B5 00    ld   a,($00B5)
18DE: 32 3C 94    ld   ($943C),a
18E1: E6 0F       and  $0F
18E3: 21 F5 19    ld   hl,$19F5
18E6: D7          rst  $10
18E7: DD 66 01    ld   h,(ix+$01)
18EA: DD 6E 05    ld   l,(ix+$05)
18ED: 19          add  hl,de
18EE: DD 74 01    ld   (ix+$01),h
18F1: DD 75 05    ld   (ix+$05),l
18F4: 7C          ld   a,h
18F5: C6 40       add  a,$40
18F7: 32 0D 90    ld   ($900D),a
18FA: C6 80       add  a,$80
18FC: 32 0C 90    ld   ($900C),a
18FF: 18 1E       jr   $191F

1901: 3E 00       ld   a,$00
1903: 32 85 C1    ld   ($C185),a
1906: C3 AF 4F    jp   $4FAF

1909: DD 70 01    ld   (ix+$01),b
190C: DD 36 05 00 ld   (ix+$05),$00
1910: 3A 01 90    ld   a,($9001)
1913: 32 0C 90    ld   ($900C),a
1916: 32 0D 90    ld   ($900D),a
1919: 3A 05 41    ld   a,($4105)
191C: 32 3C 94    ld   ($943C),a
191F: 3A 01 90    ld   a,($9001)
1922: C6 10       add  a,$10
1924: 32 06 90    ld   ($9006),a
1927: C6 E0       add  a,$E0
1929: 32 07 90    ld   ($9007),a
192C: C6 30       add  a,$30
192E: 32 08 90    ld   ($9008),a
1931: C6 C0       add  a,$C0
1933: 32 09 90    ld   ($9009),a
1936: C6 50       add  a,$50
1938: 32 0A 90    ld   ($900A),a
193B: C6 A0       add  a,$A0
193D: 32 0B 90    ld   ($900B),a
1940: DD 7E 01    ld   a,(ix+$01)
1943: CD A1 19    call $19A1
1946: DD 77 03    ld   (ix+$03),a
1949: 78          ld   a,b
194A: D6 C0       sub  $C0
194C: CD A1 19    call $19A1
194F: DD 77 02    ld   (ix+$02),a
1952: DD 7E 01    ld   a,(ix+$01)
1955: C6 04       add  a,$04
1957: 4F          ld   c,a
1958: 0F          rrca
1959: E6 7C       and  $7C
195B: CD 15 1A    call $1A15
195E: 79          ld   a,c
195F: 0F          rrca
1960: 0F          rrca
1961: 0F          rrca
1962: E6 1F       and  $1F
1964: 4F          ld   c,a
1965: 87          add  a,a
1966: 87          add  a,a
1967: 81          add  a,c
1968: 21 AD 5E    ld   hl,$5EAD
196B: DF          rst  $18
196C: 06 00       ld   b,$00
196E: 3A 0E 93    ld   a,($930E)
1971: A7          and  a
1972: 28 02       jr   z,$1976
1974: 06 02       ld   b,$02
1976: 3A 00 94    ld   a,($9400)
1979: 0F          rrca
197A: E6 01       and  $01
197C: 80          add  a,b
197D: 47          ld   b,a
197E: 7E          ld   a,(hl)
197F: 80          add  a,b
1980: FD 77 02    ld   (iy+$02),a
1983: FD 77 06    ld   (iy+$06),a
1986: FD 77 0A    ld   (iy+$0a),a
1989: FD 77 0E    ld   (iy+$0e),a
198C: 23          inc  hl
198D: 7E          ld   a,(hl)
198E: FD 77 01    ld   (iy+$01),a
1991: 23          inc  hl
1992: 7E          ld   a,(hl)
1993: FD 77 05    ld   (iy+$05),a
1996: 23          inc  hl
1997: 7E          ld   a,(hl)
1998: FD 77 09    ld   (iy+$09),a
199B: 23          inc  hl
199C: 7E          ld   a,(hl)
199D: FD 77 0D    ld   (iy+$0d),a
19A0: C9          ret

19A1: 47          ld   b,a
19A2: E6 3F       and  $3F
19A4: 28 18       jr   z,$19BE
19A6: CB 70       bit  6,b
19A8: 28 04       jr   z,$19AE
19AA: 4F          ld   c,a
19AB: 3E 40       ld   a,$40
19AD: 91          sub  c
19AE: 21 DA 5D    ld   hl,$5DDA
19B1: CF          rst  $08
19B2: CB 78       bit  7,b
19B4: 28 05       jr   z,$19BB
19B6: 4F          ld   c,a
19B7: 3E 80       ld   a,$80
19B9: 91          sub  c
19BA: C9          ret

19BB: C6 80       add  a,$80
19BD: C9          ret

19BE: 3E 68       ld   a,$68
19C0: CB 70       bit  6,b
19C2: 20 EE       jr   nz,$19B2
19C4: AF          xor  a
19C5: 18 EB       jr   $19B2

1A15: 21 2D 5E    ld   hl,$5E2D
1A18: DF          rst  $18
1A19: 46          ld   b,(hl)
1A1A: 23          inc  hl
1A1B: DD 56 02    ld   d,(ix+$02)
1A1E: 7A          ld   a,d
1A1F: 80          add  a,b
1A20: FD 77 03    ld   (iy+$03),a
1A23: FD 77 07    ld   (iy+$07),a
1A26: 46          ld   b,(hl)
1A27: 23          inc  hl
1A28: DD 5E 03    ld   e,(ix+$03)
1A2B: 7B          ld   a,e
1A2C: 80          add  a,b
1A2D: FD 77 00    ld   (iy+$00),a
1A30: C6 08       add  a,$08
1A32: FD 77 04    ld   (iy+$04),a
1A35: 46          ld   b,(hl)
1A36: 23          inc  hl
1A37: 7A          ld   a,d
1A38: 80          add  a,b
1A39: FD 77 0B    ld   (iy+$0b),a
1A3C: FD 77 0F    ld   (iy+$0f),a
1A3F: 46          ld   b,(hl)
1A40: 7B          ld   a,e
1A41: 80          add  a,b
1A42: FD 77 08    ld   (iy+$08),a
1A45: C6 08       add  a,$08
1A47: FD 77 0C    ld   (iy+$0c),a
1A4A: C9          ret

1A4B: DD 7E 00    ld   a,(ix+$00)
1A4E: FE F0       cp   $F0
1A50: 38 12       jr   c,$1A64
1A52: DD 36 00 B4 ld   (ix+$00),$B4
1A56: CD 6E 5D    call $5D6E
1A59: 3E 12       ld   a,$12
1A5B: 32 BE 91    ld   ($91BE),a
1A5E: 3E FF       ld   a,$FF
1A60: 32 CE 91    ld   ($91CE),a
1A63: C9          ret

1A64: 21 BE 91    ld   hl,$91BE
1A67: 7E          ld   a,(hl)
1A68: A7          and  a
1A69: 28 1C       jr   z,$1A87
1A6B: 35          dec  (hl)
1A6C: 3A 00 94    ld   a,($9400)
1A6F: 0F          rrca
1A70: 0F          rrca
1A71: E6 0F       and  $0F
1A73: 47          ld   b,a
1A74: FD 7E 02    ld   a,(iy+$02)
1A77: E6 C0       and  $C0
1A79: 80          add  a,b
1A7A: FD 77 02    ld   (iy+$02),a
1A7D: FD 77 06    ld   (iy+$06),a
1A80: FD 77 0A    ld   (iy+$0a),a
1A83: FD 77 0E    ld   (iy+$0e),a
1A86: C9          ret

1A87: 21 CE 91    ld   hl,$91CE
1A8A: 7E          ld   a,(hl)
1A8B: A7          and  a
1A8C: CA 4D 1B    jp   z,$1B4D
1A8F: 35          dec  (hl)
1A90: FE FF       cp   $FF
1A92: 28 58       jr   z,$1AEC
1A94: FD 21 00 99 ld   iy,$9900
1A98: DD 21 00 93 ld   ix,$9300
1A9C: 11 04 00    ld   de,$0004
1A9F: 01 10 00    ld   bc,$0010
1AA2: D9          exx
1AA3: 06 0E       ld   b,$0E
1AA5: 21 E2 1A    ld   hl,$1AE2
1AA8: 3A CE 91    ld   a,($91CE)
1AAB: 0F          rrca
1AAC: 0F          rrca
1AAD: 0F          rrca
1AAE: 0F          rrca
1AAF: E6 0F       and  $0F
1AB1: DF          rst  $18
1AB2: 4E          ld   c,(hl)
1AB3: FD 7E 00    ld   a,(iy+$00)
1AB6: FE 02       cp   $02
1AB8: 38 19       jr   c,$1AD3
1ABA: FD 7E 03    ld   a,(iy+$03)
1ABD: FE 02       cp   $02
1ABF: 38 1B       jr   c,$1ADC
1AC1: C5          push bc
1AC2: CD BF 4E    call $4EBF
1AC5: 3A 00 94    ld   a,($9400)
1AC8: 0F          rrca
1AC9: 0F          rrca
1ACA: E6 0F       and  $0F
1ACC: FD 77 02    ld   (iy+$02),a
1ACF: C1          pop  bc
1AD0: FD 71 01    ld   (iy+$01),c
1AD3: D9          exx
1AD4: FD 19       add  iy,de
1AD6: DD 09       add  ix,bc
1AD8: D9          exx
1AD9: 10 D8       djnz $1AB3
1ADB: C9          ret

1ADC: FD 36 00 00 ld   (iy+$00),$00
1AE0: 18 F1       jr   $1AD3

1AEC: FD 21 00 99 ld   iy,$9900
1AF0: DD 21 00 93 ld   ix,$9300
1AF4: 11 10 00    ld   de,$0010
1AF7: 01 04 00    ld   bc,$0004
1AFA: D9          exx
1AFB: 3A 01 90    ld   a,($9001)
1AFE: C6 40       add  a,$40
1B00: 4F          ld   c,a
1B01: 06 0E       ld   b,$0E
1B03: 3A 03 90    ld   a,($9003)
1B06: 5F          ld   e,a
1B07: 3A 02 90    ld   a,($9002)
1B0A: 57          ld   d,a
1B0B: FD 72 03    ld   (iy+$03),d
1B0E: FD 73 00    ld   (iy+$00),e
1B11: 78          ld   a,b
1B12: 87          add  a,a
1B13: 87          add  a,a
1B14: 87          add  a,a
1B15: 87          add  a,a
1B16: C6 C0       add  a,$C0
1B18: 81          add  a,c
1B19: DD 77 01    ld   (ix+$01),a
1B1C: FD 36 01 67 ld   (iy+$01),$67
1B20: FD 36 02 00 ld   (iy+$02),$00
1B24: DD 36 00 FF ld   (ix+$00),$FF
1B28: D9          exx
1B29: DD 19       add  ix,de
1B2B: FD 09       add  iy,bc
1B2D: D9          exx
1B2E: 10 DB       djnz $1B0B
1B30: 3E 50       ld   a,$50
1B32: 32 CE 91    ld   ($91CE),a
1B35: 32 FD A7    ld   ($A7FD),a
1B38: FD 21 00 98 ld   iy,$9800
1B3C: FD 36 03 00 ld   (iy+$03),$00
1B40: FD 36 07 00 ld   (iy+$07),$00
1B44: FD 36 0B 00 ld   (iy+$0b),$00
1B48: FD 36 0F 00 ld   (iy+$0f),$00
1B4C: C9          ret

1B4D: AF          xor  a
1B4E: 32 00 90    ld   ($9000),a
1B51: FD 36 03 00 ld   (iy+$03),$00
1B55: FD 36 07 00 ld   (iy+$07),$00
1B59: FD 36 0B 00 ld   (iy+$0b),$00
1B5D: FD 36 0F 00 ld   (iy+$0f),$00
1B61: 32 00 93    ld   ($9300),a
1B64: 32 10 93    ld   ($9310),a
1B67: 32 20 93    ld   ($9320),a
1B6A: 21 00 99    ld   hl,$9900
1B6D: 11 01 99    ld   de,$9901
1B70: 01 38 00    ld   bc,$0038
1B73: 36 00       ld   (hl),$00
1B75: ED B0       ldir
1B77: 21 60 05    ld   hl,$0560
1B7A: AF          xor  a
1B7B: 47          ld   b,a
1B7C: 86          add  a,(hl)
1B7D: 23          inc  hl
1B7E: 10 FC       djnz $1B7C
1B80: C6 62       add  a,$62
1B82: C2 00 00    jp   nz,$0000
1B85: C9          ret

1B86: DD 21 00 90 ld   ix,$9000
1B8A: FD 21 00 98 ld   iy,$9800
1B8E: 21 00 80    ld   hl,$8000
1B91: DD 56 02    ld   d,(ix+$02)
1B94: 1E 00       ld   e,$00
1B96: A7          and  a
1B97: ED 52       sbc  hl,de
1B99: CD C3 1B    call $1BC3
1B9C: DD 74 06    ld   (ix+$06),h
1B9F: DD 75 07    ld   (ix+$07),l
1BA2: 21 00 80    ld   hl,$8000
1BA5: DD 56 03    ld   d,(ix+$03)
1BA8: 1E 00       ld   e,$00
1BAA: A7          and  a
1BAB: ED 52       sbc  hl,de
1BAD: CD C3 1B    call $1BC3
1BB0: DD 74 08    ld   (ix+$08),h
1BB3: DD 75 09    ld   (ix+$09),l
1BB6: DD 36 0A 00 ld   (ix+$0a),$00
1BBA: DD 36 0B 00 ld   (ix+$0b),$00
1BBE: DD 36 0C FF ld   (ix+$0c),$FF
1BC2: C9          ret

1BC3: CB 1C       rr   h
1BC5: CB 1D       rr   l
1BC7: CB 2C       sra  h
1BC9: CB 1D       rr   l
1BCB: CB 2C       sra  h
1BCD: CB 1D       rr   l
1BCF: CB 2C       sra  h
1BD1: CB 1D       rr   l
1BD3: CB 2C       sra  h
1BD5: CB 1D       rr   l
1BD7: CB 2C       sra  h
1BD9: CB 1D       rr   l
1BDB: CB 2C       sra  h
1BDD: CB 1D       rr   l
1BDF: C9          ret

1BE0: FD 21 00 98 ld   iy,$9800
1BE4: DD 21 00 90 ld   ix,$9000
1BE8: DD 46 0C    ld   b,(ix+$0c)
1BEB: 78          ld   a,b
1BEC: FE EB       cp   $EB
1BEE: CA 32 1C    jp   z,$1C32
1BF1: DA 90 1C    jp   c,$1C90
1BF4: FE F7       cp   $F7
1BF6: CA 61 1C    jp   z,$1C61
1BF9: DD 35 0C    dec  (ix+$0c)
1BFC: 78          ld   a,b
1BFD: DD 66 02    ld   h,(ix+$02)
1C00: DD 6E 0A    ld   l,(ix+$0a)
1C03: DD 56 06    ld   d,(ix+$06)
1C06: DD 5E 07    ld   e,(ix+$07)
1C09: 19          add  hl,de
1C0A: DD 74 02    ld   (ix+$02),h
1C0D: DD 75 0A    ld   (ix+$0a),l
1C10: DD 66 03    ld   h,(ix+$03)
1C13: DD 6E 0B    ld   l,(ix+$0b)
1C16: DD 56 08    ld   d,(ix+$08)
1C19: DD 5E 09    ld   e,(ix+$09)
1C1C: 19          add  hl,de
1C1D: DD 74 03    ld   (ix+$03),h
1C20: DD 75 0B    ld   (ix+$0b),l
1C23: DD 7E 01    ld   a,(ix+$01)
1C26: C6 04       add  a,$04
1C28: 0F          rrca
1C29: E6 7C       and  $7C
1C2B: CD 15 1A    call $1A15
1C2E: 3E FF       ld   a,$FF
1C30: A7          and  a
1C31: C9          ret

1C32: DD 35 0C    dec  (ix+$0c)
1C35: DD 21 10 90 ld   ix,$9010
1C39: FD 21 10 98 ld   iy,$9810
1C3D: 3A 01 90    ld   a,($9001)
1C40: FD 77 03    ld   (iy+$03),a
1C43: FD 36 00 36 ld   (iy+$00),$36
1C47: DD 36 01 40 ld   (ix+$01),$40
1C4B: AF          xor  a
1C4C: 32 03 98    ld   ($9803),a
1C4F: 32 07 98    ld   ($9807),a
1C52: 32 0B 98    ld   ($980B),a
1C55: 32 0F 98    ld   ($980F),a
1C58: CD 94 2F    call $2F94
1C5B: CD BF 4E    call $4EBF
1C5E: C3 2E 1C    jp   $1C2E

1C61: DD 35 0C    dec  (ix+$0c)
1C64: DD 7E 01    ld   a,(ix+$01)
1C67: C6 08       add  a,$08
1C69: 0F          rrca
1C6A: 0F          rrca
1C6B: 0F          rrca
1C6C: 0F          rrca
1C6D: E6 0F       and  $0F
1C6F: 87          add  a,a
1C70: 87          add  a,a
1C71: 21 C0 5F    ld   hl,$5FC0
1C74: CF          rst  $08
1C75: CD 8E 19    call $198E
1C78: FD 7E 02    ld   a,(iy+$02)
1C7B: CB EF       set  5,a
1C7D: E6 F0       and  $F0
1C7F: C6 09       add  a,$09
1C81: FD 77 02    ld   (iy+$02),a
1C84: FD 77 06    ld   (iy+$06),a
1C87: FD 77 0A    ld   (iy+$0a),a
1C8A: FD 77 0E    ld   (iy+$0e),a
1C8D: C3 F9 1B    jp   $1BF9

1C90: FD 21 10 98 ld   iy,$9810
1C94: DD 21 10 90 ld   ix,$9010
1C98: 06 02       ld   b,$02
1C9A: 3A 2C 94    ld   a,($942C)
1C9D: CB 67       bit  4,a
1C9F: 28 02       jr   z,$1CA3
1CA1: 06 30       ld   b,$30
1CA3: FD 7E 00    ld   a,(iy+$00)
1CA6: B8          cp   b
1CA7: DA 1A 1D    jp   c,$1D1A
1CAA: 11 C0 00    ld   de,$00C0
1CAD: 3A 2C 94    ld   a,($942C)
1CB0: CB 67       bit  4,a
1CB2: 28 03       jr   z,$1CB7
1CB4: 11 80 01    ld   de,$0180
1CB7: FD 66 00    ld   h,(iy+$00)
1CBA: DD 6E 03    ld   l,(ix+$03)
1CBD: 19          add  hl,de
1CBE: FD 74 00    ld   (iy+$00),h
1CC1: DD 75 03    ld   (ix+$03),l
1CC4: CD 20 17    call $1720
1CC7: E6 0F       and  $0F
1CC9: 28 49       jr   z,$1D14
1CCB: 06 80       ld   b,$80
1CCD: 21 1F 1D    ld   hl,$1D1F
1CD0: CF          rst  $08
1CD1: 47          ld   b,a
1CD2: 3A 07 94    ld   a,($9407)
1CD5: A7          and  a
1CD6: 28 05       jr   z,$1CDD
1CD8: 3A 6D 00    ld   a,($006D)    ; [uncovered] 
1CDB: 80          add  a,b    ; [uncovered] 
1CDC: 47          ld   b,a    ; [uncovered] 
1CDD: FD 7E 03    ld   a,(iy+$03)
1CE0: 90          sub  b
1CE1: 28 31       jr   z,$1D14
1CE3: C6 02       add  a,$02
1CE5: FE 05       cp   $05
1CE7: 38 28       jr   c,$1D11
1CE9: FE 80       cp   $80
1CEB: 30 12       jr   nc,$1CFF
1CED: FD 66 03    ld   h,(iy+$03)    ; [uncovered] 
1CF0: DD 6E 02    ld   l,(ix+$02)    ; [uncovered] 
1CF3: 01 20 FF    ld   bc,$FF20    ; [uncovered] 
1CF6: 09          add  hl,bc    ; [uncovered] 
1CF7: FD 74 03    ld   (iy+$03),h    ; [uncovered] 
1CFA: DD 75 02    ld   (ix+$02),l    ; [uncovered] 
1CFD: 18 15       jr   $1D14    ; [uncovered] 

1CFF: FD 66 03    ld   h,(iy+$03)
1D02: DD 6E 02    ld   l,(ix+$02)
1D05: 01 E0 00    ld   bc,$00E0
1D08: 09          add  hl,bc
1D09: FD 74 03    ld   (iy+$03),h
1D0C: DD 75 02    ld   (ix+$02),l
1D0F: 18 03       jr   $1D14

1D11: FD 70 03    ld   (iy+$03),b
1D14: CD 94 2F    call $2F94
1D17: C3 2E 1C    jp   $1C2E

1D1A: AF          xor  a
1D1B: 32 10 98    ld   ($9810),a
1D1E: C9          ret

1F30: 3A FD A7    ld   a,($A7FD)
1F33: A7          and  a
1F34: C0          ret  nz
1F35: 3A 69 96    ld   a,($9669)
1F38: A7          and  a
1F39: CA C2 1F    jp   z,$1FC2
1F3C: CD 20 17    call $1720
1F3F: 07          rlca
1F40: 07          rlca
1F41: 07          rlca
1F42: 07          rlca
1F43: 21 CE 90    ld   hl,$90CE
1F46: CB 16       rl   (hl)
1F48: 7E          ld   a,(hl)
1F49: E6 03       and  $03
1F4B: FE 01       cp   $01
1F4D: CA 5C 1F    jp   z,$1F5C
1F50: FE 03       cp   $03
1F52: C3 4A 20    jp   $204A

1F5C: 3A 00 90    ld   a,($9000)
1F5F: 3C          inc  a
1F60: C0          ret  nz
1F61: 21 6E 93    ld   hl,$936E
1F64: 36 10       ld   (hl),$10
1F66: DD 21 00 93 ld   ix,$9300
1F6A: FD 21 00 99 ld   iy,$9900
1F6E: 11 10 00    ld   de,$0010
1F71: D9          exx
1F72: 11 08 00    ld   de,$0008
1F75: D9          exx
1F76: 3A 0E 93    ld   a,($930E)
1F79: A7          and  a
1F7A: C2 08 20    jp   nz,$2008
1F7D: 3A F5 24    ld   a,($24F5)
1F80: 06 03       ld   b,$03
1F82: DD 7E 00    ld   a,(ix+$00)
1F85: A7          and  a
1F86: 20 1C       jr   nz,$1FA4
1F88: FD 36 00 28 ld   (iy+$00),$28
1F8C: 3A 01 90    ld   a,($9001)
1F8F: FD 77 03    ld   (iy+$03),a
1F92: FD 36 02 08 ld   (iy+$02),$08
1F96: FD 36 01 5B ld   (iy+$01),$5B
1F9A: DD 36 00 FF ld   (ix+$00),$FF
1F9E: CD 8E 5C    call $5C8E
1FA1: C3 4A 20    jp   $204A

1FA4: DD 19       add  ix,de
1FA6: D9          exx
1FA7: FD 19       add  iy,de
1FA9: D9          exx
1FAA: 10 D6       djnz $1F82
1FAC: C3 4A 20    jp   $204A

1FC2: 21 9E 92    ld   hl,$929E
1FC5: 35          dec  (hl)
1FC6: C2 4A 20    jp   nz,$204A
1FC9: 36 06       ld   (hl),$06
1FCB: C3 5C 1F    jp   $1F5C

1FCE: CD F3 22    call $22F3
1FD1: 3E FB       ld   a,$FB
1FD3: 32 3B 94    ld   ($943B),a
1FD6: CD 31 38    call $3831
1FD9: 3A 62 96    ld   a,($9662)
1FDC: A7          and  a
1FDD: 21 20 96    ld   hl,$9620
1FE0: 28 03       jr   z,$1FE5
1FE2: 21 40 96    ld   hl,$9640    ; [uncovered] 
1FE5: 11 00 96    ld   de,$9600
1FE8: 01 20 00    ld   bc,$0020
1FEB: ED B0       ldir
1FED: CD 2E 17    call $172E
1FF0: CD F2 3A    call $3AF2
1FF3: 21 56 15    ld   hl,$1556
1FF6: 0E 80       ld   c,$80
1FF8: 3A 2B 94    ld   a,($942B)
1FFB: 86          add  a,(hl)
1FFC: 23          inc  hl
1FFD: 0D          dec  c
1FFE: 20 FB       jr   nz,$1FFB
2000: C6 94       add  a,$94
2002: 32 2C 94    ld   ($942C),a
2005: C3 0B 08    jp   $080B

2008: 3A 04 35    ld   a,($3504)
200B: 47          ld   b,a
200C: DD 7E 00    ld   a,(ix+$00)
200F: A7          and  a
2010: 20 30       jr   nz,$2042
2012: FD 36 00 28 ld   (iy+$00),$28
2016: FD 36 04 28 ld   (iy+$04),$28
201A: 3A 01 90    ld   a,($9001)
201D: D6 03       sub  $03
201F: FD 77 03    ld   (iy+$03),a
2022: C6 06       add  a,$06
2024: FD 77 07    ld   (iy+$07),a
2027: C6 02       add  a,$02
2029: FD 36 02 08 ld   (iy+$02),$08
202D: FD 36 06 08 ld   (iy+$06),$08
2031: FD 36 01 5B ld   (iy+$01),$5B
2035: FD 36 05 5B ld   (iy+$05),$5B
2039: DD 36 00 FE ld   (ix+$00),$FE
203D: CD 94 5C    call $5C94
2040: 18 08       jr   $204A

2042: DD 19       add  ix,de
2044: D9          exx
2045: FD 19       add  iy,de
2047: D9          exx
2048: 10 C2       djnz $200C
204A: DD 21 00 93 ld   ix,$9300
204E: FD 21 00 99 ld   iy,$9900
2052: 11 08 00    ld   de,$0008
2055: D9          exx
2056: 06 03       ld   b,$03
2058: 11 10 00    ld   de,$0010
205B: C5          push bc
205C: D5          push de
205D: DD 7E 00    ld   a,(ix+$00)
2060: A7          and  a
2061: 28 64       jr   z,$20C7
2063: 3C          inc  a
2064: CA F1 20    jp   z,$20F1
2067: 3C          inc  a
2068: CA 19 21    jp   z,$2119
206B: 3E 01       ld   a,$01
206D: 32 6E 93    ld   ($936E),a
2070: C3 70 21    jp   $2170

20BE: 3A 17 01    ld   a,($0117)
20C1: 32 0D 94    ld   ($940D),a
20C4: C3 45 4E    jp   $4E45

20C7: D1          pop  de
20C8: DD 19       add  ix,de
20CA: D9          exx
20CB: FD 19       add  iy,de
20CD: D9          exx
20CE: C1          pop  bc
20CF: 10 8A       djnz $205B
20D1: C9          ret

20F1: FD 7E 03    ld   a,(iy+$03)
20F4: C6 80       add  a,$80
20F6: FD 77 03    ld   (iy+$03),a
20F9: CD 1A 2D    call $2D1A
20FC: 28 08       jr   z,$2106
20FE: FD 7E 02    ld   a,(iy+$02)
2101: C6 00       add  a,$00
2103: FD 77 02    ld   (iy+$02),a
2106: FD 7E 03    ld   a,(iy+$03)
2109: C6 80       add  a,$80
210B: FD 77 03    ld   (iy+$03),a
210E: FD 7E 00    ld   a,(iy+$00)
2111: C6 05       add  a,$05
2113: FD 77 00    ld   (iy+$00),a
2116: C3 4D 21    jp   $214D

2119: FD 7E 03    ld   a,(iy+$03)
211C: C6 80       add  a,$80
211E: FD 77 03    ld   (iy+$03),a
2121: CD 1A 2D    call $2D1A
2124: 28 08       jr   z,$212E
2126: FD 7E 02    ld   a,(iy+$02)
2129: C6 00       add  a,$00
212B: FD 77 02    ld   (iy+$02),a
212E: FD 7E 03    ld   a,(iy+$03)
2131: C6 80       add  a,$80
2133: FD 77 03    ld   (iy+$03),a
2136: FD 7E 02    ld   a,(iy+$02)
2139: FD 77 06    ld   (iy+$06),a
213C: FD 7E 01    ld   a,(iy+$01)
213F: FD 77 05    ld   (iy+$05),a
2142: FD 7E 00    ld   a,(iy+$00)
2145: C6 05       add  a,$05
2147: FD 77 00    ld   (iy+$00),a
214A: FD 77 04    ld   (iy+$04),a
214D: FE F4       cp   $F4
214F: 30 1F       jr   nc,$2170
2151: C3 C7 20    jp   $20C7

2170: 3A 0E 93    ld   a,($930E)
2173: A7          and  a
2174: 20 0B       jr   nz,$2181
2176: DD 36 00 00 ld   (ix+$00),$00
217A: FD 36 00 00 ld   (iy+$00),$00
217E: C3 C7 20    jp   $20C7

2181: DD 36 00 00 ld   (ix+$00),$00
2185: FD 36 00 00 ld   (iy+$00),$00
2189: FD 36 04 00 ld   (iy+$04),$00
218D: C3 C7 20    jp   $20C7

2190: 3A FD A7    ld   a,($A7FD)
2193: A7          and  a
2194: C0          ret  nz
2195: DD 21 30 93 ld   ix,$9330
2199: FD 21 18 99 ld   iy,$9918
219D: 11 04 00    ld   de,$0004
21A0: 01 10 00    ld   bc,$0010
21A3: D9          exx
21A4: 06 08       ld   b,$08
21A6: C5          push bc
21A7: DD 7E 00    ld   a,(ix+$00)
21AA: A7          and  a
21AB: CA EE 21    jp   z,$21EE
21AE: 3C          inc  a
21AF: C2 F8 21    jp   nz,$21F8
21B2: FD 56 00    ld   d,(iy+$00)
21B5: 7A          ld   a,d
21B6: FE 20       cp   $20
21B8: DA F8 21    jp   c,$21F8
21BB: DD 6E 08    ld   l,(ix+$08)
21BE: DD 66 07    ld   h,(ix+$07)
21C1: DD 5E 03    ld   e,(ix+$03)
21C4: 19          add  hl,de
21C5: FD 74 00    ld   (iy+$00),h
21C8: DD 75 03    ld   (ix+$03),l
21CB: DD 35 05    dec  (ix+$05)
21CE: 20 1B       jr   nz,$21EB
21D0: FD 7E 03    ld   a,(iy+$03)
21D3: DD 86 04    add  a,(ix+$04)
21D6: FD 77 03    ld   (iy+$03),a
21D9: DD 56 09    ld   d,(ix+$09)
21DC: DD 5E 0A    ld   e,(ix+$0a)
21DF: 26 00       ld   h,$00
21E1: DD 6E 06    ld   l,(ix+$06)
21E4: 19          add  hl,de
21E5: DD 74 05    ld   (ix+$05),h
21E8: DD 75 06    ld   (ix+$06),l
21EB: CD 55 31    call $3155
21EE: D9          exx
21EF: FD 19       add  iy,de
21F1: DD 09       add  ix,bc
21F3: D9          exx
21F4: C1          pop  bc
21F5: 10 AF       djnz $21A6
21F7: C9          ret

21F8: DD 36 00 00 ld   (ix+$00),$00
21FC: FD 36 00 00 ld   (iy+$00),$00
2200: C3 EE 21    jp   $21EE

2203: FD 21 04 99 ld   iy,$9904
2207: 3A 00 90    ld   a,($9000)
220A: 3C          inc  a
220B: C2 C9 22    jp   nz,$22C9
220E: 3A F0 92    ld   a,($92F0)
2211: 3C          inc  a
2212: C0          ret  nz
2213: 3A F1 92    ld   a,($92F1)
2216: A7          and  a
2217: CA A9 22    jp   z,$22A9
221A: 2A F2 92    ld   hl,($92F2)
221D: 5D          ld   e,l
221E: 54          ld   d,h
221F: CB 3A       srl  d
2221: CB 1B       rr   e
2223: CB 3A       srl  d
2225: CB 1B       rr   e
2227: CB 3A       srl  d
2229: CB 1B       rr   e
222B: CB 3A       srl  d
222D: CB 1B       rr   e
222F: AF          xor  a
2230: ED 52       sbc  hl,de
2232: 22 F2 92    ld   ($92F2),hl
2235: 7C          ld   a,h
2236: C6 23       add  a,$23
2238: 67          ld   h,a
2239: FD 7E 00    ld   a,(iy+$00)
223C: B7          or   a
223D: 28 03       jr   z,$2242
223F: FD 74 00    ld   (iy+$00),h
2242: FD 7E 08    ld   a,(iy+$08)
2245: B7          or   a
2246: 28 03       jr   z,$224B
2248: FD 74 08    ld   (iy+$08),h
224B: FD B6 00    or   (iy+$00)
224E: 28 79       jr   z,$22C9
2250: FD 7E 00    ld   a,(iy+$00)
2253: B7          or   a
2254: 28 25       jr   z,$227B
2256: 2A F4 92    ld   hl,($92F4)
2259: 11 60 03    ld   de,$0360
225C: 19          add  hl,de
225D: 22 F4 92    ld   ($92F4),hl
2260: FD 74 03    ld   (iy+$03),h
2263: FD 7E 00    ld   a,(iy+$00)
2266: FE 2D       cp   $2D
2268: 30 11       jr   nc,$227B
226A: 3A 01 90    ld   a,($9001)
226D: 94          sub  h
226E: C6 04       add  a,$04
2270: FE 09       cp   $09
2272: 30 07       jr   nc,$227B
2274: FD 36 00 00 ld   (iy+$00),$00
2278: CD 68 5D    call $5D68
227B: FD 7E 08    ld   a,(iy+$08)
227E: B7          or   a
227F: 28 51       jr   z,$22D2
2281: 2A F6 92    ld   hl,($92F6)
2284: 11 A0 FC    ld   de,$FCA0
2287: 19          add  hl,de
2288: 22 F6 92    ld   ($92F6),hl
228B: FD 74 0B    ld   (iy+$0b),h
228E: FD 7E 08    ld   a,(iy+$08)
2291: FE 2D       cp   $2D
2293: 30 3D       jr   nc,$22D2
2295: 3A 01 90    ld   a,($9001)
2298: 94          sub  h
2299: C6 04       add  a,$04
229B: FE 09       cp   $09
229D: 30 33       jr   nc,$22D2
229F: FD 36 08 00 ld   (iy+$08),$00
22A3: CD 68 5D    call $5D68
22A6: C3 D2 22    jp   $22D2

22A9: 21 F1 92    ld   hl,$92F1
22AC: 36 01       ld   (hl),$01
22AE: 2C          inc  l
22AF: 36 00       ld   (hl),$00
22B1: 2C          inc  l
22B2: FD 7E 00    ld   a,(iy+$00)
22B5: D6 23       sub  $23
22B7: 77          ld   (hl),a
22B8: 2C          inc  l
22B9: 36 00       ld   (hl),$00
22BB: 2C          inc  l
22BC: FD 7E 03    ld   a,(iy+$03)
22BF: 77          ld   (hl),a
22C0: 2C          inc  l
22C1: 36 00       ld   (hl),$00
22C3: 2C          inc  l
22C4: FD 7E 0B    ld   a,(iy+$0b)
22C7: 77          ld   (hl),a
22C8: C9          ret

22C9: AF          xor  a
22CA: 32 F0 92    ld   ($92F0),a
22CD: 3C          inc  a
22CE: 32 0E 93    ld   ($930E),a
22D1: C9          ret

22D2: 3A 00 94    ld   a,($9400)
22D5: 0F          rrca
22D6: E6 03       and  $03
22D8: 21 EF 22    ld   hl,$22EF
22DB: CF          rst  $08
22DC: FD 21 0C 99 ld   iy,$990C
22E0: FD 77 01    ld   (iy+$01),a
22E3: FD 77 F9    ld   (iy-$07),a
22E6: FD 36 02 0D ld   (iy+$02),$0D
22EA: FD 36 FA 0D ld   (iy-$06),$0D
22EE: C9          ret

22F3: CD 39 23    call $2339
22F6: 3A 2E 92    ld   a,($922E)
22F9: 32 3E 91    ld   ($913E),a
22FC: CD B0 23    call $23B0
22FF: 3A 2E 92    ld   a,($922E)
2302: 32 05 96    ld   ($9605),a
2305: 3A 00 94    ld   a,($9400)
2308: E6 7F       and  $7F
230A: C0          ret  nz
230B: 3A 01 96    ld   a,($9601)
230E: A7          and  a
230F: C0          ret  nz
2310: 3A 05 96    ld   a,($9605)
2313: FE 12       cp   $12
2315: D0          ret  nc
2316: FE 03       cp   $03
2318: D8          ret  c
2319: 3A 1D 96    ld   a,($961D)
231C: FE 02       cp   $02
231E: D0          ret  nc
231F: 3A 0E 96    ld   a,($960E)
2322: A7          and  a
2323: C0          ret  nz
2324: 3E 01       ld   a,$01
2326: 32 4E 92    ld   ($924E),a
2329: C9          ret

2339: AF          xor  a
233A: 32 2E 92    ld   ($922E),a
233D: DD 21 10 90 ld   ix,$9010
2341: FD 21 10 98 ld   iy,$9810
2345: CD 18 25    call $2518
2348: DD 21 20 90 ld   ix,$9020
234C: FD 21 18 98 ld   iy,$9818
2350: CD 18 25    call $2518
2353: DD 21 30 90 ld   ix,$9030
2357: FD 21 20 98 ld   iy,$9820
235B: CD 18 25    call $2518
235E: DD 21 40 90 ld   ix,$9040
2362: FD 21 28 98 ld   iy,$9828
2366: CD 18 25    call $2518
2369: DD 21 50 90 ld   ix,$9050
236D: FD 21 30 98 ld   iy,$9830
2371: CD 18 25    call $2518
2374: DD 21 60 90 ld   ix,$9060
2378: FD 21 38 98 ld   iy,$9838
237C: CD 18 25    call $2518
237F: DD 21 70 90 ld   ix,$9070
2383: FD 21 40 98 ld   iy,$9840
2387: CD 18 25    call $2518
238A: DD 21 80 90 ld   ix,$9080
238E: FD 21 48 98 ld   iy,$9848
2392: CD 18 25    call $2518
2395: DD 21 90 90 ld   ix,$9090
2399: FD 21 50 98 ld   iy,$9850
239D: CD 18 25    call $2518
23A0: 3A 5E 91    ld   a,($915E)
23A3: A7          and  a
23A4: C0          ret  nz
23A5: DD 21 A0 90 ld   ix,$90A0
23A9: FD 21 58 98 ld   iy,$9858
23AD: C3 18 25    jp   $2518

23B0: DD 21 B0 90 ld   ix,$90B0
23B4: FD 21 60 98 ld   iy,$9860
23B8: 3A E7 09    ld   a,($09E7)
23BB: 47          ld   b,a
23BC: 3A 00 94    ld   a,($9400)
23BF: 0F          rrca
23C0: E6 1F       and  $1F
23C2: 4F          ld   c,a
23C3: 21 1B 24    ld   hl,$241B
23C6: DF          rst  $18
23C7: 3A 75 94    ld   a,($9475)
23CA: 86          add  a,(hl)
23CB: 32 75 94    ld   ($9475),a
23CE: 21 3B 24    ld   hl,$243B
23D1: 3A 3E 92    ld   a,($923E)
23D4: 3C          inc  a
23D5: 32 3E 92    ld   ($923E),a
23D8: 0F          rrca
23D9: E6 1F       and  $1F
23DB: DF          rst  $18
23DC: 3A 76 94    ld   a,($9476)
23DF: 86          add  a,(hl)
23E0: 32 76 94    ld   ($9476),a
23E3: D9          exx
23E4: 11 10 00    ld   de,$0010
23E7: 01 04 00    ld   bc,$0004
23EA: D9          exx
23EB: C5          push bc
23EC: DD 7E 00    ld   a,(ix+$00)
23EF: A7          and  a
23F0: 28 1F       jr   z,$2411
23F2: 21 2E 92    ld   hl,$922E
23F5: 34          inc  (hl)
23F6: 3C          inc  a
23F7: 28 03       jr   z,$23FC
23F9: C3 64 24    jp   $2464

23FC: CD DB 30    call $30DB
23FF: 3A 75 94    ld   a,($9475)
2402: DD 86 0C    add  a,(ix+$0c)
2405: FD 77 03    ld   (iy+$03),a
2408: 3A 76 94    ld   a,($9476)
240B: DD 86 0D    add  a,(ix+$0d)
240E: FD 77 00    ld   (iy+$00),a
2411: D9          exx
2412: DD 19       add  ix,de
2414: FD 09       add  iy,bc
2416: D9          exx
2417: C1          pop  bc
2418: 10 D1       djnz $23EB
241A: C9          ret

2464: 21 11 24    ld   hl,$2411
2467: E5          push hl
2468: DD 7E 00    ld   a,(ix+$00)
246B: FE F0       cp   $F0
246D: CA 9B 24    jp   z,$249B
2470: FE 01       cp   $01
2472: CA 8E 24    jp   z,$248E
2475: DD 35 00    dec  (ix+$00)
2478: C3 1B 31    jp   $311B

248E: DD 36 00 00 ld   (ix+$00),$00
2492: FD 36 00 00 ld   (iy+$00),$00
2496: 21 05 96    ld   hl,$9605
2499: 35          dec  (hl)
249A: C9          ret

249B: CD BD 5C    call $5CBD
249E: DD 36 00 1F ld   (ix+$00),$1F
24A2: 3A 10 96    ld   a,($9610)
24A5: FE 03       cp   $03
24A7: D0          ret  nc
24A8: DD E5       push ix
24AA: C1          pop  bc
24AB: FD E5       push iy
24AD: D1          pop  de
24AE: 21 10 96    ld   hl,$9610
24B1: 7E          ld   a,(hl)
24B2: 34          inc  (hl)
24B3: 87          add  a,a
24B4: 87          add  a,a
24B5: 21 11 96    ld   hl,$9611
24B8: 85          add  a,l
24B9: 6F          ld   l,a
24BA: 71          ld   (hl),c
24BB: 2C          inc  l
24BC: 70          ld   (hl),b
24BD: 2C          inc  l
24BE: 73          ld   (hl),e
24BF: 2C          inc  l
24C0: 72          ld   (hl),d
24C1: C9          ret

24C2: 3A 00 94    ld   a,($9400)
24C5: E6 01       and  $01
24C7: C0          ret  nz
24C8: 21 65 94    ld   hl,$9465
24CB: 35          dec  (hl)
24CC: C0          ret  nz
24CD: 01 02 00    ld   bc,$0002
24D0: 21 00 05    ld   hl,$0500
24D3: 97          sub  a
24D4: AE          xor  (hl)
24D5: 23          inc  hl
24D6: 10 FC       djnz $24D4
24D8: 0D          dec  c
24D9: 20 F9       jr   nz,$24D4
24DB: C6 D3       add  a,$D3
24DD: C2 FF 07    jp   nz,$07FF
24E0: 3A 08 08    ld   a,($0808)
24E3: 47          ld   b,a
24E4: 3A 7B 86    ld   a,($867B)
24E7: FE B1       cp   $B1
24E9: 20 01       jr   nz,$24EC
24EB: 04          inc  b
24EC: 78          ld   a,b
24ED: 32 FF A7    ld   ($A7FF),a
24F0: CD 92 4E    call $4E92
24F3: 11 02 03    ld   de,$0302
24F6: FF          rst  $38
24F7: 1C          inc  e
24F8: FF          rst  $38
24F9: C3 0B 08    jp   $080B

24FC: 26 00       ld   h,$00
24FE: DD 7E 09    ld   a,(ix+$09)
2501: 6F          ld   l,a
2502: 11 B0 90    ld   de,$90B0
2505: 29          add  hl,hl
2506: 29          add  hl,hl
2507: 29          add  hl,hl
2508: 29          add  hl,hl
2509: 19          add  hl,de
250A: 44          ld   b,h
250B: 4D          ld   c,l
250C: 6F          ld   l,a
250D: 26 00       ld   h,$00
250F: 11 60 98    ld   de,$9860
2512: 29          add  hl,hl
2513: 29          add  hl,hl
2514: 19          add  hl,de
2515: EB          ex   de,hl
2516: 18 96       jr   $24AE

2518: DD 7E 00    ld   a,(ix+$00)
251B: A7          and  a
251C: C8          ret  z
251D: 21 2E 92    ld   hl,$922E
2520: 34          inc  (hl)
2521: 3C          inc  a
2522: 28 19       jr   z,$253D
2524: 3C          inc  a
2525: 28 03       jr   z,$252A
2527: C2 2B 2A    jp   nz,$2A2B
252A: DD 7E 0A    ld   a,(ix+$0a)
252D: FE 07       cp   $07
252F: CA 3A 46    jp   z,$463A
2532: FE 08       cp   $08
2534: CA 13 47    jp   z,$4713
2537: FE 00       cp   $00    ; [uncovered] 
2539: CA BE 26    jp   z,$26BE    ; [uncovered] 
253C: C9          ret    ; [uncovered] 

253D: DD 7E 0A    ld   a,(ix+$0a)
2540: F7          rst  $30

255B: CD 0E 59    call $590E
255E: CD 04 38    call $3804
2561: CD 2C 12    call $122C
2564: A7          and  a
2565: 20 06       jr   nz,$256D
2567: CD 57 18    call $1857
256A: CD 30 1F    call $1F30
256D: CD F3 22    call $22F3
2570: CD AC 25    call $25AC
2573: 3A 00 94    ld   a,($9400)
2576: E6 03       and  $03
2578: C8          ret  z
2579: 21 65 94    ld   hl,$9465
257C: 35          dec  (hl)
257D: C0          ret  nz
257E: 11 09 03    ld   de,$0309
2581: FF          rst  $38
2582: 11 2C 03    ld   de,$032C
2585: FF          rst  $38
2586: 11 26 03    ld   de,$0326
2589: FF          rst  $38
258A: 11 1C 03    ld   de,$031C
258D: FF          rst  $38
258E: 06 00       ld   b,$00
2590: 21 C0 0B    ld   hl,$0BC0
2593: 78          ld   a,b
2594: 86          add  a,(hl)
2595: 23          inc  hl
2596: 10 FC       djnz $2594
2598: D6 31       sub  $31
259A: C4 00 00    call nz,$0000
259D: AF          xor  a
259E: 32 0C 96    ld   ($960C),a
25A1: 3E 2A       ld   a,$2A
25A3: 32 65 94    ld   ($9465),a
25A6: CD 82 5C    call $5C82
25A9: C3 0B 08    jp   $080B

25AC: 3A 09 96    ld   a,($9609)
25AF: C6 01       add  a,$01
25B1: E6 03       and  $03
25B3: 87          add  a,a
25B4: 87          add  a,a
25B5: 21 CF 25    ld   hl,$25CF
25B8: DF          rst  $18
25B9: 3A 00 94    ld   a,($9400)
25BC: 0F          rrca
25BD: 0F          rrca
25BE: 0F          rrca
25BF: E6 03       and  $03
25C1: CF          rst  $08
25C2: 21 34 83    ld   hl,$8334
25C5: 11 E0 FF    ld   de,$FFE0
25C8: 06 16       ld   b,$16
25CA: 77          ld   (hl),a
25CB: 19          add  hl,de
25CC: 10 FC       djnz $25CA
25CE: C9          ret

25F3: CD CB 4E    call $4ECB
25F6: CD 81 2D    call $2D81
25F9: FD 7E 00    ld   a,(iy+$00)
25FC: FE 34       cp   $34
25FE: 38 03       jr   c,$2603
2600: C3 42 27    jp   $2742

2603: DD 36 05 10 ld   (ix+$05),$10
2607: DD 36 0A 0C ld   (ix+$0a),$0C
260B: 3A 00 90    ld   a,($9000)
260E: FD 96 03    sub  (iy+$03)
2611: FE 80       cp   $80
2613: 28 05       jr   z,$261A
2615: DD 36 07 00 ld   (ix+$07),$00
2619: C9          ret

261F: CD CB 4E    call $4ECB
2622: CD B3 2B    call $2BB3
2625: CD 81 2D    call $2D81
2628: DD 7E 05    ld   a,(ix+$05)
262B: A7          and  a
262C: CA 44 26    jp   z,$2644
262F: DD 35 05    dec  (ix+$05)
2632: 06 08       ld   b,$08
2634: DD CB 07 46 bit  0,(ix+$07)
2638: 20 02       jr   nz,$263C
263A: 06 F8       ld   b,$F8
263C: DD 7E 01    ld   a,(ix+$01)
263F: 80          add  a,b
2640: DD 77 01    ld   (ix+$01),a
2643: C9          ret

2644: FD 7E 00    ld   a,(iy+$00)
2647: FE A0       cp   $A0
2649: D8          ret  c
264A: C3 A5 26    jp   $26A5

264D: DD 36 05 80 ld   (ix+$05),$80
2651: DD 7E 01    ld   a,(ix+$01)
2654: C6 40       add  a,$40
2656: 07          rlca
2657: E6 01       and  $01
2659: DD 77 07    ld   (ix+$07),a
265C: DD 36 0A 0A ld   (ix+$0a),$0A
2660: C9          ret

2661: DD 35 05    dec  (ix+$05)
2664: CA 83 26    jp   z,$2683
2667: DD CB 07 46 bit  0,(ix+$07)
266B: 3A 20 01    ld   a,($0120)
266E: 47          ld   b,a
266F: 28 02       jr   z,$2673
2671: 06 FE       ld   b,$FE
2673: DD 7E 01    ld   a,(ix+$01)
2676: 80          add  a,b
2677: DD 77 01    ld   (ix+$01),a
267A: CD CB 4E    call $4ECB
267D: CD B3 2B    call $2BB3
2680: C3 81 2D    jp   $2D81

2683: DD 7E 09    ld   a,(ix+$09)
2686: 0F          rrca
2687: 0F          rrca
2688: E6 0F       and  $0F
268A: F7          rst  $30

26A5: 3A 1E 93    ld   a,($931E)
26A8: 1E 93       cp   $02
26AA: D2 6F 29    jp   nc,$296F
26AD: 3A EE 91    ld   a,($91EE)
26B0: A7          and  a
26B1: C2 6F 29    jp   nz,$296F
26B4: DD 36 0A 02 ld   (ix+$0a),$02
26B8: C9          ret

26B9: DD 36 0A 03 ld   (ix+$0a),$03
26BD: C9          ret

26BE: 3A 00 90    ld   a,($9000)
26C1: 3C          inc  a
26C2: 20 04       jr   nz,$26C8
26C4: DD 35 08    dec  (ix+$08)
26C7: C0          ret  nz
26C8: DD 36 0A 01 ld   (ix+$0a),$01
26CC: C3 EF 26    jp   $26EF

26CF: 3A 00 90    ld   a,($9000)
26D2: 3C          inc  a
26D3: 20 47       jr   nz,$271C
26D5: DD 7E 07    ld   a,(ix+$07)
26D8: A7          and  a
26D9: CC EF 26    call z,$26EF
26DC: DD 35 07    dec  (ix+$07)
26DF: CD 16 4F    call $4F16
26E2: CD B3 2B    call $2BB3
26E5: 3A AE 91    ld   a,($91AE)
26E8: A7          and  a
26E9: CA 81 2D    jp   z,$2D81
26EC: C3 71 31    jp   $3171

26EF: DD 7E 05    ld   a,(ix+$05)
26F2: 4F          ld   c,a
26F3: 21 7E 57    ld   hl,$577E
26F6: E6 7F       and  $7F
26F8: D7          rst  $10
26F9: EB          ex   de,hl
26FA: DD 7E 06    ld   a,(ix+$06)
26FD: 87          add  a,a
26FE: CF          rst  $08
26FF: FE FF       cp   $FF
2701: 28 19       jr   z,$271C
2703: FE FE       cp   $FE
2705: 28 25       jr   z,$272C
2707: CB 79       bit  7,c
2709: 28 05       jr   z,$2710
270B: 47          ld   b,a
270C: 3A 6D 00    ld   a,($006D)
270F: 90          sub  b
2710: DD 77 01    ld   (ix+$01),a
2713: 23          inc  hl
2714: 7E          ld   a,(hl)
2715: DD 77 07    ld   (ix+$07),a
2718: DD 34 06    inc  (ix+$06)
271B: C9          ret

271C: 3A AE 91    ld   a,($91AE)
271F: A7          and  a
2720: 20 05       jr   nz,$2727
2722: DD 36 0A 02 ld   (ix+$0a),$02
2726: C9          ret

2727: DD 36 0A 04 ld   (ix+$0a),$04
272B: C9          ret

272C: DD 36 0A 05 ld   (ix+$0a),$05
2730: DD 36 0B C0 ld   (ix+$0b),$C0
2734: C9          ret

2735: CD CB 4E    call $4ECB
2738: CD 81 2D    call $2D81
273B: FD 7E 00    ld   a,(iy+$00)
273E: FE 88       cp   $88
2740: 30 14       jr   nc,$2756
2742: DD 7E 01    ld   a,(ix+$01)
2745: D6 BE       sub  $BE
2747: FE 02       cp   $02
2749: D8          ret  c
274A: FE 80       cp   $80
274C: 30 04       jr   nc,$2752
274E: DD 35 01    dec  (ix+$01)
2751: C9          ret

2752: DD 34 01    inc  (ix+$01)
2755: C9          ret

2756: DD 36 0A 06 ld   (ix+$0a),$06
275A: C9          ret

275B: CD 81 2D    call $2D81
275E: CD B3 2B    call $2BB3
2761: CD 16 4F    call $4F16
2764: 3A 00 94    ld   a,($9400)
2767: E6 03       and  $03
2769: 47          ld   b,a
276A: DD 7E 0F    ld   a,(ix+$0f)
276D: E6 03       and  $03
276F: B8          cp   b
2770: C0          ret  nz
2771: DD 7E 0C    ld   a,(ix+$0c)
2774: 47          ld   b,a
2775: 3A 75 94    ld   a,($9475)
2778: 80          add  a,b
2779: 67          ld   h,a
277A: DD 7E 0D    ld   a,(ix+$0d)
277D: 47          ld   b,a
277E: 3A 76 94    ld   a,($9476)
2781: 80          add  a,b
2782: 6F          ld   l,a
2783: CD 01 40    call $4001
2786: DD 77 01    ld   (ix+$01),a
2789: DD 7E 0D    ld   a,(ix+$0d)
278C: 47          ld   b,a
278D: 3A 76 94    ld   a,($9476)
2790: 80          add  a,b
2791: 47          ld   b,a
2792: FD 7E 00    ld   a,(iy+$00)
2795: 90          sub  b
2796: C6 06       add  a,$06
2798: FE 0D       cp   $0D
279A: D0          ret  nc
279B: DD 7E 0C    ld   a,(ix+$0c)
279E: 47          ld   b,a
279F: 3A 75 94    ld   a,($9475)
27A2: 80          add  a,b
27A3: 47          ld   b,a
27A4: FD 7E 03    ld   a,(iy+$03)
27A7: 90          sub  b
27A8: C6 06       add  a,$06
27AA: FE 0D       cp   $0D
27AC: D0          ret  nc
27AD: 3A 76 94    ld   a,($9476)
27B0: DD 86 0D    add  a,(ix+$0d)
27B3: FD 77 00    ld   (iy+$00),a
27B6: 3A 75 94    ld   a,($9475)
27B9: DD 86 0C    add  a,(ix+$0c)
27BC: FD 77 03    ld   (iy+$03),a
27BF: DD 36 01 40 ld   (ix+$01),$40
27C3: 26 00       ld   h,$00
27C5: DD 6E 09    ld   l,(ix+$09)
27C8: 11 B0 90    ld   de,$90B0
27CB: 29          add  hl,hl
27CC: 29          add  hl,hl
27CD: 29          add  hl,hl
27CE: 29          add  hl,hl
27CF: 19          add  hl,de
27D0: 36 FF       ld   (hl),$FF
27D2: 23          inc  hl
27D3: 36 40       ld   (hl),$40
27D5: 11 08 00    ld   de,$0008
27D8: 19          add  hl,de
27D9: DD 7E 09    ld   a,(ix+$09)
27DC: 77          ld   (hl),a
27DD: 11 03 00    ld   de,$0003
27E0: 19          add  hl,de
27E1: DD 7E 0C    ld   a,(ix+$0c)
27E4: 77          ld   (hl),a
27E5: 2C          inc  l
27E6: DD 7E 0D    ld   a,(ix+$0d)
27E9: 77          ld   (hl),a
27EA: 11 60 98    ld   de,$9860
27ED: DD 6E 09    ld   l,(ix+$09)
27F0: 26 00       ld   h,$00
27F2: 29          add  hl,hl
27F3: 29          add  hl,hl
27F4: 19          add  hl,de
27F5: EB          ex   de,hl
27F6: FD E5       push iy
27F8: E1          pop  hl
27F9: ED A0       ldi
27FB: ED A0       ldi
27FD: ED A0       ldi
27FF: ED A0       ldi
2801: DD 36 00 00 ld   (ix+$00),$00
2805: FD 36 00 00 ld   (iy+$00),$00
2809: C9          ret

280A: 3A 00 90    ld   a,($9000)
280D: 3C          inc  a
280E: C2 5D 29    jp   nz,$295D
2811: 3A 4E 92    ld   a,($924E)
2814: A7          and  a
2815: 28 0C       jr   z,$2823
2817: DD 7E 0F    ld   a,(ix+$0f)    ; [uncovered] 
281A: FE 07       cp   $07    ; [uncovered] 
281C: 38 05       jr   c,$2823    ; [uncovered] 
281E: FE 0A       cp   $0A    ; [uncovered] 
2820: DA 5D 29    jp   c,$295D    ; [uncovered] 
2823: 21 CB 4E    ld   hl,$4ECB
2826: E5          push hl
2827: 21 B3 2B    ld   hl,$2BB3
282A: E5          push hl
282B: DD 7E 09    ld   a,(ix+$09)
282E: 0F          rrca
282F: 0F          rrca
2830: E6 0F       and  $0F
2832: F7          rst  $30

2845: FD 7E 00    ld   a,(iy+$00)
2848: FE 38       cp   $38
284A: DA 6C 28    jp   c,$286C
284D: DD CB 06 46 bit  0,(ix+$06)
2851: CC 58 28    call z,$2858
2854: CD 81 2D    call $2D81
2857: C9          ret

2858: 3A F3 57    ld   a,($57F3)
285B: DD CB 0F 46 bit  0,(ix+$0f)
285F: 28 03       jr   z,$2864
2861: 3A BD 09    ld   a,($09BD)
2864: DD 77 01    ld   (ix+$01),a
2867: DD CB 06 C6 set  0,(ix+$06)
286B: C9          ret

286C: 3A 01 90    ld   a,($9001)
286F: FD 96 03    sub  (iy+$03)
2872: C6 30       add  a,$30
2874: FE 61       cp   $61
2876: DA 4D 26    jp   c,$264D
2879: C3 A5 26    jp   $26A5

287C: DD CB 06 46 bit  0,(ix+$06)
2880: CC 95 28    call z,$2895
2883: FD 7E 00    ld   a,(iy+$00)
2886: FE 40       cp   $40
2888: DA A5 26    jp   c,$26A5
288B: DD BE 07    cp   (ix+$07)
288E: DC 20 29    call c,$2920
2891: CD 81 2D    call $2D81
2894: C9          ret

2895: 3A 0A 90    ld   a,($900A)
2898: 67          ld   h,a
2899: 2E B0       ld   l,$B0
289B: CD 01 40    call $4001
289E: DD 77 01    ld   (ix+$01),a
28A1: DD CB 06 C6 set  0,(ix+$06)
28A5: DD 36 07 B0 ld   (ix+$07),$B0
28A9: DD 36 0B 00 ld   (ix+$0b),$00
28AD: C9          ret

28AE: DD CB 06 46 bit  0,(ix+$06)
28B2: CC C6 28    call z,$28C6
28B5: FD 7E 00    ld   a,(iy+$00)
28B8: FE 48       cp   $48
28BA: DA A5 26    jp   c,$26A5
28BD: DD BE 04    cp   (ix+$04)
28C0: 38 1C       jr   c,$28DE
28C2: CD 81 2D    call $2D81
28C5: C9          ret

28C6: DD 36 04 90 ld   (ix+$04),$90
28CA: DD CB 06 C6 set  0,(ix+$06)
28CE: 3A 01 90    ld   a,($9001)
28D1: FD 96 03    sub  (iy+$03)
28D4: CB 2F       sra  a
28D6: CB 2F       sra  a
28D8: C6 C0       add  a,$C0
28DA: DD 77 01    ld   (ix+$01),a
28DD: C9          ret

28DE: DD 7E 04    ld   a,(ix+$04)
28E1: D6 28       sub  $28
28E3: DD 77 04    ld   (ix+$04),a
28E6: C3 4D 26    jp   $264D

28E9: DD CB 06 46 bit  0,(ix+$06)
28ED: CC 07 29    call z,$2907
28F0: FD 7E 00    ld   a,(iy+$00)
28F3: FE 4C       cp   $4C
28F5: DA 02 29    jp   c,$2902
28F8: DD BE 07    cp   (ix+$07)
28FB: DC 20 29    call c,$2920
28FE: CD 81 2D    call $2D81
2901: C9          ret

2902: DD 36 0A 0B ld   (ix+$0a),$0B
2906: C9          ret

2907: 3A 06 90    ld   a,($9006)
290A: 67          ld   h,a
290B: 2E 98       ld   l,$98
290D: CD 01 40    call $4001
2910: DD 77 01    ld   (ix+$01),a
2913: DD CB 06 C6 set  0,(ix+$06)
2917: DD 36 07 98 ld   (ix+$07),$98
291B: DD 36 0B 00 ld   (ix+$0b),$00
291F: C9          ret

2920: DD 7E 07    ld   a,(ix+$07)
2923: D6 14       sub  $14
2925: DD 77 07    ld   (ix+$07),a
2928: 6F          ld   l,a
2929: DD 34 0B    inc  (ix+$0b)
292C: 11 06 90    ld   de,$9006
292F: DD CB 0B 46 bit  0,(ix+$0b)
2933: 28 01       jr   z,$2936
2935: 1C          inc  e
2936: 1C          inc  e
2937: DD CB 0F 46 bit  0,(ix+$0f)
293B: 28 01       jr   z,$293E
293D: 1C          inc  e
293E: 1A          ld   a,(de)
293F: 67          ld   h,a
2940: CD 01 40    call $4001
2943: 47          ld   b,a
2944: FD 7E 00    ld   a,(iy+$00)
2947: FE 50       cp   $50
2949: 30 0E       jr   nc,$2959
294B: D6 A0       sub  $A0
294D: FE 40       cp   $40
294F: 38 08       jr   c,$2959
2951: 06 E0       ld   b,$E0
2953: FE 70       cp   $70
2955: 38 02       jr   c,$2959
2957: 06 A0       ld   b,$A0
2959: DD 70 01    ld   (ix+$01),b
295C: C9          ret

295D: 3A 1E 93    ld   a,($931E)
2960: FE 02       cp   $02
2962: 30 0B       jr   nc,$296F
2964: 3A EE 91    ld   a,($91EE)
2967: A7          and  a
2968: 20 05       jr   nz,$296F
296A: DD 36 0A 02 ld   (ix+$0a),$02
296E: C9          ret

2978: CD 16 4F    call $4F16
297B: CD B3 2B    call $2BB3
297E: CD 96 29    call $2996
2981: FD 7E 00    ld   a,(iy+$00)
2984: C6 08       add  a,$08
2986: FE 10       cp   $10
2988: D0          ret  nc
2989: FD 36 00 00 ld   (iy+$00),$00
298D: DD 36 00 00 ld   (ix+$00),$00
2991: 21 05 96    ld   hl,$9605
2994: 35          dec  (hl)
2995: C9          ret

2996: DD 7E 09    ld   a,(ix+$09)
2999: FE 28       cp   $28
299B: CA C4 30    jp   z,$30C4
299E: D2 4B 30    jp   nc,$304B
29A1: 3A AE 91    ld   a,($91AE)
29A4: A7          and  a
29A5: CA 81 2D    jp   z,$2D81
29A8: C3 71 31    jp   $3171

29AB: 3A 4E 92    ld   a,($924E)
29AE: A7          and  a
29AF: 28 0C       jr   z,$29BD
29B1: DD 7E 0F    ld   a,(ix+$0f)    ; [uncovered] 
29B4: FE 07       cp   $07    ; [uncovered] 
29B6: 38 05       jr   c,$29BD    ; [uncovered] 
29B8: FE 0A       cp   $0A    ; [uncovered] 
29BA: DA 5D 29    jp   c,$295D    ; [uncovered] 
29BD: CD CB 4E    call $4ECB
29C0: CD 5C 2D    call $2D5C
29C3: CD B3 2B    call $2BB3
29C6: 3A 0E 92    ld   a,($920E)
29C9: 47          ld   b,a
29CA: FD 7E 00    ld   a,(iy+$00)
29CD: B8          cp   b
29CE: DA 5D 29    jp   c,$295D
29D1: FD 7E 00    ld   a,(iy+$00)
29D4: FE 90       cp   $90
29D6: 30 2F       jr   nc,$2A07
29D8: CD 0E 2A    call $2A0E
29DB: DD 46 0B    ld   b,(ix+$0b)
29DE: DD 7E 01    ld   a,(ix+$01)
29E1: 90          sub  b
29E2: C8          ret  z
29E3: C6 02       add  a,$02
29E5: FE 05       cp   $05
29E7: DA 00 2A    jp   c,$2A00
29EA: FE 80       cp   $80
29EC: 30 09       jr   nc,$29F7
29EE: DD 7E 01    ld   a,(ix+$01)
29F1: D6 04       sub  $04
29F3: DD 77 01    ld   (ix+$01),a
29F6: C9          ret

29F7: DD 7E 01    ld   a,(ix+$01)
29FA: C6 04       add  a,$04
29FC: DD 77 01    ld   (ix+$01),a
29FF: C9          ret

2A00: DD 7E 0B    ld   a,(ix+$0b)
2A03: DD 77 01    ld   (ix+$01),a
2A06: C9          ret

2A07: DD 36 0B C0 ld   (ix+$0b),$C0
2A0B: C3 DB 29    jp   $29DB

2A0E: 3A 00 94    ld   a,($9400)
2A11: E6 07       and  $07
2A13: 47          ld   b,a
2A14: DD 7E 0F    ld   a,(ix+$0f)
2A17: E6 07       and  $07
2A19: B8          cp   b
2A1A: C0          ret  nz
2A1B: 3A 01 90    ld   a,($9001)
2A1E: 67          ld   h,a
2A1F: 2E 28       ld   l,$28
2A21: CD 01 40    call $4001
2A24: DD 7E 04    ld   a,(ix+$04)
2A27: DD 77 0B    ld   (ix+$0b),a
2A2A: C9          ret

2A2B: DD 7E 00    ld   a,(ix+$00)
2A2E: FE F0       cp   $F0
2A30: CA 4A 2B    jp   z,$2B4A
2A33: FE 01       cp   $01
2A35: CA 4B 2A    jp   z,$2A4B
2A38: 3D          dec  a
2A39: DD 77 00    ld   (ix+$00),a
2A3C: FD 7E 02    ld   a,(iy+$02)
2A3F: FE 48       cp   $48
2A41: C8          ret  z
2A42: FE 88       cp   $88
2A44: C8          ret  z
2A45: CD 1B 31    call $311B
2A48: C3 41 2B    jp   $2B41

2A4B: FD 7E 02    ld   a,(iy+$02)
2A4E: FE 48       cp   $48
2A50: 28 1D       jr   z,$2A6F
2A52: FE 88       cp   $88
2A54: 28 19       jr   z,$2A6F
2A56: 3A 01 96    ld   a,($9601)
2A59: A7          and  a
2A5A: 20 22       jr   nz,$2A7E
2A5C: DD 7E 09    ld   a,(ix+$09)
2A5F: FE 28       cp   $28
2A61: CA F9 2A    jp   z,$2AF9
2A64: FE 2C       cp   $2C
2A66: CA 03 2B    jp   z,$2B03
2A69: 3A 05 96    ld   a,($9605)
2A6C: 3D          dec  a
2A6D: 28 7C       jr   z,$2AEB
2A6F: AF          xor  a
2A70: DD 77 00    ld   (ix+$00),a
2A73: FD 77 00    ld   (iy+$00),a
2A76: FD 77 04    ld   (iy+$04),a
2A79: 21 05 96    ld   hl,$9605
2A7C: 35          dec  (hl)
2A7D: C9          ret

2A7E: 21 FE 91    ld   hl,$91FE
2A81: 35          dec  (hl)
2A82: 20 EB       jr   nz,$2A6F
2A84: CD 86 5D    call $5D86
2A87: 3A AE 91    ld   a,($91AE)
2A8A: A7          and  a
2A8B: 20 30       jr   nz,$2ABD
2A8D: 16 04       ld   d,$04    ; [uncovered] 
2A8F: 21 5D 93    ld   hl,$935D    ; [uncovered] 
2A92: 7E          ld   a,(hl)    ; [uncovered] 
2A93: 34          inc  (hl)    ; [uncovered] 
2A94: 21 A5 2A    ld   hl,$2AA5    ; [uncovered] 
2A97: 87          add  a,a    ; [uncovered] 
2A98: CF          rst  $08    ; [uncovered] 
2A99: DD 36 00 20 ld   (ix+$00),$20    ; [uncovered] 
2A9D: FD 77 01    ld   (iy+$01),a    ; [uncovered] 
2AA0: 23          inc  hl    ; [uncovered] 
2AA1: 5E          ld   e,(hl)    ; [uncovered] 
2AA2: C3 2C 2B    jp   $2B2C    ; [uncovered] 

2ABD: 3A 0B 96    ld   a,($960B)
2AC0: 0F          rrca
2AC1: 0F          rrca
2AC2: E6 3F       and  $3F
2AC4: 87          add  a,a
2AC5: 21 D3 2A    ld   hl,$2AD3
2AC8: CF          rst  $08
2AC9: FD 77 01    ld   (iy+$01),a
2ACC: 23          inc  hl
2ACD: 5E          ld   e,(hl)
2ACE: 16 04       ld   d,$04
2AD0: C3 2C 2B    jp   $2B2C

2AEB: FD 36 01 2B ld   (iy+$01),$2B
2AEF: DD 36 00 3C ld   (ix+$00),$3C
2AF3: 11 0B 04    ld   de,$040B
2AF6: C3 2C 2B    jp   $2B2C

2AF9: FD 36 01 2A ld   (iy+$01),$2A
2AFD: 11 06 04    ld   de,$0406
2B00: C3 2C 2B    jp   $2B2C

2B03: 21 8E 92    ld   hl,$928E
2B06: 7E          ld   a,(hl)
2B07: 34          inc  (hl)
2B08: 47          ld   b,a
2B09: 3A 0E 93    ld   a,($930E)
2B0C: A7          and  a
2B0D: 28 03       jr   z,$2B12
2B0F: 3A 24 01    ld   a,($0124)
2B12: 80          add  a,b
2B13: 87          add  a,a
2B14: 21 22 2B    ld   hl,$2B22
2B17: CF          rst  $08
2B18: FD 77 01    ld   (iy+$01),a
2B1B: 23          inc  hl
2B1C: 5E          ld   e,(hl)
2B1D: 16 04       ld   d,$04
2B1F: C3 2C 2B    jp   $2B2C

2B2C: DD 36 00 20 ld   (ix+$00),$20
2B30: FF          rst  $38
2B31: 3A 07 94    ld   a,($9407)
2B34: A7          and  a
2B35: 20 05       jr   nz,$2B3C
2B37: FD 36 02 48 ld   (iy+$02),$48
2B3B: C9          ret

2B41: 3A 00 94    ld   a,($9400)
2B44: E6 01       and  $01
2B46: C8          ret  z
2B47: C3 CB 4E    jp   $4ECB

2B4A: CD 96 2B    call $2B96
2B4D: DD 36 00 1F ld   (ix+$00),$1F
2B51: 3A 10 96    ld   a,($9610)
2B54: FE 03       cp   $03
2B56: DC FC 24    call c,$24FC
2B59: 3A AE 91    ld   a,($91AE)
2B5C: A7          and  a
2B5D: 28 0A       jr   z,$2B69
2B5F: 21 7E 91    ld   hl,$917E
2B62: 3A 96 09    ld   a,($0996)
2B65: 86          add  a,(hl)
2B66: 27          daa
2B67: 77          ld   (hl),a
2B68: C9          ret

2B69: DD 7E 09    ld   a,(ix+$09)
2B6C: FE 28       cp   $28
2B6E: C0          ret  nz
2B6F: 3A F0 92    ld   a,($92F0)
2B72: A7          and  a
2B73: C0          ret  nz
2B74: FD 7E 00    ld   a,(iy+$00)
2B77: 32 04 99    ld   ($9904),a
2B7A: 32 0C 99    ld   ($990C),a
2B7D: FD 7E 03    ld   a,(iy+$03)
2B80: C6 03       add  a,$03
2B82: 32 07 99    ld   ($9907),a
2B85: D6 06       sub  $06
2B87: 32 0F 99    ld   ($990F),a
2B8A: AF          xor  a
2B8B: 32 F1 92    ld   ($92F1),a
2B8E: 3D          dec  a
2B8F: 32 F0 92    ld   ($92F0),a
2B92: C3 62 5D    jp   $5D62

2B96: 3A AE 91    ld   a,($91AE)
2B99: A7          and  a
2B9A: C2 A8 2B    jp   nz,$2BA8
2B9D: DD 7E 09    ld   a,(ix+$09)
2BA0: FE 28       cp   $28
2BA2: DA B2 5C    jp   c,$5CB2
2BA5: C3 45 5D    jp   $5D45

2BA8: 3A 0D 96    ld   a,($960D)
2BAB: CB 47       bit  0,a
2BAD: C2 45 5D    jp   nz,$5D45
2BB0: C3 B2 5C    jp   $5CB2

2BB3: 3A 00 94    ld   a,($9400)
2BB6: E6 0F       and  $0F
2BB8: 47          ld   b,a
2BB9: DD 7E 0F    ld   a,(ix+$0f)
2BBC: E6 0F       and  $0F
2BBE: B8          cp   b
2BBF: C0          ret  nz
2BC0: 3A 9E 93    ld   a,($939E)
2BC3: A7          and  a
2BC4: C8          ret  z
2BC5: 3A 00 90    ld   a,($9000)
2BC8: 3C          inc  a
2BC9: C0          ret  nz
2BCA: 3A AE 91    ld   a,($91AE)
2BCD: A7          and  a
2BCE: C0          ret  nz
2BCF: 3A BE 90    ld   a,($90BE)
2BD2: A7          and  a
2BD3: C0          ret  nz
2BD4: 3A AE 92    ld   a,($92AE)
2BD7: 47          ld   b,a
2BD8: 87          add  a,a
2BD9: 3C          inc  a
2BDA: 4F          ld   c,a
2BDB: 3A 3C 94    ld   a,($943C)
2BDE: E6 0F       and  $0F
2BE0: FE 0F       cp   $0F
2BE2: 20 05       jr   nz,$2BE9
2BE4: 3A 0D 90    ld   a,($900D)
2BE7: 18 03       jr   $2BEC

2BE9: 3A 01 90    ld   a,($9001)
2BEC: FD 96 03    sub  (iy+$03)
2BEF: 80          add  a,b
2BF0: B9          cp   c
2BF1: D0          ret  nc
2BF2: 3A 1E 91    ld   a,($911E)
2BF5: 47          ld   b,a
2BF6: 3A 44 94    ld   a,($9444)
2BF9: 87          add  a,a
2BFA: D6 06       sub  $06
2BFC: ED 44       neg
2BFE: 80          add  a,b
2BFF: FD 7E 00    ld   a,(iy+$00)
2C02: B8          cp   b
2C03: D8          ret  c
2C04: 3A 8E 90    ld   a,($908E)
2C07: A7          and  a
2C08: C8          ret  z
2C09: 47          ld   b,a
2C0A: 3A 05 96    ld   a,($9605)
2C0D: FE 21       cp   $21
2C0F: 38 0C       jr   c,$2C1D
2C11: D6 24       sub  $24    ; [uncovered] 
2C13: ED 44       neg    ; [uncovered] 
2C15: 87          add  a,a    ; [uncovered] 
2C16: C6 02       add  a,$02    ; [uncovered] 
2C18: 4F          ld   c,a    ; [uncovered] 
2C19: 90          sub  b    ; [uncovered] 
2C1A: 30 01       jr   nc,$2C1D    ; [uncovered] 
2C1C: 41          ld   b,c    ; [uncovered] 
2C1D: 78          ld   a,b
2C1E: 21 30 93    ld   hl,$9330
2C21: 11 10 00    ld   de,$0010
2C24: D9          exx
2C25: 21 18 99    ld   hl,$9918
2C28: 11 04 00    ld   de,$0004
2C2B: 47          ld   b,a
2C2C: D9          exx
2C2D: 7E          ld   a,(hl)
2C2E: A7          and  a
2C2F: 28 24       jr   z,$2C55
2C31: 19          add  hl,de
2C32: D9          exx
2C33: 19          add  hl,de
2C34: 10 F6       djnz $2C2C
2C36: C9          ret    ; [uncovered] 

2C55: FD 46 03    ld   b,(iy+$03)
2C58: DD 4E 02    ld   c,(ix+$02)
2C5B: FD 56 00    ld   d,(iy+$00)
2C5E: DD 5E 03    ld   e,(ix+$03)
2C61: DD E5       push ix
2C63: FD E5       push iy
2C65: E5          push hl
2C66: DD E1       pop  ix
2C68: D9          exx
2C69: E5          push hl
2C6A: FD E1       pop  iy
2C6C: D9          exx
2C6D: FD 70 03    ld   (iy+$03),b
2C70: DD 71 02    ld   (ix+$02),c
2C73: FD 72 00    ld   (iy+$00),d
2C76: DD 73 03    ld   (ix+$03),e
2C79: 3A 0A 96    ld   a,($960A)
2C7C: 87          add  a,a
2C7D: 21 74 44    ld   hl,$4474
2C80: CF          rst  $08
2C81: DD 77 08    ld   (ix+$08),a
2C84: 23          inc  hl
2C85: 7E          ld   a,(hl)
2C86: DD 77 07    ld   (ix+$07),a
2C89: FD 7E 00    ld   a,(iy+$00)
2C8C: 26 28       ld   h,$28
2C8E: 94          sub  h
2C8F: 67          ld   h,a
2C90: DD 6E 03    ld   l,(ix+$03)
2C93: 54          ld   d,h
2C94: 5D          ld   e,l
2C95: CB 3A       srl  d
2C97: CB 1B       rr   e
2C99: CB 3A       srl  d
2C9B: CB 1B       rr   e
2C9D: A7          and  a
2C9E: ED 52       sbc  hl,de
2CA0: 3A 3C 94    ld   a,($943C)
2CA3: E6 0F       and  $0F
2CA5: FE 0F       cp   $0F
2CA7: 20 05       jr   nz,$2CAE
2CA9: 3A 0D 90    ld   a,($900D)
2CAC: 18 03       jr   $2CB1

2CAE: 3A 01 90    ld   a,($9001)
2CB1: 47          ld   b,a
2CB2: FD 96 03    sub  (iy+$03)
2CB5: C6 03       add  a,$03
2CB7: FE 07       cp   $07
2CB9: 38 59       jr   c,$2D14
2CBB: 78          ld   a,b
2CBC: 06 01       ld   b,$01
2CBE: FD 56 03    ld   d,(iy+$03)
2CC1: 1E 00       ld   e,$00
2CC3: 92          sub  d
2CC4: FE 80       cp   $80
2CC6: 38 04       jr   c,$2CCC
2CC8: ED 44       neg
2CCA: 06 FF       ld   b,$FF
2CCC: DD 70 04    ld   (ix+$04),b
2CCF: 57          ld   d,a
2CD0: AF          xor  a
2CD1: ED 52       sbc  hl,de
2CD3: 3C          inc  a
2CD4: 30 FB       jr   nc,$2CD1
2CD6: DD 77 05    ld   (ix+$05),a
2CD9: DD 77 09    ld   (ix+$09),a
2CDC: 29          add  hl,hl
2CDD: 29          add  hl,hl
2CDE: 29          add  hl,hl
2CDF: 29          add  hl,hl
2CE0: AF          xor  a
2CE1: ED 52       sbc  hl,de
2CE3: 3C          inc  a
2CE4: 30 FB       jr   nc,$2CE1
2CE6: DD 77 06    ld   (ix+$06),a
2CE9: DD 77 0A    ld   (ix+$0a),a
2CEC: 3A 5E 90    ld   a,($905E)
2CEF: 47          ld   b,a
2CF0: 3A 44 94    ld   a,($9444)
2CF3: 87          add  a,a
2CF4: D6 06       sub  $06
2CF6: ED 44       neg
2CF8: 80          add  a,b
2CF9: 32 BE 90    ld   ($90BE),a
2CFC: DD 36 00 FF ld   (ix+$00),$FF
2D00: DD 36 01 C0 ld   (ix+$01),$C0
2D04: CD 55 31    call $3155
2D07: FD E1       pop  iy
2D09: DD E1       pop  ix
2D0B: FD 7E 00    ld   a,(iy+$00)
2D0E: FE 90       cp   $90
2D10: DA AC 5C    jp   c,$5CAC
2D13: C9          ret

2D14: DD 36 05 00 ld   (ix+$05),$00
2D18: 18 E2       jr   $2CFC

2D1A: 3A 00 94    ld   a,($9400)
2D1D: E6 07       and  $07
2D1F: 47          ld   b,a
2D20: DD 7E 0F    ld   a,(ix+$0f)
2D23: E6 07       and  $07
2D25: B8          cp   b
2D26: C0          ret  nz
2D27: FD 7E 03    ld   a,(iy+$03)
2D2A: C6 08       add  a,$08
2D2C: 07          rlca
2D2D: 07          rlca
2D2E: 4F          ld   c,a
2D2F: E6 03       and  $03
2D31: 21 1F 32    ld   hl,$321F
2D34: CF          rst  $08
2D35: FD 77 02    ld   (iy+$02),a
2D38: FD 7E 00    ld   a,(iy+$00)
2D3B: 07          rlca
2D3C: 07          rlca
2D3D: 07          rlca
2D3E: E6 07       and  $07
2D40: 21 0D 32    ld   hl,$320D
2D43: D7          rst  $10
2D44: 79          ld   a,c
2D45: 07          rlca
2D46: 07          rlca
2D47: E6 07       and  $07
2D49: EB          ex   de,hl
2D4A: CF          rst  $08
2D4B: FD 77 01    ld   (iy+$01),a
2D4E: C9          ret

2D5C: 3A 00 94    ld   a,($9400)
2D5F: E6 07       and  $07
2D61: 47          ld   b,a
2D62: DD 7E 0F    ld   a,(ix+$0f)
2D65: E6 07       and  $07
2D67: B8          cp   b
2D68: C0          ret  nz
2D69: DD 7E 01    ld   a,(ix+$01)
2D6C: FE 80       cp   $80
2D6E: 38 1E       jr   c,$2D8E
2D70: FD 7E 00    ld   a,(iy+$00)
2D73: 0F          rrca
2D74: 0F          rrca
2D75: 0F          rrca
2D76: 0F          rrca
2D77: E6 0F       and  $0F
2D79: 21 E1 31    ld   hl,$31E1
2D7C: D7          rst  $10
2D7D: EB          ex   de,hl
2D7E: C3 B4 2D    jp   $2DB4

2D81: 3A 00 94    ld   a,($9400)
2D84: E6 07       and  $07
2D86: 47          ld   b,a
2D87: DD 7E 0F    ld   a,(ix+$0f)
2D8A: E6 07       and  $07
2D8C: B8          cp   b
2D8D: C0          ret  nz
2D8E: FD 7E 00    ld   a,(iy+$00)
2D91: 0F          rrca
2D92: 0F          rrca
2D93: 0F          rrca
2D94: 0F          rrca
2D95: E6 0F       and  $0F
2D97: 21 51 3B    ld   hl,$3B51
2D9A: D7          rst  $10
2D9B: D5          push de
2D9C: DD 7E 01    ld   a,(ix+$01)
2D9F: C6 08       add  a,$08
2DA1: 0F          rrca
2DA2: 0F          rrca
2DA3: 0F          rrca
2DA4: 0F          rrca
2DA5: E6 0E       and  $0E
2DA7: 21 71 3B    ld   hl,$3B71
2DAA: 85          add  a,l
2DAB: 6F          ld   l,a
2DAC: 30 01       jr   nc,$2DAF
2DAE: 24          inc  h    ; [uncovered] 
2DAF: 5E          ld   e,(hl)
2DB0: 23          inc  hl
2DB1: 56          ld   d,(hl)
2DB2: E1          pop  hl
2DB3: 19          add  hl,de
2DB4: FD 7E 03    ld   a,(iy+$03)
2DB7: C6 08       add  a,$08
2DB9: 4F          ld   c,a
2DBA: 07          rlca
2DBB: 07          rlca
2DBC: 07          rlca
2DBD: 07          rlca
2DBE: E6 07       and  $07
2DC0: 47          ld   b,a
2DC1: 87          add  a,a
2DC2: 80          add  a,b
2DC3: DF          rst  $18
2DC4: 79          ld   a,c
2DC5: FE 80       cp   $80
2DC7: D2 EA 2D    jp   nc,$2DEA
2DCA: 7E          ld   a,(hl)
2DCB: FD 77 01    ld   (iy+$01),a
2DCE: 23          inc  hl
2DCF: 7E          ld   a,(hl)
2DD0: FD 77 05    ld   (iy+$05),a
2DD3: 23          inc  hl
2DD4: 7E          ld   a,(hl)
2DD5: 47          ld   b,a
2DD6: DD 7E 09    ld   a,(ix+$09)
2DD9: 0F          rrca
2DDA: 0F          rrca
2DDB: E6 0F       and  $0F
2DDD: 21 01 32    ld   hl,$3201
2DE0: DF          rst  $18
2DE1: 78          ld   a,b
2DE2: 86          add  a,(hl)
2DE3: FD 77 02    ld   (iy+$02),a
2DE6: FD 77 06    ld   (iy+$06),a
2DE9: C9          ret

2DEA: 7E          ld   a,(hl)
2DEB: FD 77 05    ld   (iy+$05),a
2DEE: 23          inc  hl
2DEF: 7E          ld   a,(hl)
2DF0: FD 77 01    ld   (iy+$01),a
2DF3: 23          inc  hl
2DF4: 7E          ld   a,(hl)
2DF5: EE C0       xor  $C0
2DF7: 47          ld   b,a
2DF8: DD 7E 09    ld   a,(ix+$09)
2DFB: 0F          rrca
2DFC: 0F          rrca
2DFD: E6 0F       and  $0F
2DFF: 21 01 32    ld   hl,$3201
2E02: DF          rst  $18
2E03: 78          ld   a,b
2E04: 86          add  a,(hl)
2E05: FD 77 02    ld   (iy+$02),a
2E08: FD 77 06    ld   (iy+$06),a
2E0B: C9          ret

2E0C: CD D9 2F    call $2FD9
2E0F: C9          ret

2E10: CD 0E 59    call $590E
2E13: CD 04 38    call $3804
2E16: CD 57 18    call $1857
2E19: CD 30 1F    call $1F30
2E1C: CD F3 22    call $22F3
2E1F: 21 65 94    ld   hl,$9465
2E22: 35          dec  (hl)
2E23: C0          ret  nz
2E24: 21 8E 91    ld   hl,$918E
2E27: 36 02       ld   (hl),$02
2E29: CD 5D 2E    call $2E5D
2E2C: 21 50 15    ld   hl,$1550
2E2F: 06 00       ld   b,$00
2E31: AF          xor  a
2E32: 86          add  a,(hl)
2E33: 23          inc  hl
2E34: 10 FC       djnz $2E32
2E36: D6 8C       sub  $8C
2E38: C2 00 00    jp   nz,$0000
2E3B: AF          xor  a
2E3C: 32 AD 93    ld   ($93AD),a
2E3F: 32 4E 92    ld   ($924E),a
2E42: 32 BE 92    ld   ($92BE),a
2E45: 32 1E 93    ld   ($931E),a
2E48: 32 5E 93    ld   ($935E),a
2E4B: 32 EE 91    ld   ($91EE),a
2E4E: 32 5D 93    ld   ($935D),a
2E51: 32 0E 96    ld   ($960E),a
2E54: 32 3E 90    ld   ($903E),a
2E57: 32 78 94    ld   ($9478),a
2E5A: C3 0B 08    jp   $080B

2E5D: 21 0E 90    ld   hl,$900E
2E60: 36 00       ld   (hl),$00
2E62: 3A 01 96    ld   a,($9601)
2E65: A7          and  a
2E66: 20 01       jr   nz,$2E69
2E68: 34          inc  (hl)
2E69: C3 71 41    jp   $4171

2E8F: CD 07 02    call $0207
2E92: C0          ret  nz
2E93: CD 82 5C    call $5C82
2E96: 21 00 90    ld   hl,$9000
2E99: 11 01 90    ld   de,$9001
2E9C: 01 AF 03    ld   bc,$03AF
2E9F: 36 00       ld   (hl),$00
2EA1: ED B0       ldir
2EA3: CD CB 0E    call $0ECB
2EA6: 21 00 96    ld   hl,$9600
2EA9: 11 01 96    ld   de,$9601
2EAC: 01 1F 00    ld   bc,$001F
2EAF: 36 00       ld   (hl),$00
2EB1: ED B0       ldir
2EB3: AF          xor  a
2EB4: 32 00 94    ld   ($9400),a
2EB7: 32 76 94    ld   ($9476),a
2EBA: 32 75 94    ld   ($9475),a
2EBD: 32 78 94    ld   ($9478),a
2EC0: 32 3E 92    ld   ($923E),a
2EC3: CD 2E 17    call $172E
2EC6: 3A D6 09    ld   a,($09D6)
2EC9: 32 00 96    ld   ($9600),a
2ECC: 32 9E 92    ld   ($929E),a
2ECF: 3E 24       ld   a,$24
2ED1: 32 01 96    ld   ($9601),a
2ED4: 32 05 96    ld   ($9605),a
2ED7: 21 50 94    ld   hl,$9450
2EDA: 34          inc  (hl)
2EDB: 7E          ld   a,(hl)
2EDC: E6 01       and  $01
2EDE: 87          add  a,a
2EDF: 87          add  a,a
2EE0: 32 0A 96    ld   ($960A),a
2EE3: 87          add  a,a
2EE4: 32 09 96    ld   ($9609),a
2EE7: 32 0B 96    ld   ($960B),a
2EEA: AF          xor  a
2EEB: 32 76 94    ld   ($9476),a
2EEE: 32 FD A7    ld   ($A7FD),a
2EF1: 3E 03       ld   a,$03
2EF3: 32 44 94    ld   ($9444),a
2EF6: CD 71 41    call $4171
2EF9: 3A D7 06    ld   a,($06D7)
2EFC: 32 2C 94    ld   ($942C),a
2EFF: 3A 21 44    ld   a,($4421)
2F02: 32 2B 94    ld   ($942B),a
2F05: C9          ret

2F25: CB 79       bit  7,c
2F27: 20 10       jr   nz,$2F39
2F29: FD 77 01    ld   (iy+$01),a
2F2C: 3C          inc  a
2F2D: FD 77 05    ld   (iy+$05),a
2F30: 23          inc  hl
2F31: 7E          ld   a,(hl)
2F32: FD 77 02    ld   (iy+$02),a
2F35: FD 77 06    ld   (iy+$06),a
2F38: C9          ret

2F39: FD 77 05    ld   (iy+$05),a
2F3C: 3C          inc  a
2F3D: FD 77 01    ld   (iy+$01),a
2F40: 23          inc  hl
2F41: 7E          ld   a,(hl)
2F42: EE C0       xor  $C0
2F44: FD 77 02    ld   (iy+$02),a
2F47: FD 77 06    ld   (iy+$06),a
2F4A: CB 67       bit  4,a
2F4C: C0          ret  nz
2F4D: FD 7E 05    ld   a,(iy+$05)    ; [uncovered] 
2F50: FD 77 01    ld   (iy+$01),a    ; [uncovered] 
2F53: C9          ret    ; [uncovered] 

2F94: C9          ld   a,(iy+$00)
2F95: 7E          ld   a,(hl)    ; [uncovered] 
2F96: 00          nop    ; [uncovered] 
2F97: 07          rlca
2F98: 07          rlca
2F99: 07          rlca
2F9A: E6 07       and  $07
2F9C: 21 B0 2F    ld   hl,$2FB0
2F9F: D7          rst  $10
2FA0: FD 7E 03    ld   a,(iy+$03)
2FA3: C6 08       add  a,$08
2FA5: 4F          ld   c,a
2FA6: 0F          rrca
2FA7: 0F          rrca
2FA8: 0F          rrca
2FA9: E6 0E       and  $0E
2FAB: EB          ex   de,hl
2FAC: CF          rst  $08
2FAD: C3 25 2F    jp   $2F25

2FD9: FD 7E 00    ld   a,(iy+$00)
2FDC: C6 04       add  a,$04
2FDE: FE 09       cp   $09
2FE0: DA FF 2F    jp   c,$2FFF
2FE3: 3A 00 94    ld   a,($9400)
2FE6: 21 16 11    ld   hl,$1116
2FE9: CB 4F       bit  1,a
2FEB: 28 03       jr   z,$2FF0
2FED: 21 26 11    ld   hl,$1126
2FF0: FD 7E 03    ld   a,(iy+$03)
2FF3: C6 08       add  a,$08
2FF5: 4F          ld   c,a
2FF6: 0F          rrca
2FF7: 0F          rrca
2FF8: 0F          rrca
2FF9: E6 0E       and  $0E
2FFB: CF          rst  $08
2FFC: C3 25 2F    jp   $2F25

2FFF: FD 36 01 00 ld   (iy+$01),$00
3003: FD 36 05 00 ld   (iy+$05),$00
3007: FD 36 02 00 ld   (iy+$02),$00
300B: FD 36 06 00 ld   (iy+$06),$00
300F: C9          ret

3010: 21 00 98    ld   hl,$9800
3013: 11 01 98    ld   de,$9801
3016: 01 FF 07    ld   bc,$07FF
3019: 36 00       ld   (hl),$00
301B: ED B0       ldir
301D: 32 00 C0    ld   ($C000),a
3020: C3 D7 05    jp   $05D7

304B: CD 55 30    call $3055
304E: FD 34 02    inc  (iy+$02)
3051: FD 34 06    inc  (iy+$06)
3054: C9          ret

3055: 3A 00 94    ld   a,($9400)
3058: 0E 00       ld   c,$00
305A: CB 5F       bit  3,a
305C: 20 02       jr   nz,$3060
305E: 0E 0A       ld   c,$0A
3060: FD 7E 00    ld   a,(iy+$00)
3063: C6 04       add  a,$04
3065: FE 09       cp   $09
3067: DA FF 2F    jp   c,$2FFF
306A: FD 7E 03    ld   a,(iy+$03)
306D: C6 08       add  a,$08
306F: 47          ld   b,a
3070: 0F          rrca
3071: 0F          rrca
3072: 0F          rrca
3073: E6 0E       and  $0E
3075: 21 A1 30    ld   hl,$30A1
3078: CF          rst  $08
3079: CB 78       bit  7,b
307B: 20 11       jr   nz,$308E
307D: 81          add  a,c
307E: FD 77 01    ld   (iy+$01),a
3081: 3C          inc  a
3082: FD 77 05    ld   (iy+$05),a
3085: 23          inc  hl
3086: 7E          ld   a,(hl)
3087: FD 77 02    ld   (iy+$02),a
308A: FD 77 06    ld   (iy+$06),a
308D: C9          ret

308E: 81          add  a,c
308F: FD 77 05    ld   (iy+$05),a
3092: 3C          inc  a
3093: FD 77 01    ld   (iy+$01),a
3096: 23          inc  hl
3097: 7E          ld   a,(hl)
3098: EE C0       xor  $C0
309A: FD 77 02    ld   (iy+$02),a
309D: FD 77 06    ld   (iy+$06),a
30A0: C9          ret

30C4: 3A 00 94    ld   a,($9400)
30C7: E6 06       and  $06
30C9: C6 78       add  a,$78
30CB: FD 77 01    ld   (iy+$01),a
30CE: 3C          inc  a
30CF: FD 77 05    ld   (iy+$05),a
30D2: FD 36 02 F8 ld   (iy+$02),$F8
30D6: FD 36 06 F8 ld   (iy+$06),$F8
30DA: C9          ret

30DB: 3A 00 94    ld   a,($9400)
30DE: E6 07       and  $07
30E0: 47          ld   b,a
30E1: DD 7E 0F    ld   a,(ix+$0f)
30E4: E6 07       and  $07
30E6: B8          cp   b
30E7: C0          ret  nz
30E8: DD 7E 09    ld   a,(ix+$09)
30EB: 0F          rrca
30EC: 0F          rrca
30ED: E6 0F       and  $0F
30EF: 4F          ld   c,a
30F0: FD 7E 03    ld   a,(iy+$03)
30F3: C6 08       add  a,$08
30F5: 47          ld   b,a
30F6: 07          rlca
30F7: 07          rlca
30F8: 07          rlca
30F9: 07          rlca
30FA: E6 07       and  $07
30FC: 57          ld   d,a
30FD: 87          add  a,a
30FE: 82          add  a,d
30FF: 21 31 3D    ld   hl,$3D31
3102: CF          rst  $08
3103: FD 77 01    ld   (iy+$01),a
3106: 23          inc  hl
3107: 23          inc  hl
3108: 56          ld   d,(hl)
3109: CB 78       bit  7,b
310B: 28 04       jr   z,$3111
310D: 7A          ld   a,d
310E: EE C0       xor  $C0
3110: 57          ld   d,a
3111: 79          ld   a,c
3112: 21 01 32    ld   hl,$3201
3115: CF          rst  $08
3116: 82          add  a,d
3117: FD 77 02    ld   (iy+$02),a
311A: C9          ret

311B: FD 7E 00    ld   a,(iy+$00)
311E: 21 99 31    ld   hl,$3199
3121: 0F          rrca
3122: 0F          rrca
3123: 0F          rrca
3124: 0F          rrca
3125: E6 0F       and  $0F
3127: D7          rst  $10
3128: EB          ex   de,hl
3129: DD 7E 00    ld   a,(ix+$00)
312C: 0F          rrca
312D: 0F          rrca
312E: 0F          rrca
312F: E6 06       and  $06
3131: 85          add  a,l
3132: 6F          ld   l,a
3133: 30 01       jr   nc,$3136
3135: 24          inc  h    ; [uncovered] 
3136: 7E          ld   a,(hl)
3137: FD 77 01    ld   (iy+$01),a
313A: 47          ld   b,a
313B: 23          inc  hl
313C: 7E          ld   a,(hl)
313D: E6 F0       and  $F0
313F: 4F          ld   c,a
3140: FD 7E 02    ld   a,(iy+$02)
3143: E6 0F       and  $0F
3145: 81          add  a,c
3146: 4F          ld   c,a
3147: FD 71 02    ld   (iy+$02),c
314A: CB 61       bit  4,c
314C: C8          ret  z
314D: 04          inc  b
314E: FD 70 05    ld   (iy+$05),b
3151: FD 71 06    ld   (iy+$06),c
3154: C9          ret

3155: FD 36 02 08 ld   (iy+$02),$08
3159: 3A 00 94    ld   a,($9400)
315C: 0F          rrca
315D: 0F          rrca
315E: 0F          rrca
315F: E6 01       and  $01
3161: 4F          ld   c,a
3162: FD 7E 00    ld   a,(iy+$00)
3165: 07          rlca
3166: 07          rlca
3167: E6 03       and  $03
3169: 87          add  a,a
316A: C6 3E       add  a,$3E
316C: 81          add  a,c
316D: FD 77 01    ld   (iy+$01),a
3170: C9          ret

3171: 3A 0D 96    ld   a,($960D)
3174: E6 01       and  $01
3176: CA 81 2D    jp   z,$2D81
3179: 3A 0B 96    ld   a,($960B)
317C: 0F          rrca
317D: 0F          rrca
317E: E6 1F       and  $1F
3180: F7          rst  $30

324B: 3A 00 90    ld   a,($9000)
324E: 3C          inc  a
324F: C0          ret  nz
3250: 3A 01 96    ld   a,($9601)
3253: A7          and  a
3254: C2 30 35    jp   nz,$3530
3257: 3A 05 96    ld   a,($9605)
325A: A7          and  a
325B: C8          ret  z
325C: 3A 4E 92    ld   a,($924E)
325F: A7          and  a
3260: C2 81 34    jp   nz,$3481
3263: 3A DE 91    ld   a,($91DE)
3266: 47          ld   b,a
3267: 3A 3E 91    ld   a,($913E)
326A: 90          sub  b
326B: D0          ret  nc
326C: 3A 1E 92    ld   a,($921E)
326F: A7          and  a
3270: 20 0E       jr   nz,$3280
3272: 3A FE 90    ld   a,($90FE)
3275: A7          and  a
3276: C0          ret  nz
3277: 3A 2E 91    ld   a,($912E)
327A: A7          and  a
327B: C8          ret  z
327C: 32 1E 92    ld   ($921E),a
327F: C9          ret

3280: 21 6E 91    ld   hl,$916E
3283: 7E          ld   a,(hl)
3284: 34          inc  (hl)
3285: E6 07       and  $07
3287: 87          add  a,a
3288: 87          add  a,a
3289: 21 6D 33    ld   hl,$336D
328C: DF          rst  $18
328D: 5E          ld   e,(hl)
328E: 23          inc  hl
328F: 56          ld   d,(hl)
3290: D5          push de
3291: 23          inc  hl
3292: 5E          ld   e,(hl)
3293: 23          inc  hl
3294: 56          ld   d,(hl)
3295: EB          ex   de,hl
3296: 11 10 00    ld   de,$0010
3299: D9          exx
329A: E1          pop  hl
329B: 11 04 00    ld   de,$0004
329E: 06 05       ld   b,$05
32A0: D9          exx
32A1: 7E          ld   a,(hl)
32A2: 3C          inc  a
32A3: CA AC 32    jp   z,$32AC
32A6: 19          add  hl,de
32A7: D9          exx
32A8: 19          add  hl,de
32A9: 10 F5       djnz $32A0
32AB: C9          ret

32AC: 22 6B 94    ld   ($946B),hl
32AF: D9          exx
32B0: 22 6D 94    ld   ($946D),hl
32B3: 21 10 90    ld   hl,$9010
32B6: 11 10 00    ld   de,$0010
32B9: D9          exx
32BA: 21 10 98    ld   hl,$9810
32BD: 11 08 00    ld   de,$0008
32C0: 3A 4E 92    ld   a,($924E)
32C3: A7          and  a
32C4: 20 0C       jr   nz,$32D2
32C6: 3A 05 96    ld   a,($9605)
32C9: FE 16       cp   $16
32CB: 30 0A       jr   nc,$32D7
32CD: 06 0A       ld   b,$0A
32CF: C3 E2 32    jp   $32E2

32D7: 4F          ld   c,a
32D8: 3A E7 09    ld   a,($09E7)
32DB: 91          sub  c
32DC: 0F          rrca
32DD: E6 0F       and  $0F
32DF: C6 03       add  a,$03
32E1: 47          ld   b,a
32E2: D9          exx
32E3: 7E          ld   a,(hl)
32E4: A7          and  a
32E5: CA EE 32    jp   z,$32EE
32E8: 19          add  hl,de
32E9: D9          exx
32EA: 19          add  hl,de
32EB: 10 F5       djnz $32E2
32ED: C9          ret    ; [uncovered] 

32EE: E5          push hl
32EF: FD E1       pop  iy
32F1: DD 2A 6B 94 ld   ix,($946B)
32F5: FD 35 00    dec  (iy+$00)
32F8: FD 36 01 C0 ld   (iy+$01),$C0
32FC: FD 36 06 00 ld   (iy+$06),$00
3300: FD 36 07 00 ld   (iy+$07),$00
3304: FD 36 0A 03 ld   (iy+$0a),$03
3308: DD 7E 09    ld   a,(ix+$09)
330B: FD 77 09    ld   (iy+$09),a
330E: DD 7E 0C    ld   a,(ix+$0c)
3311: FD 77 0C    ld   (iy+$0c),a
3314: DD 7E 0D    ld   a,(ix+$0d)
3317: FD 77 0D    ld   (iy+$0d),a
331A: DD 36 00 00 ld   (ix+$00),$00
331E: D9          exx
331F: EB          ex   de,hl
3320: 2A 6D 94    ld   hl,($946D)
3323: 7E          ld   a,(hl)
3324: 12          ld   (de),a
3325: 36 00       ld   (hl),$00
3327: 2C          inc  l
3328: 1C          inc  e
3329: ED A0       ldi
332B: ED A0       ldi
332D: ED A0       ldi
332F: 3A 05 96    ld   a,($9605)
3332: FE 03       cp   $03
3334: 30 04       jr   nc,$333A
3336: 21 1E 93    ld   hl,$931E    ; [uncovered] 
3339: 34          inc  (hl)    ; [uncovered] 
333A: 21 1E 92    ld   hl,$921E
333D: 35          dec  (hl)
333E: C0          ret  nz
333F: 3A 7E 90    ld   a,($907E)
3342: 32 FE 90    ld   ($90FE),a
3345: C9          ret

3481: 3A 70 90    ld   a,($9070)
3484: A7          and  a
3485: C2 80 32    jp   nz,$3280
3488: 3A 80 90    ld   a,($9080)
348B: A7          and  a
348C: C2 80 32    jp   nz,$3280
348F: 3A 90 90    ld   a,($9090)
3492: A7          and  a
3493: C2 80 32    jp   nz,$3280
3496: CD 3F 5D    call $5D3F
3499: DD 21 70 90 ld   ix,$9070
349D: FD 21 40 98 ld   iy,$9840
34A1: 3A 01 90    ld   a,($9001)
34A4: 32 6E 92    ld   ($926E),a
34A7: 3A F0 00    ld   a,($00F0)
34AA: 32 7E 92    ld   ($927E),a
34AD: DD 36 08 4F ld   (ix+$08),$4F
34B1: DD 36 18 4F ld   (ix+$18),$4F
34B5: DD 36 28 4F ld   (ix+$28),$4F
34B9: DD 36 00 FE ld   (ix+$00),$FE
34BD: DD 36 10 FE ld   (ix+$10),$FE
34C1: DD 36 20 FE ld   (ix+$20),$FE
34C5: DD 36 09 00 ld   (ix+$09),$00
34C9: DD 36 19 01 ld   (ix+$19),$01
34CD: DD 36 29 02 ld   (ix+$29),$02
34D1: DD 36 0A 07 ld   (ix+$0a),$07
34D5: DD 36 1A 07 ld   (ix+$1a),$07
34D9: DD 36 2A 07 ld   (ix+$2a),$07
34DD: DD 36 06 00 ld   (ix+$06),$00
34E1: DD 36 16 00 ld   (ix+$16),$00
34E5: DD 36 26 00 ld   (ix+$26),$00
34E9: DD 36 07 00 ld   (ix+$07),$00
34ED: DD 36 17 00 ld   (ix+$17),$00
34F1: DD 36 27 00 ld   (ix+$27),$00
34F5: AF          xor  a
34F6: 32 4E 92    ld   ($924E),a
34F9: 32 8E 92    ld   ($928E),a
34FC: 21 0E 96    ld   hl,$960E
34FF: 34          inc  (hl)
3500: 3A 05 96    ld   a,($9605)
3503: C6 03       add  a,$03
3505: 32 05 96    ld   ($9605),a
3508: C9          ret

3509: 11 13 01    ld   de,$0113
350C: FF          rst  $38
350D: 16 07       ld   d,$07
350F: FF          rst  $38
3510: CD 3E 14    call $143E
3513: 21 58 1C    ld   hl,$1C58
3516: 01 00 00    ld   bc,$0000
3519: 97          sub  a
351A: 86          add  a,(hl)
351B: 23          inc  hl
351C: 10 FC       djnz $351A
351E: D6 AD       sub  $AD
3520: C2 FF 07    jp   nz,$07FF
3523: 3A 1B 86    ld   a,($861B)
3526: 06 3A       ld   b,$3A
3528: 90          sub  b
3529: 3C          inc  a
352A: 32 2B 94    ld   ($942B),a
352D: C3 0B 08    jp   $080B

3530: 21 2E 90    ld   hl,$902E
3533: 7E          ld   a,(hl)
3534: A7          and  a
3535: C2 CA 35    jp   nz,$35CA
3538: 35          dec  (hl)
3539: DD 21 10 90 ld   ix,$9010
353D: FD 21 10 98 ld   iy,$9810
3541: 21 0D 96    ld   hl,$960D
3544: 7E          ld   a,(hl)
3545: 47          ld   b,a
3546: FE 04       cp   $04
3548: D2 DF 35    jp   nc,$35DF
354B: FE 03       cp   $03
354D: CC F3 37    call z,$37F3
3550: 34          inc  (hl)
3551: 3A 0B 96    ld   a,($960B)
3554: E6 1F       and  $1F
3556: 87          add  a,a
3557: 87          add  a,a
3558: 80          add  a,b
3559: 21 52 51    ld   hl,$5152
355C: D7          rst  $10
355D: EB          ex   de,hl
355E: 7E          ld   a,(hl)
355F: 32 FE 91    ld   ($91FE),a
3562: 47          ld   b,a
3563: 23          inc  hl
3564: 11 08 00    ld   de,$0008
3567: C5          push bc
3568: 3A 02 96    ld   a,($9602)
356B: DD 77 09    ld   (ix+$09),a
356E: 3C          inc  a
356F: 32 02 96    ld   ($9602),a
3572: CD 81 35    call $3581
3575: DD 19       add  ix,de
3577: DD 19       add  ix,de
3579: FD 19       add  iy,de
357B: C1          pop  bc
357C: 10 E9       djnz $3567
357E: C3 A6 5C    jp   $5CA6

3581: 3A 07 94    ld   a,($9407)
3584: 0F          rrca
3585: E6 80       and  $80
3587: 86          add  a,(hl)
3588: FD 77 03    ld   (iy+$03),a
358B: FD 36 00 FF ld   (iy+$00),$FF
358F: 23          inc  hl
3590: 7E          ld   a,(hl)
3591: DD 77 05    ld   (ix+$05),a
3594: DD 36 06 00 ld   (ix+$06),$00
3598: DD 36 07 00 ld   (ix+$07),$00
359C: 23          inc  hl
359D: 7E          ld   a,(hl)
359E: DD 77 08    ld   (ix+$08),a
35A1: FD 36 01 00 ld   (iy+$01),$00
35A5: FD 36 02 00 ld   (iy+$02),$00
35A9: 23          inc  hl
35AA: D9          exx
35AB: DD 7E 09    ld   a,(ix+$09)
35AE: 21 60 37    ld   hl,$3760
35B1: 87          add  a,a
35B2: CF          rst  $08
35B3: DD 77 0C    ld   (ix+$0c),a
35B6: 23          inc  hl
35B7: 7E          ld   a,(hl)
35B8: DD 77 0D    ld   (ix+$0d),a
35BB: 21 3E 91    ld   hl,$913E
35BE: 34          inc  (hl)
35BF: D9          exx
35C0: DD 36 0A 00 ld   (ix+$0a),$00
35C4: DD 36 00 FF ld   (ix+$00),$FF
35C8: C9          ret

35CA: 21 10 90    ld   hl,$9010
35CD: 11 10 00    ld   de,$0010
35D0: 00          nop
35D1: 3E 0A       ld   a,$0A
35D3: 47          ld   b,a
35D4: 7E          ld   a,(hl)
35D5: A7          and  a
35D6: C0          ret  nz
35D7: 19          add  hl,de
35D8: 10 FA       djnz $35D4
35DA: AF          xor  a
35DB: 32 2E 90    ld   ($902E),a
35DE: C9          ret

35DF: 3A AE 91    ld   a,($91AE)
35E2: A7          and  a
35E3: 20 36       jr   nz,$361B
35E5: AF          xor  a
35E6: 32 01 96    ld   ($9601),a
35E9: 32 2E 92    ld   ($922E),a
35EC: 3A 1D 96    ld   a,($961D)
35EF: A7          and  a
35F0: C2 0E 36    jp   nz,$360E
35F3: 3A 78 94    ld   a,($9478)
35F6: A7          and  a
35F7: C2 0E 36    jp   nz,$360E
35FA: 3A 5D 93    ld   a,($935D)
35FD: FE 04       cp   $04
35FF: 38 03       jr   c,$3604
3601: 32 1D 96    ld   ($961D),a    ; [uncovered] 
3604: 3A 3E 90    ld   a,($903E)
3607: A7          and  a
3608: CA 71 41    jp   z,$4171
360B: C3 23 36    jp   $3623    ; [uncovered] 

360E: AF          xor  a
360F: 32 78 94    ld   ($9478),a
3612: 32 3E 90    ld   ($903E),a
3615: 32 01 96    ld   ($9601),a
3618: C3 71 41    jp   $4171

361B: AF          xor  a
361C: 32 05 96    ld   ($9605),a
361F: 32 01 96    ld   ($9601),a
3622: C9          ret

37E9: CD 31 38    call $3831
37EC: CD 07 02    call $0207
37EF: C0          ret  nz
37F0: C3 0B 08    jp   $080B

37F3: 3A AE 91    ld   a,($91AE)
37F6: A7          and  a
37F7: C0          ret  nz
37F8: 3A 05 96    ld   a,($9605)
37FB: FE 07       cp   $07
37FD: D0          ret  nc
37FE: 3E 01       ld   a,$01
3800: 32 3E 90    ld   ($903E),a
3803: C9          ret

3804: CD EF 38    call $38EF
3807: 26 FD       ld   h,$FD
3809: 0E C0       ld   c,$C0
380B: CD 37 3A    call $3A37
380E: 3A C2 0C    ld   a,($0CC2)
3811: 47          ld   b,a
3812: 26 FC       ld   h,$FC
3814: CD 37 3A    call $3A37
3817: 2E FE       ld   l,$FE
3819: C3 B1 39    jp   $39B1

381C: 21 A6 40    ld   hl,$40A6
381F: D7          rst  $10
3820: EB          ex   de,hl
3821: 5E          ld   e,(hl)
3822: 23          inc  hl
3823: 56          ld   d,(hl)
3824: 23          inc  hl
3825: 23          inc  hl
3826: 7E          ld   a,(hl)
3827: FE 9E       cp   $9E
3829: C8          ret  z
382A: 3E 83       ld   a,$83
382C: 12          ld   (de),a
382D: 23          inc  hl
382E: E7          rst  $20
382F: 18 F5       jr   $3826

3831: CD EF 38    call $38EF
3834: 3A 3B 94    ld   a,($943B)
3837: 67          ld   h,a
3838: 0E C0       ld   c,$C0
383A: CD 37 3A    call $3A37
383D: 3A FA 17    ld   a,($17FA)
3840: 47          ld   b,a
3841: 3A 3B 94    ld   a,($943B)
3844: 3D          dec  a
3845: 67          ld   h,a
3846: CD 37 3A    call $3A37
3849: 3A 3B 94    ld   a,($943B)
384C: D6 02       sub  $02
384E: 6F          ld   l,a
384F: CD B1 39    call $39B1
3852: FD 21 60 98 ld   iy,$9860
3856: DD 21 B0 90 ld   ix,$90B0
385A: 3A 3B 94    ld   a,($943B)
385D: D6 03       sub  $03
385F: 67          ld   h,a
3860: 0E C0       ld   c,$C0
3862: C3 38 39    jp   $3938

3865: 3E FB       ld   a,$FB
3867: 32 3B 94    ld   ($943B),a
386A: CD 31 38    call $3831
386D: CD F3 22    call $22F3
3870: 11 00 04    ld   de,$0400
3873: FF          rst  $38
3874: 16 05       ld   d,$05
3876: FF          rst  $38
3877: 16 06       ld   d,$06
3879: FF          rst  $38
387A: 3A 58 94    ld   a,($9458)
387D: A7          and  a
387E: 28 0B       jr   z,$388B
3880: 11 09 01    ld   de,$0109    ; [uncovered] 
3883: 3A 62 96    ld   a,($9662)    ; [uncovered] 
3886: A7          and  a    ; [uncovered] 
3887: 28 01       jr   z,$388A    ; [uncovered] 
3889: 1C          inc  e    ; [uncovered] 
388A: FF          rst  $38    ; [uncovered] 
388B: 21 40 80    ld   hl,$8040
388E: 11 20 00    ld   de,$0020
3891: 06 1C       ld   b,$1C
3893: CD B4 38    call $38B4
3896: 21 5F 80    ld   hl,$805F
3899: 11 20 00    ld   de,$0020
389C: 06 1C       ld   b,$1C
389E: CD B4 38    call $38B4
38A1: CD 2D 3B    call $3B2D
38A4: CD 0B 08    call $080B
38A7: 3A 0C 96    ld   a,($960C)
38AA: A7          and  a
38AB: CA BA 38    jp   z,$38BA
38AE: CD C9 38    call $38C9
38B1: C3 9A 08    jp   $089A

38B4: CB E6       set  4,(hl)
38B6: 19          add  hl,de
38B7: 10 FB       djnz $38B4
38B9: C9          ret

38BA: 11 1C 01    ld   de,$011C
38BD: FF          rst  $38
38BE: CD AD 08    call $08AD
38C1: 3A 58 94    ld   a,($9458)
38C4: A7          and  a
38C5: C8          ret  z
38C6: C3 E9 36    jp   $36E9    ; [uncovered] 

38C9: 3A 0B 96    ld   a,($960B)
38CC: C6 01       add  a,$01
38CE: E6 03       and  $03
38D0: C6 2C       add  a,$2C
38D2: 5F          ld   e,a
38D3: 16 01       ld   d,$01
38D5: FF          rst  $38
38D6: 3A 0B 96    ld   a,($960B)
38D9: FE 17       cp   $17
38DB: 28 0D       jr   z,$38EA
38DD: C6 01       add  a,$01
38DF: 0F          rrca
38E0: 0F          rrca
38E1: E6 07       and  $07
38E3: C6 26       add  a,$26
38E5: 5F          ld   e,a
38E6: 16 01       ld   d,$01
38E8: FF          rst  $38
38E9: C9          ret

38EF: 3A 00 94    ld   a,($9400)
38F2: E6 01       and  $01
38F4: 20 07       jr   nz,$38FD
38F6: DD 21 38 A1 ld   ix,$A138
38FA: C3 01 39    jp   $3901

38FD: DD 21 38 A3 ld   ix,$A338
3901: FD 21 38 99 ld   iy,$9938
3905: 3E 05       ld   a,$05
3907: 47          ld   b,a
3908: C9          ret

3909: 21 65 94    ld   hl,$9465
390C: 35          dec  (hl)
390D: C0          ret  nz
390E: 11 E0 FF    ld   de,$FFE0
3911: 21 9B 86    ld   hl,$869B
3914: AF          xor  a
3915: 86          add  a,(hl)
3916: D6 D7       sub  $D7
3918: 19          add  hl,de
3919: 86          add  a,(hl)
391A: D6 B1       sub  $B1
391C: 19          add  hl,de
391D: 86          add  a,(hl)
391E: D6 47       sub  $47
3920: C2 FF 07    jp   nz,$07FF
3923: DD 2A AA 37 ld   ix,($37AA)
3927: FD 2A AD 37 ld   iy,($37AD)
392B: DD 7D       ld   a,ixl
392D: DD 84       add  a,ixh
392F: 85          add  a,l
3930: C6 00       add  a,$00
3932: 00          nop
3933: 00          nop
3934: 00          nop
3935: C3 0B 08    jp   $080B

3938: 3A 22 12    ld   a,($1222)
393B: 47          ld   b,a
393C: 2E 26       ld   l,$26
393E: 11 04 00    ld   de,$0004
3941: DD 7E 00    ld   a,(ix+$00)
3944: A7          and  a
3945: 20 19       jr   nz,$3960
3947: FD 7E 00    ld   a,(iy+$00)
394A: 84          add  a,h
394B: FE 18       cp   $18
394D: DC AE 3A    call c,$3AAE
3950: FD 77 00    ld   (iy+$00),a
3953: 2F          cpl
3954: 07          rlca
3955: 07          rlca
3956: E6 03       and  $03
3958: C6 04       add  a,$04
395A: FD 77 02    ld   (iy+$02),a
395D: FD 75 01    ld   (iy+$01),l
3960: FD 19       add  iy,de
3962: DD 19       add  ix,de
3964: DD 19       add  ix,de
3966: DD 19       add  ix,de
3968: DD 19       add  ix,de
396A: 10 D5       djnz $3941
396C: C9          ret

39B1: DD 21 30 93 ld   ix,$9330
39B5: FD 21 18 99 ld   iy,$9918
39B9: 11 10 00    ld   de,$0010
39BC: 01 04 00    ld   bc,$0004
39BF: 26 80       ld   h,$80
39C1: D9          exx
39C2: 3A A3 00    ld   a,($00A3)
39C5: 47          ld   b,a
39C6: D9          exx
39C7: DD 7E 00    ld   a,(ix+$00)
39CA: A7          and  a
39CB: C2 EF 39    jp   nz,$39EF
39CE: FD 7E 03    ld   a,(iy+$03)
39D1: 84          add  a,h
39D2: FD 77 03    ld   (iy+$03),a
39D5: FD 7E 00    ld   a,(iy+$00)
39D8: 85          add  a,l
39D9: FE 18       cp   $18
39DB: DC 6A 3A    call c,$3A6A
39DE: FD 77 00    ld   (iy+$00),a
39E1: 2F          cpl
39E2: 07          rlca
39E3: 07          rlca
39E4: E6 03       and  $03
39E6: C6 04       add  a,$04
39E8: FD 77 02    ld   (iy+$02),a
39EB: FD 36 01 26 ld   (iy+$01),$26
39EF: FD 09       add  iy,bc
39F1: DD 19       add  ix,de
39F3: D9          exx
39F4: 10 D0       djnz $39C6
39F6: C9          ret

3A37: 2E 26       ld   l,$26
3A39: 11 04 00    ld   de,$0004
3A3C: FD 7E 03    ld   a,(iy+$03)
3A3F: C6 80       add  a,$80
3A41: FD 77 03    ld   (iy+$03),a
3A44: FD 7E 00    ld   a,(iy+$00)
3A47: 84          add  a,h
3A48: FE 18       cp   $18
3A4A: DC AE 3A    call c,$3AAE
3A4D: FD 77 00    ld   (iy+$00),a
3A50: 2F          cpl
3A51: 07          rlca
3A52: 07          rlca
3A53: E6 03       and  $03
3A55: C6 04       add  a,$04
3A57: DD 77 02    ld   (ix+$02),a
3A5A: DD 77 22    ld   (ix+$22),a
3A5D: DD 75 01    ld   (ix+$01),l
3A60: DD 75 21    ld   (ix+$21),l
3A63: FD 19       add  iy,de
3A65: DD 19       add  ix,de
3A67: 10 D3       djnz $3A3C
3A69: C9          ret

3A6A: D9          exx
3A6B: 3A 00 94    ld   a,($9400)
3A6E: 67          ld   h,a
3A6F: 0F          rrca
3A70: 0F          rrca
3A71: 0F          rrca
3A72: 84          add  a,h
3A73: FD 77 03    ld   (iy+$03),a
3A76: E6 0F       and  $0F
3A78: C6 EC       add  a,$EC
3A7A: D9          exx
3A7B: C9          ret

3AAE: CD 81 13    call $1381
3AB1: FD 77 03    ld   (iy+$03),a
3AB4: E6 3F       and  $3F
3AB6: 81          add  a,c
3AB7: C9          ret

3AB8: FD 21 18 99 ld   iy,$9918
3ABC: DD 21 18 A1 ld   ix,$A118
3AC0: 3A F8 09    ld   a,($09F8)
3AC3: 47          ld   b,a
3AC4: 11 04 00    ld   de,$0004
3AC7: CD E4 3A    call $3AE4
3ACA: FD 19       add  iy,de
3ACC: DD 19       add  ix,de
3ACE: 10 F7       djnz $3AC7
3AD0: DD 19       add  ix,de
3AD2: DD 19       add  ix,de
3AD4: FD 19       add  iy,de
3AD6: FD 19       add  iy,de
3AD8: 06 08       ld   b,$08
3ADA: CD E4 3A    call $3AE4
3ADD: DD 19       add  ix,de
3ADF: FD 19       add  iy,de
3AE1: 10 F7       djnz $3ADA
3AE3: C9          ret

3AE4: CD 81 13    call $1381
3AE7: FD 77 00    ld   (iy+$00),a
3AEA: 0F          rrca
3AEB: 0F          rrca
3AEC: 0F          rrca
3AED: 0F          rrca
3AEE: FD 77 03    ld   (iy+$03),a
3AF1: C9          ret

3AF2: FD 21 60 98 ld   iy,$9860
3AF6: DD 21 B0 90 ld   ix,$90B0
3AFA: 3A 64 06    ld   a,($0664)
3AFD: 47          ld   b,a
3AFE: 11 04 00    ld   de,$0004
3B01: DD 7E 00    ld   a,(ix+$00)
3B04: A7          and  a
3B05: 20 0B       jr   nz,$3B12
3B07: CD E4 3A    call $3AE4
3B0A: FD 36 01 00 ld   (iy+$01),$00
3B0E: FD 36 02 00 ld   (iy+$02),$00
3B12: FD 19       add  iy,de
3B14: DD 19       add  ix,de
3B16: DD 19       add  ix,de
3B18: DD 19       add  ix,de
3B1A: DD 19       add  ix,de
3B1C: 10 E3       djnz $3B01
3B1E: C9          ret

3B2D: FD 21 60 98 ld   iy,$9860
3B31: DD 21 B0 90 ld   ix,$90B0
3B35: 06 12       ld   b,$12
3B37: 11 04 00    ld   de,$0004
3B3A: DD 7E 00    ld   a,(ix+$00)
3B3D: A7          and  a
3B3E: 20 04       jr   nz,$3B44
3B40: FD 36 00 00 ld   (iy+$00),$00
3B44: FD 19       add  iy,de
3B46: DD 19       add  ix,de
3B48: DD 19       add  ix,de
3B4A: DD 19       add  ix,de
3B4C: DD 19       add  ix,de
3B4E: 10 EA       djnz $3B3A
3B50: C9          ret

4001: 0E 00       ld   c,$00
4003: FD 46 03    ld   b,(iy+$03)
4006: 7C          ld   a,h
4007: 90          sub  b
4008: FE 80       cp   $80
400A: 38 04       jr   c,$4010
400C: ED 44       neg
400E: CB C1       set  0,c
4010: 57          ld   d,a
4011: FD 46 00    ld   b,(iy+$00)
4014: 7D          ld   a,l
4015: 90          sub  b
4016: FE 80       cp   $80
4018: 38 04       jr   c,$401E
401A: ED 44       neg
401C: CB C9       set  1,c
401E: 5F          ld   e,a
401F: 2E 00       ld   l,$00
4021: 92          sub  d
4022: 28 71       jr   z,$4095
4024: 30 04       jr   nc,$402A
4026: CB D1       set  2,c
4028: 18 07       jr   $4031

402A: 62          ld   h,d
402B: CD 73 40    call $4073
402E: C3 36 40    jp   $4036

4031: 63          ld   h,e
4032: 5A          ld   e,d
4033: CD 73 40    call $4073
4036: 79          ld   a,c
4037: 21 9E 40    ld   hl,$409E
403A: DF          rst  $18
403B: 78          ld   a,b
403C: 0F          rrca
403D: 0F          rrca
403E: E6 1F       and  $1F
4040: CB 6E       bit  5,(hl)
4042: 28 05       jr   z,$4049
4044: 47          ld   b,a
4045: 3A 4C 15    ld   a,($154C)
4048: 90          sub  b
4049: 86          add  a,(hl)
404A: DD 77 04    ld   (ix+$04),a
404D: C9          ret

404E: CD 04 38    call $3804
4051: CD F2 3A    call $3AF2
4054: 3E 5A       ld   a,$5A
4056: 32 65 94    ld   ($9465),a
4059: CD 86 1B    call $1B86
405C: 06 00       ld   b,$00
405E: 21 ED 2D    ld   hl,$2DED
4061: 97          sub  a
4062: AE          xor  (hl)
4063: 23          inc  hl
4064: 10 FC       djnz $4062
4066: C6 40       add  a,$40
4068: C2 92 01    jp   nz,$0192
406B: 3E FB       ld   a,$FB
406D: 32 3B 94    ld   ($943B),a
4070: C3 0B 08    jp   $080B

4073: 3A 61 06    ld   a,($0661)
4076: 47          ld   b,a
4077: AF          xor  a
4078: ED 6A       adc  hl,hl
407A: 7C          ld   a,h
407B: 38 03       jr   c,$4080
407D: BB          cp   e
407E: 38 03       jr   c,$4083
4080: 93          sub  e
4081: 67          ld   h,a
4082: AF          xor  a
4083: 3F          ccf
4084: 10 F2       djnz $4078
4086: 45          ld   b,l
4087: C9          ret

4095: 21 6D 41    ld   hl,$416D
4098: 79          ld   a,c
4099: CF          rst  $08
409A: DD 77 04    ld   (ix+$04),a
409D: C9          ret

4104: 3A 00 C1    ld   a,($C100)
4107: 2F          cpl
4108: CB 47       bit  0,a
410A: C4 C2 5D    call nz,$5DC2
410D: 06 00       ld   b,$00
410F: 21 70 01    ld   hl,$0170
4112: AF          xor  a
4113: 86          add  a,(hl)
4114: 2B          dec  hl
4115: 10 FC       djnz $4113
4117: C6 F7       add  a,$F7
4119: C2 2B 15    jp   nz,$152B
411C: CD D6 01    call $01D6
411F: C3 0B 08    jp   $080B

4171: 3A 0A 96    ld   a,($960A)
4174: 47          ld   b,a
4175: 3A 44 94    ld   a,($9444)
4178: FE 04       cp   $04
417A: 38 01       jr   c,$417D
417C: 04          inc  b
417D: 78          ld   a,b
417E: 87          add  a,a
417F: 80          add  a,b
4180: 87          add  a,a
4181: 21 DF 41    ld   hl,$41DF
4184: DF          rst  $18
4185: EB          ex   de,hl
4186: 21 0E 90    ld   hl,$900E
4189: 7E          ld   a,(hl)
418A: FE 02       cp   $02
418C: 38 03       jr   c,$4191
418E: 3A 06 12    ld   a,($1206)    ; [uncovered] 
4191: 34          inc  (hl)
4192: EB          ex   de,hl
4193: D7          rst  $10
4194: 1A          ld   a,(de)
4195: 32 5E 90    ld   ($905E),a
4198: 13          inc  de
4199: 1A          ld   a,(de)
419A: 32 AE 90    ld   ($90AE),a
419D: 13          inc  de
419E: 1A          ld   a,(de)
419F: 32 DE 90    ld   ($90DE),a
41A2: 13          inc  de
41A3: 1A          ld   a,(de)
41A4: 32 AE 92    ld   ($92AE),a
41A7: 13          inc  de
41A8: 1A          ld   a,(de)
41A9: 32 1E 91    ld   ($911E),a
41AC: 13          inc  de
41AD: 1A          ld   a,(de)
41AE: 32 9E 90    ld   ($909E),a
41B1: 13          inc  de
41B2: 1A          ld   a,(de)
41B3: 32 8E 90    ld   ($908E),a
41B6: 13          inc  de
41B7: 1A          ld   a,(de)
41B8: 32 7E 90    ld   ($907E),a
41BB: 13          inc  de
41BC: 1A          ld   a,(de)
41BD: 32 2E 91    ld   ($912E),a
41C0: 13          inc  de
41C1: 1A          ld   a,(de)
41C2: 32 DE 91    ld   ($91DE),a
41C5: 13          inc  de
41C6: 1A          ld   a,(de)
41C7: 32 1E 90    ld   ($901E),a
41CA: 13          inc  de
41CB: 1A          ld   a,(de)
41CC: 32 4E 91    ld   ($914E),a
41CF: 13          inc  de
41D0: 1A          ld   a,(de)
41D1: 32 0E 92    ld   ($920E),a
41D4: 13          inc  de
41D5: 1A          ld   a,(de)
41D6: 32 DE 92    ld   ($92DE),a
41D9: 13          inc  de
41DA: 1A          ld   a,(de)
41DB: 32 EE 92    ld   ($92EE),a
41DE: C9          ret

4255: 21 51 42    ld   hl,$4251
4258: 3A 00 94    ld   a,($9400)
425B: 0F          rrca
425C: 0F          rrca
425D: 0F          rrca
425E: E6 03       and  $03
4260: CF          rst  $08
4261: 21 70 82    ld   hl,$8270
4264: 11 E0 FF    ld   de,$FFE0
4267: 06 0C       ld   b,$0C
4269: 77          ld   (hl),a
426A: 19          add  hl,de
426B: 10 FC       djnz $4269
426D: 3E FD       ld   a,$FD
426F: 32 3B 94    ld   ($943B),a
4272: CD 31 38    call $3831
4275: 21 65 94    ld   hl,$9465
4278: 35          dec  (hl)
4279: C0          ret  nz
427A: 0E 00       ld   c,$00
427C: 21 83 46    ld   hl,$4683
427F: 3A 2B 94    ld   a,($942B)
4282: 96          sub  (hl)
4283: 23          inc  hl
4284: 0D          dec  c
4285: 20 FB       jr   nz,$4282
4287: D6 0E       sub  $0E
4289: 32 2B 94    ld   ($942B),a
428C: CD A0 15    call $15A0
428F: D2 A3 42    jp   nc,$42A3
4292: 11 09 03    ld   de,$0309    ; [uncovered] 
4295: FF          rst  $38    ; [uncovered] 
4296: 11 0B 03    ld   de,$030B    ; [uncovered] 
4299: FF          rst  $38    ; [uncovered] 
429A: 3A 25 5E    ld   a,($5E25)    ; [uncovered] 
429D: 32 2C 94    ld   ($942C),a    ; [uncovered] 
42A0: C3 D1 13    jp   $13D1    ; [uncovered] 

42A3: CD D6 01    call $01D6
42A6: C3 0B 08    jp   $080B

42DC: 06 0E       ld   b,$0E
42DE: 11 1F 00    ld   de,$001F
42E1: 21 9E 86    ld   hl,$869E
42E4: 36 83       ld   (hl),$83
42E6: 23          inc  hl
42E7: 36 83       ld   (hl),$83
42E9: 19          add  hl,de
42EA: 10 F8       djnz $42E4
42EC: 3A 00 96    ld   a,($9600)
42EF: A7          and  a
42F0: C8          ret  z
42F1: FE 06       cp   $06
42F3: 38 03       jr   c,$42F8
42F5: 3A EA 21    ld   a,($21EA)    ; [uncovered] 
42F8: 47          ld   b,a
42F9: 21 2A 43    ld   hl,$432A
42FC: D7          rst  $10
42FD: EB          ex   de,hl
42FE: 11 1F 00    ld   de,$001F
4301: 36 68       ld   (hl),$68
4303: CB 94       res  2,h
4305: 36 02       ld   (hl),$02
4307: CB D4       set  2,h
4309: 2C          inc  l
430A: 36 1F       ld   (hl),$1F
430C: CB 94       res  2,h
430E: 36 02       ld   (hl),$02
4310: CB D4       set  2,h
4312: 19          add  hl,de
4313: 36 F2       ld   (hl),$F2
4315: CB 94       res  2,h
4317: 36 02       ld   (hl),$02
4319: CB D4       set  2,h
431B: 2C          inc  l
431C: 36 61       ld   (hl),$61
431E: CB 94       res  2,h
4320: 36 02       ld   (hl),$02
4322: CB D4       set  2,h
4324: 19          add  hl,de
4325: D6 03       sub  $03
4327: 10 D8       djnz $4301
4329: C9          ret

43F4: AF          xor  a
43F5: 32 FD A7    ld   ($A7FD),a 
43F8: CD CB 0E    call $0ECB
43FB: CD 88 5C    call $5C88
43FE: CD D4 5D    call $5DD4
4401: CD D6 01    call $01D6
4404: 0E 00       ld   c,$00
4406: 21 09 4C    ld   hl,$4C09
4409: 3A 2C 94    ld   a,($942C)
440C: 96          sub  (hl)
440D: 23          inc  hl
440E: 0D          dec  c
440F: 20 FB       jr   nz,$440C
4411: EE 02       xor  $02
4413: 32 2C 94    ld   ($942C),a
4416: C3 0B 08    jp   $080B

4516: 3A AE 91    ld   a,($91AE)
4519: A7          and  a
451A: C0          ret  nz
451B: 3A 4E 91    ld   a,($914E)
451E: A7          and  a
451F: C8          ret  z
4520: 21 5E 91    ld   hl,$915E
4523: 7E          ld   a,(hl)
4524: A7          and  a
4525: 20 52       jr   nz,$4579
4527: 3A 05 96    ld   a,($9605)
452A: A7          and  a
452B: C8          ret  z
452C: 3A 6E 90    ld   a,($906E)
452F: A7          and  a
4530: C0          ret  nz
4531: 3A A0 90    ld   a,($90A0)
4534: A7          and  a
4535: C0          ret  nz
4536: 3A 2E 90    ld   a,($902E)
4539: A7          and  a
453A: C8          ret  z
453B: 3A 00 90    ld   a,($9000)
453E: 3C          inc  a
453F: C0          ret  nz
4540: 35          dec  (hl)
4541: DD 21 A0 90 ld   ix,$90A0
4545: FD 21 58 98 ld   iy,$9858
4549: DD 35 00    dec  (ix+$00)
454C: CD FE 5C    call $5CFE
454F: 21 06 90    ld   hl,$9006
4552: 3A 00 94    ld   a,($9400)
4555: 07          rlca
4556: 07          rlca
4557: E6 01       and  $01
4559: 28 01       jr   z,$455C
455B: 2C          inc  l
455C: 7E          ld   a,(hl)
455D: FD 77 03    ld   (iy+$03),a
4560: 3A F8 24    ld   a,($24F8)
4563: FD 77 00    ld   (iy+$00),a
4566: CD A3 45    call $45A3
4569: 21 5E 05    ld   hl,$055E
456C: AF          xor  a
456D: 06 80       ld   b,$80
456F: 96          sub  (hl)
4570: 23          inc  hl
4571: 10 FC       djnz $456F
4573: C6 9F       add  a,$9F
4575: 32 2C 94    ld   ($942C),a
4578: C9          ret

4579: CD E6 5C    call $5CE6
457C: DD 21 A0 90 ld   ix,$90A0
4580: FD 21 58 98 ld   iy,$9858
4584: DD 36 00 FF ld   (ix+$00),$FF
4588: 3A 0A 96    ld   a,($960A)
458B: E6 1F       and  $1F
458D: 21 C6 44    ld   hl,$44C6
4590: D7          rst  $10
4591: FD 66 00    ld   h,(iy+$00)
4594: DD 6E 03    ld   l,(ix+$03)
4597: 19          add  hl,de
4598: FD 74 00    ld   (iy+$00),h
459B: DD 75 03    ld   (ix+$03),l
459E: 7C          ld   a,h
459F: FE 20       cp   $20
45A1: 38 4B       jr   c,$45EE
45A3: 21 0A 46    ld   hl,$460A
45A6: 0F          rrca
45A7: 0F          rrca
45A8: 0F          rrca
45A9: 0F          rrca
45AA: E6 0E       and  $0E
45AC: CF          rst  $08
45AD: FD 77 01    ld   (iy+$01),a
45B0: 47          ld   b,a
45B1: 23          inc  hl
45B2: 7E          ld   a,(hl)
45B3: FD 77 02    ld   (iy+$02),a
45B6: CB 67       bit  4,a
45B8: C8          ret  z
45B9: FD 77 06    ld   (iy+$06),a
45BC: 04          inc  b
45BD: FD 70 05    ld   (iy+$05),b
45C0: 3A 00 90    ld   a,($9000)
45C3: 3C          inc  a
45C4: C0          ret  nz
45C5: 3A 01 90    ld   a,($9001)
45C8: FD 96 03    sub  (iy+$03)
45CB: C6 04       add  a,$04
45CD: FE 09       cp   $09
45CF: D0          ret  nc
45D0: 3E 28       ld   a,$28
45D2: FD 96 00    sub  (iy+$00)
45D5: C6 04       add  a,$04
45D7: FE 09       cp   $09
45D9: D0          ret  nc
45DA: 3E F0       ld   a,$F0
45DC: 32 00 90    ld   ($9000),a
45DF: C9          ret

45E0: 3E FC       ld   a,$FC
45E2: 32 3B 94    ld   ($943B),a
45E5: CD 31 38    call $3831
45E8: CD D6 01    call $01D6
45EB: C3 0B 08    jp   $080B

45EE: DD 36 00 00 ld   (ix+$00),$00
45F2: FD 36 00 00 ld   (iy+$00),$00
45F6: AF          xor  a
45F7: 32 5E 91    ld   ($915E),a
45FA: 3A 1E 90    ld   a,($901E)
45FD: 47          ld   b,a
45FE: 3A 44 94    ld   a,($9444)
4601: 87          add  a,a
4602: 87          add  a,a
4603: D6 0C       sub  $0C
4605: 80          add  a,b
4606: 32 6E 90    ld   ($906E),a
4609: C9          ret

463A: DD 7E 08    ld   a,(ix+$08)
463D: A7          and  a
463E: CA 0A 47    jp   z,$470A
4641: DD 35 08    dec  (ix+$08)
4644: 47          ld   b,a
4645: DD 7E 09    ld   a,(ix+$09)
4648: F7          rst  $30

464F: 3A 6E 92    ld   a,($926E)
4652: FD 77 03    ld   (iy+$03),a
4655: 3A 00 94    ld   a,($9400)
4658: 67          ld   h,a
4659: 78          ld   a,b
465A: CB 44       bit  0,h
465C: 20 02       jr   nz,$4660
465E: ED 44       neg
4660: C6 70       add  a,$70
4662: FD 77 00    ld   (iy+$00),a
4665: C3 A3 46    jp   $46A3

4668: 78          ld   a,b
4669: CB 2F       sra  a
466B: C6 70       add  a,$70
466D: FD 77 00    ld   (iy+$00),a
4670: 3A 6E 92    ld   a,($926E)
4673: 4F          ld   c,a
4674: 3A 00 94    ld   a,($9400)
4677: 67          ld   h,a
4678: 78          ld   a,b
4679: CB 44       bit  0,h
467B: 20 02       jr   nz,$467F
467D: ED 44       neg
467F: 81          add  a,c
4680: FD 77 03    ld   (iy+$03),a
4683: C3 A3 46    jp   $46A3

4686: 78          ld   a,b
4687: CB 2F       sra  a
4689: ED 44       neg
468B: C6 70       add  a,$70
468D: FD 77 00    ld   (iy+$00),a
4690: 3A 6E 92    ld   a,($926E)
4693: 4F          ld   c,a
4694: 3A 00 94    ld   a,($9400)
4697: 67          ld   h,a
4698: 78          ld   a,b
4699: CB 44       bit  0,h
469B: 20 02       jr   nz,$469F
469D: ED 44       neg
469F: 81          add  a,c
46A0: FD 77 03    ld   (iy+$03),a
46A3: 21 F8 46    ld   hl,$46F8
46A6: 78          ld   a,b
46A7: 0F          rrca
46A8: 0F          rrca
46A9: 0F          rrca
46AA: 0F          rrca
46AB: E6 07       and  $07
46AD: CF          rst  $08
46AE: FD 77 01    ld   (iy+$01),a
46B1: FD 36 02 08 ld   (iy+$02),$08
46B5: C9          ret

46B6: 3E 01       ld   a,$01
46B8: 32 FF A7    ld   ($A7FF),a
46BB: 3A C9 25    ld   a,($25C9)
46BE: 32 0B 96    ld   ($960B),a
46C1: CD EA 4C    call $4CEA
46C4: 11 00 01    ld   de,$0100
46C7: FF          rst  $38
46C8: 1C          inc  e
46C9: FF          rst  $38
46CA: 1C          inc  e
46CB: FF          rst  $38
46CC: 1C          inc  e
46CD: FF          rst  $38
46CE: 11 04 01    ld   de,$0104
46D1: FF          rst  $38
46D2: 1C          inc  e
46D3: FF          rst  $38
46D4: 06 00       ld   b,$00
46D6: 21 A3 34    ld   hl,$34A3
46D9: 97          sub  a
46DA: AE          xor  (hl)
46DB: 23          inc  hl
46DC: 10 FC       djnz $46DA
46DE: C6 13       add  a,$13
46E0: C2 EA 04    jp   nz,$04EA
46E3: 3A 40 94    ld   a,($9440)
46E6: A7          and  a
46E7: 20 04       jr   nz,$46ED
46E9: 11 07 01    ld   de,$0107
46EC: FF          rst  $38
46ED: 16 07       ld   d,$07
46EF: FF          rst  $38
46F0: 3E B4       ld   a,$B4
46F2: 32 65 94    ld   ($9465),a
46F5: C3 0B 08    jp   $080B

470A: DD 36 08 18 ld   (ix+$08),$18
470E: DD 36 0A 08 ld   (ix+$0a),$08
4712: C9          ret

4713: DD 35 08    dec  (ix+$08)
4716: 28 37       jr   z,$474F
4718: 3E FF       ld   a,$FF
471A: DD 86 09    add  a,(ix+$09)
471D: FD 86 03    add  a,(iy+$03)
4720: FD 77 03    ld   (iy+$03),a
4723: CD 3C 47    call $473C
4726: DD 7E 08    ld   a,(ix+$08)
4729: 06 FC       ld   b,$FC
472B: FE 0C       cp   $0C
472D: 30 02       jr   nc,$4731
472F: 06 FE       ld   b,$FE
4731: FD 7E 02    ld   a,(iy+$02)
4734: 80          add  a,b
4735: FD 77 02    ld   (iy+$02),a
4738: FD 77 06    ld   (iy+$06),a
473B: C9          ret

473C: DD 7E 09    ld   a,(ix+$09)
473F: 3D          dec  a
4740: 28 03       jr   z,$4745
4742: C3 4B 30    jp   $304B

4745: 3A 0E 93    ld   a,($930E)
4748: A7          and  a
4749: CA C4 30    jp   z,$30C4
474C: C3 4B 30    jp   $304B

474F: DD 36 0A 09 ld   (ix+$0a),$09
4753: DD 36 00 FF ld   (ix+$00),$FF
4757: DD 36 01 C0 ld   (ix+$01),$C0
475B: DD 36 07 07 ld   (ix+$07),$07
475F: DD 36 06 00 ld   (ix+$06),$00
4763: DD 36 05 05 ld   (ix+$05),$05
4767: DD 7E 09    ld   a,(ix+$09)
476A: FE 01       cp   $01
476C: 28 05       jr   z,$4773
476E: DD 36 09 2C ld   (ix+$09),$2C
4772: C9          ret

4773: 3A 0E 93    ld   a,($930E)
4776: A7          and  a
4777: 20 F5       jr   nz,$476E
4779: DD 36 09 28 ld   (ix+$09),$28
477D: C9          ret

477E: 21 AE 93    ld   hl,$93AE
4781: 34          inc  (hl)
4782: 3A 00 90    ld   a,($9000)
4785: 3C          inc  a
4786: 20 5B       jr   nz,$47E3
4788: FD 7E 00    ld   a,(iy+$00)
478B: FE 20       cp   $20
478D: 38 4B       jr   c,$47DA
478F: DD 7E 07    ld   a,(ix+$07)
4792: A7          and  a
4793: 20 28       jr   nz,$47BD
4795: 21 ED 47    ld   hl,$47ED
4798: DD 34 06    inc  (ix+$06)
479B: DD 7E 06    ld   a,(ix+$06)
479E: CF          rst  $08
479F: FE FF       cp   $FF
47A1: 28 09       jr   z,$47AC
47A3: DD 77 01    ld   (ix+$01),a
47A6: DD 36 07 05 ld   (ix+$07),$05
47AA: 18 11       jr   $47BD

47AC: DD 35 05    dec  (ix+$05)
47AF: 28 32       jr   z,$47E3
47B1: DD 36 06 00 ld   (ix+$06),$00
47B5: DD 36 07 05 ld   (ix+$07),$05
47B9: DD 36 01 C0 ld   (ix+$01),$C0
47BD: DD 35 07    dec  (ix+$07)
47C0: CD CB 4E    call $4ECB
47C3: CD B3 2B    call $2BB3
47C6: DD 7E 09    ld   a,(ix+$09)
47C9: FE 28       cp   $28
47CB: 28 03       jr   z,$47D0
47CD: C3 4B 30    jp   $304B

47D0: 3A 0E 93    ld   a,($930E)
47D3: A7          and  a
47D4: CA C4 30    jp   z,$30C4
47D7: C3 4B 30    jp   $304B    ; [uncovered] 

47E3: DD 36 01 C0 ld   (ix+$01),$C0
47E7: DD 36 0A 04 ld   (ix+$0a),$04
47EB: 18 D9       jr   $47C6

4816: 3A BE 92    ld   a,($92BE)
4819: A7          and  a
481A: C2 BA 48    jp   nz,$48BA
481D: 3A 05 96    ld   a,($9605)
4820: A7          and  a
4821: C8          ret  z
4822: 3A DE 92    ld   a,($92DE)
4825: A7          and  a
4826: C8          ret  z
4827: 3A CE 92    ld   a,($92CE)
482A: A7          and  a
482B: C0          ret  nz
482C: 3A 10 96    ld   a,($9610)
482F: FE 03       cp   $03
4831: D8          ret  c
4832: DD 2A 11 96 ld   ix,($9611)
4836: FD 2A 13 96 ld   iy,($9613)
483A: FD 36 00 FF ld   (iy+$00),$FF
483E: DD 36 01 FF ld   (ix+$01),$FF
4842: DD 36 04 00 ld   (ix+$04),$00
4846: DD 36 0B 00 ld   (ix+$0b),$00
484A: DD 36 0C 1E ld   (ix+$0c),$1E
484E: DD 36 0D C0 ld   (ix+$0d),$C0
4852: 3A 00 94    ld   a,($9400)
4855: 07          rlca
4856: 07          rlca
4857: E6 01       and  $01
4859: 4F          ld   c,a
485A: 21 0A 90    ld   hl,$900A
485D: 06 00       ld   b,$00
485F: 09          add  hl,bc
4860: 7E          ld   a,(hl)
4861: 32 2E 93    ld   ($932E),a
4864: C6 10       add  a,$10
4866: FD 77 03    ld   (iy+$03),a
4869: CD 1C 4B    call $4B1C
486C: DD 2A 15 96 ld   ix,($9615)
4870: FD 2A 17 96 ld   iy,($9617)
4874: DD 36 01 FF ld   (ix+$01),$FF
4878: DD 36 04 01 ld   (ix+$04),$01
487C: DD 36 0B 00 ld   (ix+$0b),$00
4880: DD 36 0C 1E ld   (ix+$0c),$1E
4884: DD 36 0D C0 ld   (ix+$0d),$C0
4888: FD 36 00 FF ld   (iy+$00),$FF
488C: 3A 2E 93    ld   a,($932E)
488F: C6 F0       add  a,$F0
4891: FD 77 03    ld   (iy+$03),a
4894: CD 1C 4B    call $4B1C
4897: DD 2A 19 96 ld   ix,($9619)
489B: FD 2A 1B 96 ld   iy,($961B)
489F: FD 36 00 FF ld   (iy+$00),$FF
48A3: DD 36 01 FF ld   (ix+$01),$FF
48A7: DD 36 04 02 ld   (ix+$04),$02
48AB: 3E FF       ld   a,$FF
48AD: 32 BE 92    ld   ($92BE),a
48B0: 3A 50 30    ld   a,($3050)
48B3: 32 FE 92    ld   ($92FE),a
48B6: C3 1C 5D    jp   $5D1C

48BA: DD 2A 11 96 ld   ix,($9611)
48BE: FD 2A 13 96 ld   iy,($9613)
48C2: CD 54 49    call $4954
48C5: FD 7E 00    ld   a,(iy+$00)
48C8: 32 3E 93    ld   ($933E),a
48CB: DD 2A 15 96 ld   ix,($9615)
48CF: FD 2A 17 96 ld   iy,($9617)
48D3: CD 54 49    call $4954
48D6: DD 2A 19 96 ld   ix,($9619)
48DA: FD 2A 1B 96 ld   iy,($961B)
48DE: 3A FE 92    ld   a,($92FE)
48E1: FE 02       cp   $02
48E3: 38 4E       jr   c,$4933
48E5: CD 1C 4B    call $4B1C
48E8: FD CB 01 E6 set  4,(iy+$01)
48EC: 3A 00 90    ld   a,($9000)
48EF: 3C          inc  a
48F0: 20 08       jr   nz,$48FA		; this is a bogus jump!
48F2: 3A 00 94    ld   a,($9400)
48F5: E6 07       and  $07
48F7: 20 07       jr   nz,$4900
48F9: 3A 00 90    ld   a,($9000)
; game jumps here in the middle of the prev instruction ???
;48FA: ??????????? nop
;48FB: ??????????? sub  b
48FC: 3C          inc  a
48FD: CC 04 5D    call z,$5D04
4900: 3A 00 94    ld   a,($9400)
4903: E6 07       and  $07
4905: 87          add  a,a
4906: 87          add  a,a
4907: D6 10       sub  $10
4909: 47          ld   b,a
490A: 3A 2E 93    ld   a,($932E)
490D: 80          add  a,b
490E: FD 77 03    ld   (iy+$03),a
4911: 3A 3E 93    ld   a,($933E)
4914: FD 77 00    ld   (iy+$00),a
4917: FE 30       cp   $30
4919: D0          ret  nc
491A: FE 20       cp   $20
491C: D8          ret  c
491D: 3A 00 90    ld   a,($9000)
4920: 3C          inc  a
4921: C0          ret  nz
4922: 3A 01 90    ld   a,($9001)
4925: FD 96 03    sub  (iy+$03)
4928: C6 09       add  a,$09
492A: FE 13       cp   $13
492C: D0          ret  nc
492D: 3E F0       ld   a,$F0    ; [uncovered] 
492F: 32 00 90    ld   ($9000),a    ; [uncovered] 
4932: C9          ret    ; [uncovered] 

4933: DD 36 01 00 ld   (ix+$01),$00
4937: FD 36 00 00 ld   (iy+$00),$00
493B: C9          ret

4954: DD 7E 01    ld   a,(ix+$01)
4957: A7          and  a
4958: C8          ret  z
4959: 3C          inc  a
495A: C2 37 4A    jp   nz,$4A37
495D: DD 5E 02    ld   e,(ix+$02)
4960: FD 7E 00    ld   a,(iy+$00)
4963: FE 20       cp   $20
4965: DA B0 49    jp   c,$49B0
4968: 57          ld   d,a
4969: FD 66 00    ld   h,(iy+$00)
496C: DD 6E 03    ld   l,(ix+$03)
496F: 11 C0 FE    ld   de,$FEC0
4972: 19          add  hl,de
4973: FD 74 00    ld   (iy+$00),h
4976: DD 77 03    ld   (ix+$03),a
4979: CD 1C 4B    call $4B1C
497C: DD 7E 04    ld   a,(ix+$04)
497F: 3D          dec  a
4980: 28 08       jr   z,$498A
4982: FD 7E 02    ld   a,(iy+$02)
4985: EE C0       xor  $C0
4987: FD 77 02    ld   (iy+$02),a
498A: FD 7E 00    ld   a,(iy+$00)
498D: FE 30       cp   $30
498F: 30 26       jr   nc,$49B7
4991: FE 20       cp   $20
4993: D8          ret  c
4994: 3A 01 90    ld   a,($9001)
4997: FD 96 03    sub  (iy+$03)
499A: C6 06       add  a,$06
499C: FE 0D       cp   $0D
499E: D0          ret  nc
499F: 3E F0       ld   a,$F0    ; [uncovered] 
49A1: 32 00 90    ld   ($9000),a    ; [uncovered] 
49A4: DD 36 01 20 ld   (ix+$01),$20
49A8: 2A 1B 96    ld   hl,($961B)
49AB: 36 00       ld   (hl),$00
49AD: C3 22 5D    jp   $5D22

49B0: 21 FE 92    ld   hl,$92FE
49B3: 35          dec  (hl)
49B4: C3 86 4A    jp   $4A86

49B7: 3A 00 94    ld   a,($9400)
49BA: E6 01       and  $01
49BC: 47          ld   b,a
49BD: DD 7E 04    ld   a,(ix+$04)
49C0: B8          cp   b
49C1: C0          ret  nz
49C2: 21 00 93    ld   hl,$9300
49C5: 11 00 99    ld   de,$9900
49C8: CD DE 49    call $49DE
49CB: A7          and  a
49CC: C0          ret  nz
49CD: 21 10 93    ld   hl,$9310
49D0: 11 08 99    ld   de,$9908
49D3: CD DE 49    call $49DE
49D6: A7          and  a
49D7: C0          ret  nz
49D8: 21 20 93    ld   hl,$9320
49DB: 11 10 99    ld   de,$9910
49DE: 7E          ld   a,(hl)
49DF: FE FE       cp   $FE
49E1: 38 52       jr   c,$4A35
49E3: 3D          dec  a
49E4: 28 02       jr   z,$49E8
49E6: 18 31       jr   $4A19

4A04: 21 00 80    ld   hl,$8000
4A07: 01 00 04    ld   bc,$0400
4A0A: 16 02       ld   d,$02
4A0C: 72          ld   (hl),d
4A0D: 23          inc  hl
4A0E: 0B          dec  bc
4A0F: 79          ld   a,c
4A10: B0          or   b
4A11: 20 F9       jr   nz,$4A0C
4A13: 32 00 C0    ld   ($C000),a
4A16: C3 54 58    jp   $5854

4A19: EB          ex   de,hl
4A1A: 7E          ld   a,(hl)
4A1B: FD 96 00    sub  (iy+$00)
4A1E: FE 0C       cp   $0C
4A20: 30 13       jr   nc,$4A35
4A22: 2C          inc  l
4A23: 2C          inc  l
4A24: 2C          inc  l
4A25: 7E          ld   a,(hl)
4A26: FD 96 03    sub  (iy+$03)
4A29: C6 05       add  a,$05
4A2B: FE 10       cp   $10
4A2D: 30 06       jr   nc,$4A35
4A2F: EB          ex   de,hl
4A30: 36 F0       ld   (hl),$F0
4A32: C3 A4 49    jp   $49A4

4A35: AF          xor  a
4A36: C9          ret

4A37: DD 35 01    dec  (ix+$01)
4A3A: 28 42       jr   z,$4A7E
4A3C: FD 7E 02    ld   a,(iy+$02)
4A3F: FE 48       cp   $48
4A41: C8          ret  z
4A42: FE 88       cp   $88
4A44: C8          ret  z
4A45: 3A 00 94    ld   a,($9400)
4A48: E6 07       and  $07
4A4A: FD 77 02    ld   (iy+$02),a
4A4D: DD 5E 02    ld   e,(ix+$02)
4A50: FD 56 00    ld   d,(iy+$00)
4A53: 21 70 FF    ld   hl,$FF70
4A56: 19          add  hl,de
4A57: DD 75 02    ld   (ix+$02),l
4A5A: FD 74 00    ld   (iy+$00),h
4A5D: DD 7E 01    ld   a,(ix+$01)
4A60: FE 10       cp   $10
4A62: 28 16       jr   z,$4A7A
4A64: FE 1F       cp   $1F
4A66: C0          ret  nz
4A67: 06 01       ld   b,$01
4A69: FD 7E 00    ld   a,(iy+$00)
4A6C: 07          rlca
4A6D: 07          rlca
4A6E: E6 03       and  $03
4A70: 87          add  a,a
4A71: 80          add  a,b
4A72: 21 B3 4A    ld   hl,$4AB3
4A75: CF          rst  $08
4A76: FD 77 01    ld   (iy+$01),a
4A79: C9          ret

4A7A: 06 00       ld   b,$00
4A7C: 18 EB       jr   $4A69

4A7E: 21 FE 92    ld   hl,$92FE
4A81: 35          dec  (hl)
4A82: 11 03 04    ld   de,$0403
4A85: FF          rst  $38
4A86: CD 16 5D    call $5D16
4A89: DD 36 00 00 ld   (ix+$00),$00
4A8D: DD 36 01 00 ld   (ix+$01),$00
4A91: FD 36 00 00 ld   (iy+$00),$00
4A95: FD 36 03 00 ld   (iy+$03),$00
4A99: 3A FE 92    ld   a,($92FE)
4A9C: A7          and  a
4A9D: C0          ret  nz
4A9E: 3A EE 92    ld   a,($92EE)
4AA1: 32 CE 92    ld   ($92CE),a
4AA4: AF          xor  a
4AA5: 32 BE 92    ld   ($92BE),a
4AA8: 2A 17 96    ld   hl,($9617)
4AAB: 36 00       ld   (hl),$00
4AAD: 2A 13 96    ld   hl,($9613)
4AB0: 36 00       ld   (hl),$00
4AB2: C9          ret

4B1C: FD 7E 03    ld   a,(iy+$03)
4B1F: 47          ld   b,a
4B20: 07          rlca
4B21: 07          rlca
4B22: E6 03       and  $03
4B24: 21 44 4B    ld   hl,$4B44
4B27: CF          rst  $08
4B28: FD 77 02    ld   (iy+$02),a
4B2B: FD 7E 00    ld   a,(iy+$00)
4B2E: 0F          rrca
4B2F: 0F          rrca
4B30: 0F          rrca
4B31: E6 18       and  $18
4B33: 4F          ld   c,a
4B34: 78          ld   a,b
4B35: 0F          rrca
4B36: 0F          rrca
4B37: 0F          rrca
4B38: 0F          rrca
4B39: E6 07       and  $07
4B3B: 81          add  a,c
4B3C: 21 48 4B    ld   hl,$4B48
4B3F: CF          rst  $08
4B40: FD 77 01    ld   (iy+$01),a
4B43: C9          ret

4B68: 3A 0B 96    ld   a,($960B)
4B6B: 0F          rrca
4B6C: 0F          rrca
4B6D: E6 07       and  $07
4B6F: F7          rst  $30

4B7C: 3A 69 96    ld   a,($9669)
4B7F: A7          and  a
4B80: CA 4C 0F    jp   z,$0F4C
4B83: 3A 00 94    ld   a,($9400)
4B86: 47          ld   b,a
4B87: E6 1F       and  $1F
4B89: C0          ret  nz
4B8A: 3A 69 96    ld   a,($9669)
4B8D: A7          and  a
4B8E: C8          ret  z
4B8F: 3A 2C 94    ld   a,($942C)
4B92: FE 04       cp   $04
4B94: D8          ret  c
4B95: FE 08       cp   $08
4B97: 38 02       jr   c,$4B9B
4B99: BF          cp   a
4B9A: D8          ret  c
4B9B: 3A 62 96    ld   a,($9662)
4B9E: E6 01       and  $01
4BA0: 28 0B       jr   z,$4BAD
4BA2: 1E 06       ld   e,$06    ; [uncovered] 
4BA4: CB 68       bit  5,b    ; [uncovered] 
4BA6: 28 10       jr   z,$4BB8    ; [uncovered] 
4BA8: 16 01       ld   d,$01    ; [uncovered] 
4BAA: C3 38 00    jp   $0038    ; [uncovered] 

4BAD: 1E 05       ld   e,$05
4BAF: CB 68       bit  5,b
4BB1: 28 05       jr   z,$4BB8
4BB3: 16 01       ld   d,$01
4BB5: C3 38 00    jp   $0038

4BB8: 16 03       ld   d,$03
4BBA: C3 38 00    jp   $0038

4BBD: 21 68 11    ld   hl,$1168
4BC0: 3A B4 15    ld   a,($15B4)
4BC3: 47          ld   b,a
4BC4: 11 40 98    ld   de,$9840
4BC7: C3 04 4D    jp   $4D04

4C00: CD 07 02    call $0207
4C03: C0          ret  nz
4C04: 3E 01       ld   a,$01
4C06: 32 FF A7    ld   ($A7FF),a
4C09: CD 00 14    call $1400
4C0C: CD B8 3A    call $3AB8
4C0F: 11 04 01    ld   de,$0104
4C12: FF          rst  $38
4C13: 1C          inc  e
4C14: FF          rst  $38
4C15: 21 00 01    ld   hl,$0100
4C18: 06 00       ld   b,$00
4C1A: AF          xor  a
4C1B: AE          xor  (hl)
4C1C: 23          inc  hl
4C1D: 10 FC       djnz $4C1B
4C1F: D6 A9       sub  $A9
4C21: C2 66 00    jp   nz,$0066
4C24: CD 55 07    call $0755
4C27: CD 69 07    call $0769
4C2A: AF          xor  a
4C2B: 32 2C 94    ld   ($942C),a
4C2E: 3C          inc  a
4C2F: 32 2B 94    ld   ($942B),a
4C32: 3A 40 94    ld   a,($9440)
4C35: A7          and  a
4C36: 20 06       jr   nz,$4C3E
4C38: 11 07 01    ld   de,$0107
4C3B: C3 38 00    jp   $0038

4C54: CD 31 38    call $3831
4C57: CD 43 0E    call $0E43
4C5A: CD 07 02    call $0207
4C5D: C0          ret  nz
4C5E: CD 88 5C    call $5C88
4C61: 11 00 01    ld   de,$0100
4C64: FF          rst  $38
4C65: 1C          inc  e
4C66: FF          rst  $38
4C67: 1E 0C       ld   e,$0C
4C69: FF          rst  $38
4C6A: 16 07       ld   d,$07
4C6C: FF          rst  $38
4C6D: 21 50 0D    ld   hl,$0D50
4C70: 7D          ld   a,l
4C71: 44          ld   b,h
4C72: 86          add  a,(hl)
4C73: 23          inc  hl
4C74: 10 FC       djnz $4C72
4C76: FE 90       cp   $90
4C78: C2 92 01    jp   nz,$0192
4C7B: CD 3E 14    call $143E
4C7E: 21 15 94    ld   hl,$9415
4C81: AF          xor  a
4C82: 06 05       ld   b,$05
4C84: 77          ld   (hl),a
4C85: 23          inc  hl
4C86: 10 FC       djnz $4C84
4C88: 36 03       ld   (hl),$03
4C8A: ED 5B 13 94 ld   de,($9413)
4C8E: 3A 19 94    ld   a,($9419)
4C91: 21 DC 4D    ld   hl,$4DDC
4C94: CF          rst  $08
4C95: 12          ld   (de),a
4C96: CB 92       res  2,d
4C98: 1A          ld   a,(de)
4C99: 32 10 94    ld   ($9410),a
4C9C: C3 0B 08    jp   $080B

4CEA: 21 AD 85    ld   hl,$85AD
4CED: 11 9D 43    ld   de,$439D
4CF0: 3A 0F 07    ld   a,($070F)
4CF3: 47          ld   b,a
4CF4: 3A 54 0F    ld   a,($0F54)
4CF7: 4F          ld   c,a
4CF8: CD 77 4E    call $4E77
4CFB: 11 18 98    ld   de,$9818
4CFE: 21 69 4D    ld   hl,$4D69
4D01: 3E 12       ld   a,$12
4D03: 47          ld   b,a
4D04: 3E 01       ld   a,$01
4D06: 32 FC A7    ld   ($A7FC),a
4D09: 3A 07 94    ld   a,($9407)
4D0C: A7          and  a
4D0D: 20 13       jr   nz,$4D22
4D0F: 7E          ld   a,(hl)
4D10: 12          ld   (de),a
4D11: 23          inc  hl
4D12: 13          inc  de
4D13: 7E          ld   a,(hl)
4D14: 12          ld   (de),a
4D15: 23          inc  hl
4D16: 13          inc  de
4D17: 7E          ld   a,(hl)
4D18: 12          ld   (de),a
4D19: 23          inc  hl
4D1A: 13          inc  de
4D1B: 7E          ld   a,(hl)
4D1C: 12          ld   (de),a
4D1D: 23          inc  hl
4D1E: 13          inc  de
4D1F: 10 EE       djnz $4D0F
4D21: C9          ret

4E27: 3A D4 0D    ld   a,($0DD4)
4E2A: CD E4 07    call $07E4
4E2D: 3A 09 96    ld   a,($9609)
4E30: 47          ld   b,a
4E31: 04          inc  b
4E32: 3A 95 12    ld   a,($1295)
4E35: C6 01       add  a,$01
4E37: 27          daa
4E38: 10 FB       djnz $4E35
4E3A: 21 40 00    ld   hl,$0040
4E3D: 19          add  hl,de
4E3E: EB          ex   de,hl
4E3F: 0E 05       ld   c,$05
4E41: CD FF 16    call $16FF
4E44: C9          ret

4E45: 3A E0 C0    ld   a,($C0E0)
4E48: 2F          cpl
4E49: 32 31 94    ld   ($9431),a
4E4C: C3 19 10    jp   $1019

4E77: 78          ld   a,b
4E78: 08          ex   af,af'
4E79: 1A          ld   a,(de)
4E7A: 13          inc  de
4E7B: 77          ld   (hl),a
4E7C: 1A          ld   a,(de)
4E7D: 13          inc  de
4E7E: CB 94       res  2,h
4E80: 77          ld   (hl),a
4E81: CB D4       set  2,h
4E83: 23          inc  hl
4E84: 10 F3       djnz $4E79
4E86: 0D          dec  c
4E87: C8          ret  z
4E88: 08          ex   af,af'
4E89: 47          ld   b,a
4E8A: 08          ex   af,af'
4E8B: 3A 16 12    ld   a,($1216)
4E8E: 90          sub  b
4E8F: DF          rst  $18
4E90: 18 E7       jr   $4E79

4E92: AF          xor  a
4E93: 32 FC A7    ld   ($A7FC),a
4E96: 21 AD 85    ld   hl,$85AD
4E99: 11 1A 00    ld   de,$001A
4E9C: 0E 06       ld   c,$06
4E9E: 3E 06       ld   a,$06
4EA0: 47          ld   b,a
4EA1: 36 83       ld   (hl),$83
4EA3: CB 94       res  2,h
4EA5: 36 00       ld   (hl),$00
4EA7: CB D4       set  2,h
4EA9: 2C          inc  l
4EAA: 10 F5       djnz $4EA1
4EAC: 19          add  hl,de
4EAD: 0D          dec  c
4EAE: 20 EE       jr   nz,$4E9E
4EB0: 21 10 98    ld   hl,$9810
4EB3: 3E 0A       ld   a,$0A
4EB5: 47          ld   b,a
4EB6: 11 08 00    ld   de,$0008
4EB9: 36 00       ld   (hl),$00
4EBB: 19          add  hl,de
4EBC: 10 FB       djnz $4EB9
4EBE: C9          ret

4EBF: 21 6F 4F    ld   hl,$4F6F
4EC2: C3 DB 4E    jp   $4EDB

4EC5: 21 6F 4F    ld   hl,$4F6F
4EC8: C3 37 4F    jp   $4F37

4ECB: 3A 0A 96    ld   a,($960A)
4ECE: 87          add  a,a
4ECF: 21 A2 44    ld   hl,$44A2
4ED2: 85          add  a,l
4ED3: 6F          ld   l,a
4ED4: 30 01       jr   nc,$4ED7
4ED6: 24          inc  h    ; [uncovered] 
4ED7: 5E          ld   e,(hl)
4ED8: 23          inc  hl
4ED9: 56          ld   d,(hl)
4EDA: EB          ex   de,hl
4EDB: DD 7E 01    ld   a,(ix+$01)
4EDE: C6 04       add  a,$04
4EE0: 01 F0 FF    ld   bc,$FFF0
4EE3: FE 40       cp   $40
4EE5: 30 03       jr   nc,$4EEA
4EE7: 01 30 00    ld   bc,$0030
4EEA: 0F          rrca
4EEB: 0F          rrca
4EEC: E6 3E       and  $3E
4EEE: DF          rst  $18
4EEF: 5E          ld   e,(hl)
4EF0: 23          inc  hl
4EF1: 56          ld   d,(hl)
4EF2: 09          add  hl,bc
4EF3: 46          ld   b,(hl)
4EF4: 2B          dec  hl
4EF5: 4E          ld   c,(hl)
4EF6: DD 6E 02    ld   l,(ix+$02)
4EF9: FD 66 03    ld   h,(iy+$03)
4EFC: 19          add  hl,de
4EFD: FD 74 03    ld   (iy+$03),h
4F00: DD 75 02    ld   (ix+$02),l
4F03: DD 6E 03    ld   l,(ix+$03)
4F06: FD 66 00    ld   h,(iy+$00)
4F09: 09          add  hl,bc
4F0A: FD 74 00    ld   (iy+$00),h
4F0D: DD 75 03    ld   (ix+$03),l
4F10: C9          ret

4F11: 21 92 50    ld   hl,$5092
4F14: 18 C5       jr   $4EDB

4F16: 3A AE 91    ld   a,($91AE)
4F19: A7          and  a
4F1A: 20 F5       jr   nz,$4F11
4F1C: 3A 78 94    ld   a,($9478)
4F1F: A7          and  a
4F20: 20 05       jr   nz,$4F27
4F22: 3A 0B 96    ld   a,($960B)
4F25: 18 03       jr   $4F2A

4F2A: 87          add  a,a
4F2B: 21 B9 37    ld   hl,$37B9
4F2E: 85          add  a,l
4F2F: 6F          ld   l,a
4F30: 30 01       jr   nc,$4F33
4F32: 24          inc  h    ; [uncovered] 
4F33: 5E          ld   e,(hl)
4F34: 23          inc  hl
4F35: 56          ld   d,(hl)
4F36: EB          ex   de,hl
4F37: DD 7E 01    ld   a,(ix+$01)
4F3A: C6 04       add  a,$04
4F3C: 01 F0 FF    ld   bc,$FFF0
4F3F: FE 40       cp   $40
4F41: 30 03       jr   nc,$4F46
4F43: 01 30 00    ld   bc,$0030
4F46: 0F          rrca
4F47: 0F          rrca
4F48: E6 3E       and  $3E
4F4A: DF          rst  $18
4F4B: 5E          ld   e,(hl)
4F4C: 23          inc  hl
4F4D: 56          ld   d,(hl)
4F4E: 09          add  hl,bc
4F4F: 46          ld   b,(hl)
4F50: 2B          dec  hl
4F51: 4E          ld   c,(hl)
4F52: DD 6E 02    ld   l,(ix+$02)
4F55: FD 66 03    ld   h,(iy+$03)
4F58: 19          add  hl,de
4F59: 19          add  hl,de
4F5A: FD 74 03    ld   (iy+$03),h
4F5D: DD 75 02    ld   (ix+$02),l
4F60: DD 6E 03    ld   l,(ix+$03)
4F63: FD 66 00    ld   h,(iy+$00)
4F66: 09          add  hl,bc
4F67: 09          add  hl,bc
4F68: FD 74 00    ld   (iy+$00),h
4F6B: DD 75 03    ld   (ix+$03),l
4F6E: C9          ret

4FAF: CD 9A 00    call $009A
4FB2: 32 00 C0    ld   ($C000),a
4FB5: 21 00 00    ld   hl,$0000
4FB8: 3A 00 00    ld   a,($0000)
4FBB: 86          add  a,(hl)
4FBC: 23          inc  hl
4FBD: 08          ex   af,af'
4FBE: 7C          ld   a,h
4FBF: FE 60       cp   $60
4FC1: 30 06       jr   nc,$4FC9
4FC3: 08          ex   af,af'
4FC4: 32 00 C0    ld   ($C000),a
4FC7: 18 F2       jr   $4FBB

4FC9: 08          ex   af,af'
4FCA: D6 00       sub  $00
4FCC: C2 CC 4F    jp   nz,$4FCC
4FCF: C3 6E 06    jp   $066E

52C3: CD 28 14    call $1428
52C6: 32 00 C0    ld   ($C000),a
52C9: C3 BE 20    jp   $20BE

57DC: 21 00 90    ld   hl,$9000
57DF: 11 01 90    ld   de,$9001
57E2: 01 FF 07    ld   bc,$07FF
57E5: 36 00       ld   (hl),$00
57E7: ED B0       ldir
57E9: 32 00 C0    ld   ($C000),a
57EC: C3 10 30    jp   $3010

5854: 21 00 84    ld   hl,$8400
5857: 01 00 04    ld   bc,$0400
585A: 16 83       ld   d,$83
585C: 72          ld   (hl),d
585D: 23          inc  hl
585E: 0B          dec  bc
585F: 79          ld   a,c
5860: B0          or   b
5861: 20 F9       jr   nz,$585C
5863: 21 00 95    ld   hl,$9500
5866: 06 40       ld   b,$40
5868: 36 FF       ld   (hl),$FF
586A: 23          inc  hl
586B: 10 FB       djnz $5868
586D: C3 80 09    jp   $0980

590E: 3A 00 90    ld   a,($9000)
5911: 3C          inc  a
5912: C0          ret  nz
5913: 3A 00 94    ld   a,($9400)
5916: E6 01       and  $01
5918: CA D7 59    jp   z,$59D7
591B: CD 21 59    call $5921
591E: CD 43 59    call $5943
5921: 3A 01 90    ld   a,($9001)
5924: 67          ld   h,a
5925: 2E 28       ld   l,$28
5927: 16 04       ld   d,$04
5929: 1E 09       ld   e,$09
592B: 01 04 00    ld   bc,$0004
592E: D9          exx
592F: 11 10 00    ld   de,$0010
5932: 06 08       ld   b,$08
5934: 21 30 93    ld   hl,$9330
5937: FD 21 18 99 ld   iy,$9918
593B: CD 79 5B    call $5B79
593E: C8          ret  z
593F: 32 00 90    ld   ($9000),a
5942: C9          ret

5943: 3A AE 91    ld   a,($91AE)
5946: A7          and  a
5947: C0          ret  nz
5948: DD 21 10 90 ld   ix,$9010
594C: FD 21 10 98 ld   iy,$9810
5950: 06 0A       ld   b,$0A
5952: 3A 5E 91    ld   a,($915E)
5955: A7          and  a
5956: 28 02       jr   z,$595A
5958: 06 09       ld   b,$09
595A: D9          exx
595B: 11 08 00    ld   de,$0008
595E: 01 10 00    ld   bc,$0010
5961: D9          exx
5962: 26 24       ld   h,$24
5964: 2E 0D       ld   l,$0D
5966: 3A 01 90    ld   a,($9001)
5969: D6 05       sub  $05
596B: 57          ld   d,a
596C: DD 7E 00    ld   a,(ix+$00)
596F: 3C          inc  a
5970: 20 22       jr   nz,$5994
5972: DD 7E 0A    ld   a,(ix+$0a)
5975: 3D          dec  a
5976: 28 1C       jr   z,$5994
5978: FD 7E 00    ld   a,(iy+$00)
597B: 94          sub  h
597C: BD          cp   l
597D: 30 15       jr   nc,$5994
597F: FD 7E 03    ld   a,(iy+$03)
5982: 92          sub  d
5983: BD          cp   l
5984: 30 0E       jr   nc,$5994
5986: 3E F0       ld   a,$F0
5988: DD 77 00    ld   (ix+$00),a
598B: 32 00 90    ld   ($9000),a
598E: 11 02 04    ld   de,$0402
5991: C3 38 00    jp   $0038

5994: D9          exx
5995: DD 09       add  ix,bc
5997: FD 19       add  iy,de
5999: D9          exx
599A: 10 D0       djnz $596C
599C: C9          ret

599D: 3A 00 C0    ld   a,($C000)
59A0: 2F          cpl
59A1: 4F          ld   c,a
59A2: E6 03       and  $03
59A4: C6 03       add  a,$03
59A6: FE 06       cp   $06
59A8: 20 02       jr   nz,$59AC
59AA: 3E FF       ld   a,$FF    ; [uncovered] 
59AC: 32 41 94    ld   ($9441),a
59AF: 79          ld   a,c
59B0: 0F          rrca
59B1: 0F          rrca
59B2: 4F          ld   c,a
59B3: E6 01       and  $01
59B5: 32 42 94    ld   ($9442),a
59B8: 79          ld   a,c
59B9: 0F          rrca
59BA: 4F          ld   c,a
59BB: E6 01       and  $01
59BD: 32 43 94    ld   ($9443),a
59C0: 79          ld   a,c
59C1: 0F          rrca
59C2: 4F          ld   c,a
59C3: E6 07       and  $07
59C5: 32 44 94    ld   ($9444),a
59C8: 79          ld   a,c
59C9: 0F          rrca
59CA: 0F          rrca
59CB: 0F          rrca
59CC: E6 01       and  $01
59CE: 32 46 94    ld   ($9446),a
59D1: 32 00 C0    ld   ($C000),a
59D4: C3 01 19    jp   $1901

59D7: 21 E7 59    ld   hl,$59E7
59DA: E5          push hl
59DB: 3A 00 93    ld   a,($9300)
59DE: 3C          inc  a
59DF: CA 04 5A    jp   z,$5A04
59E2: 3C          inc  a
59E3: CA 77 5A    jp   z,$5A77
59E6: E1          pop  hl
59E7: 21 F7 59    ld   hl,$59F7
59EA: E5          push hl
59EB: 3A 10 93    ld   a,($9310)
59EE: 3C          inc  a
59EF: CA 2A 5A    jp   z,$5A2A
59F2: 3C          inc  a
59F3: CA 9C 5A    jp   z,$5A9C
59F6: E1          pop  hl
59F7: 3A 20 93    ld   a,($9320)
59FA: 3C          inc  a
59FB: CA 50 5A    jp   z,$5A50
59FE: 3C          inc  a
59FF: C0          ret  nz
5A00: C3 C1 5A    jp   $5AC1

5A04: 16 03       ld   d,$03
5A06: 1E 07       ld   e,$07
5A08: 3A 03 99    ld   a,($9903)
5A0B: 67          ld   h,a
5A0C: 3A 00 99    ld   a,($9900)
5A0F: CD 00 5B    call $5B00
5A12: 20 0E       jr   nz,$5A22
5A14: 16 05       ld   d,$05
5A16: 1E 0B       ld   e,$0B
5A18: CD 53 5B    call $5B53
5A1B: C8          ret  z
5A1C: D5          push de
5A1D: 11 02 04    ld   de,$0402
5A20: FF          rst  $38
5A21: D1          pop  de
5A22: 32 00 93    ld   ($9300),a
5A25: AF          xor  a
5A26: 32 00 99    ld   ($9900),a
5A29: C9          ret

5A2A: 16 03       ld   d,$03
5A2C: 1E 07       ld   e,$07
5A2E: 3A 0B 99    ld   a,($990B)
5A31: 67          ld   h,a
5A32: 3A 08 99    ld   a,($9908)
5A35: CD 00 5B    call $5B00
5A38: 20 0E       jr   nz,$5A48
5A3A: 16 05       ld   d,$05
5A3C: 1E 0B       ld   e,$0B
5A3E: CD 53 5B    call $5B53
5A41: C8          ret  z
5A42: D5          push de
5A43: 11 02 04    ld   de,$0402
5A46: FF          rst  $38
5A47: D1          pop  de
5A48: 32 10 93    ld   ($9310),a
5A4B: AF          xor  a
5A4C: 32 08 99    ld   ($9908),a
5A4F: C9          ret

5A50: 16 03       ld   d,$03
5A52: 1E 07       ld   e,$07
5A54: 3A 13 99    ld   a,($9913)
5A57: 67          ld   h,a
5A58: 3A 10 99    ld   a,($9910)
5A5B: CD 00 5B    call $5B00
5A5E: C2 6F 5A    jp   nz,$5A6F
5A61: 16 05       ld   d,$05
5A63: 1E 0B       ld   e,$0B
5A65: CD 53 5B    call $5B53
5A68: C8          ret  z
5A69: D5          push de
5A6A: 11 02 04    ld   de,$0402
5A6D: FF          rst  $38
5A6E: D1          pop  de
5A6F: 32 20 93    ld   ($9320),a
5A72: AF          xor  a
5A73: 32 10 99    ld   ($9910),a
5A76: C9          ret

5A77: 16 05       ld   d,$05
5A79: 1E 10       ld   e,$10
5A7B: 3A 03 99    ld   a,($9903)
5A7E: 67          ld   h,a
5A7F: 3A 00 99    ld   a,($9900)
5A82: CD E6 5A    call $5AE6
5A85: 20 0A       jr   nz,$5A91
5A87: CD 66 5B    call $5B66
5A8A: C8          ret  z
5A8B: D5          push de
5A8C: 11 02 04    ld   de,$0402
5A8F: FF          rst  $38
5A90: D1          pop  de
5A91: 32 00 93    ld   ($9300),a
5A94: AF          xor  a
5A95: 32 00 99    ld   ($9900),a
5A98: 32 04 99    ld   ($9904),a
5A9B: C9          ret

5A9C: 16 05       ld   d,$05
5A9E: 1E 10       ld   e,$10
5AA0: 3A 0B 99    ld   a,($990B)
5AA3: 67          ld   h,a
5AA4: 3A 08 99    ld   a,($9908)
5AA7: CD E6 5A    call $5AE6
5AAA: 20 0A       jr   nz,$5AB6
5AAC: CD 66 5B    call $5B66
5AAF: C8          ret  z
5AB0: D5          push de
5AB1: 11 02 04    ld   de,$0402
5AB4: FF          rst  $38
5AB5: D1          pop  de
5AB6: 32 10 93    ld   ($9310),a
5AB9: AF          xor  a
5ABA: 32 08 99    ld   ($9908),a
5ABD: 32 0C 99    ld   ($990C),a
5AC0: C9          ret

5AC1: 16 05       ld   d,$05
5AC3: 1E 10       ld   e,$10
5AC5: 3A 13 99    ld   a,($9913)
5AC8: 67          ld   h,a
5AC9: 3A 10 99    ld   a,($9910)
5ACC: CD E6 5A    call $5AE6
5ACF: 20 0A       jr   nz,$5ADB
5AD1: CD 66 5B    call $5B66
5AD4: C8          ret  z
5AD5: D5          push de
5AD6: 11 02 04    ld   de,$0402
5AD9: FF          rst  $38
5ADA: D1          pop  de
5ADB: 32 20 93    ld   ($9320),a
5ADE: AF          xor  a
5ADF: 32 10 99    ld   ($9910),a
5AE2: 32 14 99    ld   ($9914),a
5AE5: C9          ret

5AE6: 6F          ld   l,a
5AE7: D6 EB       sub  $EB
5AE9: FE 0B       cp   $0B
5AEB: DA 1A 5B    jp   c,$5B1A
5AEE: 7D          ld   a,l
5AEF: D6 D3       sub  $D3
5AF1: FE 0B       cp   $0B
5AF3: DA 2D 5B    jp   c,$5B2D
5AF6: 7D          ld   a,l
5AF7: D6 BB       sub  $BB
5AF9: FE 0B       cp   $0B
5AFB: DA 40 5B    jp   c,$5B40
5AFE: AF          xor  a
5AFF: C9          ret

5B00: 6F          ld   l,a
5B01: D6 F0       sub  $F0
5B03: 82          add  a,d
5B04: BB          cp   e
5B05: DA 1A 5B    jp   c,$5B1A
5B08: 7D          ld   a,l
5B09: D6 D8       sub  $D8
5B0B: 82          add  a,d
5B0C: BB          cp   e
5B0D: DA 2D 5B    jp   c,$5B2D
5B10: 7D          ld   a,l
5B11: D6 C0       sub  $C0
5B13: 82          add  a,d
5B14: BB          cp   e
5B15: DA 40 5B    jp   c,$5B40
5B18: AF          xor  a
5B19: C9          ret

5B1A: 01 04 00    ld   bc,$0004
5B1D: D9          exx
5B1E: 21 B0 90    ld   hl,$90B0
5B21: 11 10 00    ld   de,$0010
5B24: 06 0C       ld   b,$0C
5B26: FD 21 60 98 ld   iy,$9860
5B2A: C3 9E 5B    jp   $5B9E

5B2D: 01 04 00    ld   bc,$0004
5B30: D9          exx
5B31: 21 70 91    ld   hl,$9170
5B34: 11 10 00    ld   de,$0010
5B37: 06 0C       ld   b,$0C
5B39: FD 21 90 98 ld   iy,$9890
5B3D: C3 9E 5B    jp   $5B9E

5B40: 01 04 00    ld   bc,$0004
5B43: D9          exx
5B44: 21 30 92    ld   hl,$9230
5B47: 11 10 00    ld   de,$0010
5B4A: 06 0C       ld   b,$0C
5B4C: FD 21 C0 98 ld   iy,$98C0
5B50: C3 9E 5B    jp   $5B9E

5B53: 01 08 00    ld   bc,$0008
5B56: D9          exx
5B57: 11 10 00    ld   de,$0010
5B5A: 06 0A       ld   b,$0A
5B5C: 21 10 90    ld   hl,$9010
5B5F: FD 21 10 98 ld   iy,$9810
5B63: C3 79 5B    jp   $5B79

5B66: 01 08 00    ld   bc,$0008
5B69: D9          exx
5B6A: 11 10 00    ld   de,$0010
5B6D: 06 0A       ld   b,$0A
5B6F: 21 10 90    ld   hl,$9010
5B72: FD 21 10 98 ld   iy,$9810
5B76: C3 C3 5B    jp   $5BC3

5B79: 7E          ld   a,(hl)
5B7A: 3C          inc  a
5B7B: C2 95 5B    jp   nz,$5B95
5B7E: D9          exx
5B7F: FD 7E 03    ld   a,(iy+$03)
5B82: 94          sub  h
5B83: 82          add  a,d
5B84: BB          cp   e
5B85: 30 0F       jr   nc,$5B96
5B87: FD 7E 00    ld   a,(iy+$00)
5B8A: 95          sub  l
5B8B: 82          add  a,d
5B8C: BB          cp   e
5B8D: 30 07       jr   nc,$5B96
5B8F: D9          exx
5B90: 3E F0       ld   a,$F0
5B92: 77          ld   (hl),a
5B93: A7          and  a
5B94: C9          ret

5B95: D9          exx
5B96: FD 09       add  iy,bc
5B98: D9          exx
5B99: 19          add  hl,de
5B9A: 10 DD       djnz $5B79
5B9C: AF          xor  a
5B9D: C9          ret

5B9E: 7E          ld   a,(hl)
5B9F: 3C          inc  a
5BA0: C2 B9 5B    jp   nz,$5BB9
5BA3: D9          exx
5BA4: FD 7E 03    ld   a,(iy+$03)
5BA7: 94          sub  h
5BA8: 82          add  a,d
5BA9: BB          cp   e
5BAA: 30 0E       jr   nc,$5BBA
5BAC: D9          exx
5BAD: 3E F0       ld   a,$F0
5BAF: 77          ld   (hl),a
5BB0: D9          exx
5BB1: D5          push de
5BB2: 11 01 04    ld   de,$0401
5BB5: FF          rst  $38
5BB6: D1          pop  de
5BB7: A7          and  a
5BB8: C9          ret

5BB9: D9          exx
5BBA: FD 09       add  iy,bc
5BBC: D9          exx
5BBD: 19          add  hl,de
5BBE: 10 DE       djnz $5B9E
5BC0: D9          exx
5BC1: AF          xor  a
5BC2: C9          ret

5BC3: 7E          ld   a,(hl)
5BC4: 3C          inc  a
5BC5: C2 E1 5B    jp   nz,$5BE1
5BC8: D9          exx
5BC9: FD 7E 03    ld   a,(iy+$03)
5BCC: 94          sub  h
5BCD: 82          add  a,d
5BCE: BB          cp   e
5BCF: 30 11       jr   nc,$5BE2
5BD1: FD 7E 00    ld   a,(iy+$00)
5BD4: 95          sub  l
5BD5: C6 05       add  a,$05
5BD7: FE 0B       cp   $0B
5BD9: 30 07       jr   nc,$5BE2
5BDB: D9          exx
5BDC: 3E F0       ld   a,$F0
5BDE: 77          ld   (hl),a
5BDF: A7          and  a
5BE0: C9          ret

5BE1: D9          exx
5BE2: FD 09       add  iy,bc
5BE4: D9          exx
5BE5: 19          add  hl,de
5BE6: 10 DB       djnz $5BC3
5BE8: AF          xor  a
5BE9: C9          ret

5C1F: 21 43 95    ld   hl,$9543
5C22: 7E          ld   a,(hl)
5C23: A7          and  a
5C24: C8          ret  z
5C25: 35          dec  (hl)
5C26: F5          push af
5C27: 23          inc  hl
5C28: 7E          ld   a,(hl)
5C29: CD 38 5C    call $5C38
5C2C: F1          pop  af
5C2D: C8          ret  z
5C2E: 3D          dec  a
5C2F: 06 00       ld   b,$00
5C31: 4F          ld   c,a
5C32: 5D          ld   e,l
5C33: 54          ld   d,h
5C34: 23          inc  hl
5C35: ED B0       ldir
5C37: C9          ret

5C38: 32 00 C1    ld   ($C100),a
5C3B: 32 80 C0    ld   ($C080),a
5C3E: C9          ret

5C3F: E5          push hl
5C40: F5          push af
5C41: 3A 69 96    ld   a,($9669)
5C44: A7          and  a
5C45: 20 16       jr   nz,$5C5D
5C47: F1          pop  af    ; [uncovered] 
5C48: E1          pop  hl    ; [uncovered] 
5C49: C9          ret    ; [uncovered] 

5C4A: E5          push hl
5C4B: F5          push af
5C4C: 3A 69 96    ld   a,($9669)
5C4F: A7          and  a
5C50: 20 0B       jr   nz,$5C5D
5C52: 3A 46 94    ld   a,($9446)
5C55: A7          and  a
5C56: 20 05       jr   nz,$5C5D
5C58: F1          pop  af    ; [uncovered] 
5C59: E1          pop  hl    ; [uncovered] 
5C5A: C9          ret    ; [uncovered] 

5C5B: E5          push hl
5C5C: F5          push af
5C5D: 21 43 95    ld   hl,$9543
5C60: 34          inc  (hl)
5C61: 7E          ld   a,(hl)
5C62: CF          rst  $08
5C63: F1          pop  af
5C64: 77          ld   (hl),a
5C65: E1          pop  hl
5C66: C9          ret

5C72: 3A 69 96    ld   a,($9669)
5C75: A7          and  a
5C76: 20 EF       jr   nz,$5C67
5C78: AF          xor  a
5C79: CD 5B 5C    call $5C5B
5C7C: 3A 8B 09    ld   a,($098B)
5C7F: C3 5B 5C    jp   $5C5B

5C82: 3A 27 0C    ld   a,($0C27)
5C85: C3 4A 5C    jp   $5C4A

5C88: 3A 1C 12    ld   a,($121C)
5C8B: C3 5B 5C    jp   $5C5B

5C8E: 3A F5 0D    ld   a,($0DF5)
5C91: C3 4A 5C    jp   $5C4A

5C94: 3A 51 0F    ld   a,($0F51)
5C97: C3 4A 5C    jp   $5C4A

5C9A: 3A F8 00    ld   a,($00F8)
5C9D: CD 5B 5C    call $5C5B
5CA0: 3A D4 06    ld   a,($06D4)
5CA3: C3 3F 5C    jp   $5C3F

5CA6: 3A 79 00    ld   a,($0079)
5CA9: C3 4A 5C    jp   $5C4A

5CAC: 3A 36 01    ld   a,($0136)
5CAF: C3 4A 5C    jp   $5C4A

5CB2: FD 7E 00    ld   a,(iy+$00)
5CB5: FE 60       cp   $60
5CB7: 38 21       jr   c,$5CDA
5CB9: FE B0       cp   $B0
5CBB: 38 0B       jr   c,$5CC8
5CBD: 3A 0E 91    ld   a,($910E)
5CC0: B7          or   a
5CC1: C0          ret  nz
5CC2: 3A 58 12    ld   a,($1258)
5CC5: C3 4A 5C    jp   $5C4A

5CC8: 3A 0E 91    ld   a,($910E)
5CCB: FE 17       cp   $17
5CCD: D0          ret  nc
5CCE: 3A 10 08    ld   a,($0810)
5CD1: 32 0E 91    ld   ($910E),a
5CD4: 3A B5 37    ld   a,($37B5)
5CD7: C3 4A 5C    jp   $5C4A

5CDA: 3A 00 38    ld   a,($3800)
5CDD: 32 0E 91    ld   ($910E),a
5CE0: 3A DD 01    ld   a,($01DD)
5CE3: C3 4A 5C    jp   $5C4A

5CE6: 3A 00 94    ld   a,($9400)
5CE9: E6 01       and  $01
5CEB: C8          ret  z
5CEC: 3A 5B 98    ld   a,($985B)
5CEF: 21 01 90    ld   hl,$9001
5CF2: 96          sub  (hl)
5CF3: C6 18       add  a,$18
5CF5: FE 31       cp   $31
5CF7: D0          ret  nc
5CF8: 3A 8A 09    ld   a,($098A)
5CFB: C3 4A 5C    jp   $5C4A

5CFE: 3A FC 06    ld   a,($06FC)
5D01: C3 4A 5C    jp   $5C4A

5D04: 3A 2E 93    ld   a,($932E)
5D07: 21 01 90    ld   hl,$9001
5D0A: 96          sub  (hl)
5D0B: C6 38       add  a,$38
5D0D: FE 71       cp   $71
5D0F: D0          ret  nc
5D10: 3A E1 0D    ld   a,($0DE1)
5D13: C3 4A 5C    jp   $5C4A

5D16: 3A 63 10    ld   a,($1063)
5D19: C3 5B 5C    jp   $5C5B

5D1C: 3A EC 40    ld   a,($40EC)
5D1F: C3 4A 5C    jp   $5C4A

5D22: FD 7E 00    ld   a,(iy+$00)
5D25: FE 60       cp   $60
5D27: 38 10       jr   c,$5D39
5D29: FE B0       cp   $B0
5D2B: 38 06       jr   c,$5D33
5D2D: 3A D6 0D    ld   a,($0DD6)
5D30: C3 4A 5C    jp   $5C4A

5D33: 3A B7 00    ld   a,($00B7)
5D36: C3 4A 5C    jp   $5C4A

5D39: 3A A0 00    ld   a,($00A0)
5D3C: C3 4A 5C    jp   $5C4A

5D3F: 3A F7 00    ld   a,($00F7)
5D42: C3 4A 5C    jp   $5C4A

5D45: FD 7E 00    ld   a,(iy+$00)
5D48: FE 60       cp   $60
5D4A: 38 10       jr   c,$5D5C
5D4C: FE B0       cp   $B0
5D4E: 38 06       jr   c,$5D56
5D50: 3A 24 2E    ld   a,($2E24)    ; [uncovered] 
5D53: C3 4A 5C    jp   $5C4A    ; [uncovered] 

5D56: 3A AC 32    ld   a,($32AC)
5D59: C3 4A 5C    jp   $5C4A

5D5C: 3A 7D 1B    ld   a,($1B7D)
5D5F: C3 4A 5C    jp   $5C4A

5D62: 3A A2 09    ld   a,($09A2)
5D65: C3 4A 5C    jp   $5C4A

5D68: 3A AA 09    ld   a,($09AA)
5D6B: C3 4A 5C    jp   $5C4A

5D6E: 3A 1C 12    ld   a,($121C)
5D71: CD 5B 5C    call $5C5B
5D74: 3A F9 09    ld   a,($09F9)
5D77: CD 5B 5C    call $5C5B
5D7A: 3A 84 40    ld   a,($4084)
5D7D: CD 4A 5C    call $5C4A
5D80: 3A 0E 39    ld   a,($390E)
5D83: C3 4A 5C    jp   $5C4A

5D86: 3A 95 4C    ld   a,($4C95)
5D89: C3 4A 5C    jp   $5C4A

5D8C: 3A 8C 4C    ld   a,($4C8C)
5D8F: C3 3F 5C    jp   $5C3F

5D9E: 3A BB 11    ld   a,($11BB)
5DA1: C3 3F 5C    jp   $5C3F

5DA4: 3A 32 0A    ld   a,($0A32)
5DA7: C3 3F 5C    jp   $5C3F

5DAA: 3A 11 14    ld   a,($1411)
5DAD: C3 3F 5C    jp   $5C3F

5DB0: 3A C5 00    ld   a,($00C5)
5DB3: C3 3F 5C    jp   $5C3F

5DB6: 3A 55 22    ld   a,($2255)
5DB9: C3 5B 5C    jp   $5C5B

5DBC: 3A FC 24    ld   a,($24FC)
5DBF: C3 5B 5C    jp   $5C5B

5DC2: 3A 03 12    ld   a,($1203)
5DC5: C3 5B 5C    jp   $5C5B

5DC8: 3A FF 08    ld   a,($08FF)
5DCB: C3 5B 5C    jp   $5C5B

5DCE: 3A 4F 15    ld   a,($154F)
5DD1: C3 5B 5C    jp   $5C5B

5DD4: 3A C5 23    ld   a,($23C5)
5DD7: C3 5B 5C    jp   $5C5B

5E1A: CD 88 5C    call $5C88
5E1D: CD D4 5D    call $5DD4
5E20: 3A 40 94    ld   a,($9440)
5E23: A7          and  a
5E24: C2 0B 08    jp   nz,$080B
5E27: CD 5A 13    call $135A
5E2A: C3 0B 08    jp   $080B

5F4D: CD 04 38    call $3804
5F50: CD 9A 5C    call $5C9A 
5F53: 21 10 90    ld   hl,$9010
5F56: 11 11 90    ld   de,$9011
5F59: 36 00       ld   (hl),$00
5F5B: 01 9F 03    ld   bc,$039F
5F5E: ED B0       ldir
5F60: 21 20 96    ld   hl,$9620
5F63: 11 21 96    ld   de,$9621
5F66: 36 00       ld   (hl),$00
5F68: 01 3F 00    ld   bc,$003F
5F6B: ED B0       ldir
5F6D: AF          xor  a
5F6E: 32 62 96    ld   ($9662),a
5F71: 67          ld   h,a
5F72: 6F          ld   l,a
5F73: 32 63 96    ld   ($9663),a
5F76: 32 66 96    ld   ($9666),a
5F79: 22 64 96    ld   ($9664),hl
5F7C: 22 67 96    ld   ($9667),hl
5F7F: 22 27 96    ld   ($9627),hl
5F82: 22 47 96    ld   ($9647),hl
5F85: 3A 41 94    ld   a,($9441)
5F88: 32 20 96    ld   ($9620),a
5F8B: 47          ld   b,a
5F8C: 3A 58 94    ld   a,($9458)
5F8F: A7          and  a
5F90: 28 04       jr   z,$5F96
5F92: 78          ld   a,b    ; [uncovered] 
5F93: 32 40 96    ld   ($9640),a    ; [uncovered] 
5F96: 11 00 04    ld   de,$0400
5F99: FF          rst  $38
5F9A: 3C          inc  a
5F9B: 32 2C 96    ld   ($962C),a
5F9E: 32 4C 96    ld   ($964C),a
5FA1: 3E 24       ld   a,$24
5FA3: 32 21 96    ld   ($9621),a
5FA6: 32 41 96    ld   ($9641),a
5FA9: 32 25 96    ld   ($9625),a
5FAC: 32 45 96    ld   ($9645),a
5FAF: 3A 44 94    ld   a,($9444)
5FB2: 3E 5A       ld   a,$5A
5FB4: 32 65 94    ld   ($9465),a
5FB7: CD 43 0E    call $0E43
5FBA: CD F2 3A    call $3AF2
5FBD: C3 0B 08    jp   $080B

