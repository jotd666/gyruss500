;	map(0x0000, 0x0000).r(FUNC(gyruss_state::scanline_r));
;	map(0x2000, 0x2000).w(FUNC(gyruss_state::slave_irq_mask_w)).nopr();
;	map(0x4000, 0x403f).ram();
;	map(0x4040, 0x40ff).ram().w(FUNC(gyruss_state::spriteram_w)).share(m_spriteram);
;	map(0x4100, 0x47ff).ram();
;	map(0x6000, 0x67ff).ram().share("main_cpus");
;	map(0xe000, 0xffff).rom();
;
;   to set a breakpoint: bpset $F00F:sub

irq_flag_2000 = 0x2000
sprite_ram_4040 = 0x4040
; mapped to A000 on the other CPU, so everything RAM over A000 on the other
; cpu is visible by this CPU
shared_memory_6000 = 0x6000
select_sprite_buffer_flag_6700 = 0x6700

m6809_reset:
F000: 7F 02 82    CLR    irq_flag_2000          ; disable interrupts                              
F003: CC 22 22    LDD    #$0000 				; active wait                                      
F006: B7 E5 DD    STA    $67F5
cpu_active_loop_f009:
F009: 4A          DECA
F00A: 26 75       BNE    cpu_active_loop_F009
F00C: 5A          DECB
F00D: 26 72       BNE    cpu_active_loop_F009
F00F: B6 45 D2    LDA    $67F0		; service mode??
F012: 81 83       CMPA   #$01
F014: 26 5D       BNE    $F095		; always branches

F016: CE 62 28    LDU    #$E000    ; [uncovered] 
F019: 4F          CLRA    ; [uncovered] 
F01A: 5F          CLRB    ; [uncovered] 
F01B: EB E8       ADDB   ,U+    ; [uncovered] 
F01D: 24 89       BCC    $F020    ; [uncovered] 
F01F: 4C          INCA    ; [uncovered] 
F020: 11 83 82 82 CMPU   #$0000    ; [uncovered] 
F024: 26 D7       BNE    $F01B    ; [uncovered] 
F026: B7 E5 DA    STA    $67F2    ; [uncovered] 
F029: F7 EF 7B    STB    $67F3    ; [uncovered] 
F02C: CE 68 88    LDU    #$4000    ; [uncovered] 
F02F: 86 2D       LDA    #$0F    ; [uncovered] 
F031: A7 42       STA    ,U+    ; [uncovered] 
F033: 11 83 6A 82 CMPU   #$4800    ; [uncovered] 
F037: 26 D0       BNE    $F031    ; [uncovered] 
F039: CE C8 88    LDU    #$4000    ; [uncovered] 
F03C: A6 E8       LDA    ,U+    ; [uncovered] 
F03E: 81 87       CMPA   #$0F    ; [uncovered] 
F040: 26 6B       BNE    $F08B    ; [uncovered] 
F042: 11 83 6A 22 CMPU   #$4800    ; [uncovered] 
F046: 26 76       BNE    $F03C    ; [uncovered] 
F048: CE 68 88    LDU    #$4000    ; [uncovered] 
F04B: 86 D8       LDA    #$F0    ; [uncovered] 
F04D: A7 48       STA    ,U+    ; [uncovered] 
F04F: 11 83 6A 82 CMPU   #$4800    ; [uncovered] 
F053: 26 DA       BNE    $F04D    ; [uncovered] 
F055: CE C2 82    LDU    #$4000    ; [uncovered] 
F058: A6 E8       LDA    ,U+    ; [uncovered] 
F05A: 81 78       CMPA   #$F0    ; [uncovered] 
F05C: 26 05       BNE    $F08B    ; [uncovered] 
F05E: 11 83 6A 22 CMPU   #$4800    ; [uncovered] 
F062: 26 76       BNE    $F058    ; [uncovered] 
F064: CE 62 82    LDU    #$4000    ; [uncovered] 
F067: 86 D7       LDA    #$FF    ; [uncovered] 
F069: A7 48       STA    ,U+    ; [uncovered] 
F06B: 11 83 60 88 CMPU   #$4800    ; [uncovered] 
F06F: 26 DA       BNE    $F069    ; [uncovered] 
F071: CE C2 82    LDU    #$4000    ; [uncovered] 
F074: A6 E2       LDA    ,U+    ; [uncovered] 
F076: 81 7D       CMPA   #$FF    ; [uncovered] 
F078: 26 39       BNE    $F08B    ; [uncovered] 
F07A: 11 83 60 28 CMPU   #$4800    ; [uncovered] 
F07E: 26 7C       BNE    $F074    ; [uncovered] 
F080: 86 22       LDA    #$00    ; [uncovered] 
F082: B7 E5 D6    STA    $67F4    ; [uncovered] 
F085: 4C          INCA    ; [uncovered] 
F086: B7 E5 DD    STA    $67F5    ; [uncovered] 
F089: 20 82       BRA    $F095    ; [uncovered] 

F095: 7F A2 82    CLR    irq_flag_2000		; clear interrupts (again)
; clear sprite ram
F098: CE 68 C8    LDU    #sprite_ram_4040
F09B: 8E 2C 28    LDX    #$0400
F09E: ED 49       STD    ,U++
F0A0: 30 3D       LEAX   -$1,X
F0A2: 26 78       BNE    $F09E
F0A4: 86 60       LDA    #$42
F0A6: 1F 09       TFR    A,DP
F0A8: 7F 08 88    CLR    irq_flag_2000
F0AB: 10 CE 60 88 LDS    #$4800
F0AF: 1C CD       ANDCC  #$EF
; enable interrupts
F0B1: 86 83       LDA    #$01
F0B3: B7 02 22    STA    irq_flag_2000
F0B6: 20 7C       BRA    $F0B6

; the IRQ
F0B8: 7F 08 88    CLR    irq_flag_2000		; ack IRQ
F0BB: B6 4F D7    LDA    $67FF
F0BE: 4C          INCA
F0BF: 10 27 22 1E LBEQ   $F15F
F0C3: B6 45 DD    LDA    $67FF
F0C6: 10 27 2C A8 LBEQ   $F54A
F0CA: B6 EF 29    LDA    $6701
F0CD: 27 73       BEQ    $F0CA
F0CF: B6 45 22    LDA    select_sprite_buffer_flag_6700
F0D2: 10 26 22 EF LBNE   $F1A3
F0D6: BD 76 CC    JSR    $F4E4
F0D9: 7F EC 88    CLR    $6400
F0DC: 7F 4C C8    CLR    $6440
F0DF: 7F 46 A2    CLR    $6480
F0E2: 7F E6 E2    CLR    $64C0
F0E5: CE E2 82    LDU    #shared_memory_6000
F0E8: DF 27       STU    $0F
F0EA: CE EC 28    LDU    #$6400
F0ED: DF 99       STU    $11
F0EF: B6 45 20    LDA    $6702
F0F2: 27 79       BEQ    $F0EF
F0F4: B6 45 7F    LDA    $67FD
F0F7: 26 44       BNE    $F165
F0F9: BD 7D EE    JSR    $F566
F0FC: BD DE 66    JSR    $F6EE
F0FF: BD D4 04    JSR    $F626
F102: BD 74 CC    JSR    $F6EE
F105: BD 77 0B    JSR    $F589
F108: BD DE 66    JSR    $F6EE
F10B: BD DD CF    JSR    $F5E7
F10E: BD 7E CC    JSR    $F6EE
F111: BD 77 71    JSR    $F5F3
F114: BD D4 6C    JSR    $F6EE
F117: BD DD D7    JSR    $F5FF
F11A: BD 7E C6    JSR    $F6EE
F11D: BD 7E 83    JSR    $F60B
F120: BD D4 6C    JSR    $F6EE
F123: BD D4 35    JSR    $F617
F126: BD 74 C6    JSR    $F6EE
F129: BD 7E BE    JSR    $F636
F12C: BD DE 66    JSR    $F6EE
F12F: BD D4 67    JSR    $F645
F132: BD 74 CC    JSR    $F6EE
F135: 86 AB       LDA    #$29
F137: C6 3F       LDB    #$17
F139: F1 EC 88    CMPB   $6400
F13C: 24 2B       BCC    $F141
F13E: F7 EC 22    STB    $6400    ; [uncovered] 
F141: B1 E6 C2    CMPA   $6440
F144: 24 21       BCC    $F149
F146: B7 E6 68    STA    $6440    ; [uncovered] 
F149: B1 EC 08    CMPA   $6480
F14C: 24 2B       BCC    $F151
F14E: B7 EC A2    STA    $6480    ; [uncovered] 
F151: F1 E6 42    CMPB   $64C0
F154: 24 21       BCC    $F159
F156: F7 E6 E8    STB    $64C0    ; [uncovered] 
F159: B6 88 88    LDA    >$0000
; at this point, A = $29, everytime!
F15C: B7 4F 98    STA    $6710
F15F: 86 23       LDA    #$01
F161: B7 A2 82    STA    irq_flag_2000	; enable interrupts
F164: 3B          RTI

F165: BD 77 E4    JSR    $F566
F168: BD DE 66    JSR    $F6EE
F16B: BD DE 48    JSR    $F660
F16E: BD 7E CC    JSR    $F6EE
F171: BD 77 0B    JSR    $F589
F174: BD D4 6C    JSR    $F6EE
F177: BD DD CF    JSR    $F5E7
F17A: BD 7E C6    JSR    $F6EE
F17D: BD 7D 7B    JSR    $F5F3
F180: BD D4 6C    JSR    $F6EE
F183: BD D7 DD    JSR    $F5FF
F186: BD 74 C6    JSR    $F6EE
F189: BD 7E 83    JSR    $F60B
F18C: BD DE 66    JSR    $F6EE
F18F: BD D4 73    JSR    $F651
F192: BD 74 CC    JSR    $F6EE
F195: BD 74 B4    JSR    $F636
F198: BD DE 66    JSR    $F6EE
F19B: BD DE 6D    JSR    $F645
F19E: BD 7E CC    JSR    $F6EE
F1A1: 20 10       BRA    $F135

F1A3: BD D6 A9    JSR    $F48B
F1A6: 7F E7 28    CLR    $6500
F1A9: 7F ED C8    CLR    $6540
F1AC: 7F 4D 08    CLR    $6580
F1AF: 7F 47 E2    CLR    $65C0
F1B2: CE E0 22    LDU    #$6200
F1B5: DF 8D       STU    $0F
F1B7: CE 4D 28    LDU    #$6500
F1BA: DF 99       STU    $11
F1BC: B6 4F 8A    LDA    $6702
F1BF: 27 D9       BEQ    $F1BC
F1C1: B6 E5 7F    LDA    $67FD
F1C4: 26 4E       BNE    $F232
F1C6: BD 77 4E    JSR    $F566
F1C9: BD 7E 1D    JSR    $F695
F1CC: BD DE AE    JSR    $F626
F1CF: BD D4 B7    JSR    $F695
F1D2: BD 77 AB    JSR    $F589
F1D5: BD 74 17    JSR    $F695
F1D8: BD DD 6F    JSR    $F5E7
F1DB: BD DE BD    JSR    $F695
F1DE: BD 7D D1    JSR    $F5F3
F1E1: BD 74 17    JSR    $F695
F1E4: BD D7 7D    JSR    $F5FF
F1E7: BD DE BD    JSR    $F695
F1EA: BD 7E 23    JSR    $F60B
F1ED: BD 7E 1D    JSR    $F695
F1F0: BD D4 95    JSR    $F617
F1F3: BD D4 B7    JSR    $F695
F1F6: BD 74 1E    JSR    $F636
F1F9: BD 7E 1D    JSR    $F695
F1FC: BD DE CD    JSR    $F645
F1FF: BD D4 B7    JSR    $F695
F202: 86 AB       LDA    #$29
F204: C6 35       LDB    #$17
F206: F1 E7 28    CMPB   $6500
F209: 24 8B       BCC    $F20E
F20B: F7 4D 28    STB    $6500    ; [uncovered] 
F20E: B1 ED 62    CMPA   $6540
F211: 24 81       BCC    $F216
F213: B7 47 62    STA    $6540    ; [uncovered] 
F216: B1 E7 A8    CMPA   $6580
F219: 24 8B       BCC    $F21E
F21B: B7 4D A8    STA    $6580    ; [uncovered] 
F21E: F1 ED E2    CMPB   $65C0
F221: 24 81       BCC    $F226
F223: F7 47 E2    STB    $65C0    ; [uncovered] 
F226: 86 83       LDA    #$01
F228: B7 08 88    STA    irq_flag_2000
F22B: B6 28 28    LDA    >$0000
; A (aka beamy) varies between $9A and $B4 (approx), rather end of frame
F22E: B7 EF 32    STA    $6710
F231: 3B          RTI

F232: BD 77 44    JSR    $F566
F235: BD 74 17    JSR    $F695
F238: BD DE E8    JSR    $F660
F23B: BD DE BD    JSR    $F695
F23E: BD 7D AB    JSR    $F589
F241: BD 74 17    JSR    $F695
F244: BD D7 65    JSR    $F5E7
F247: BD DE BD    JSR    $F695
F24A: BD 7D DB    JSR    $F5F3
F24D: BD 7E 1D    JSR    $F695
F250: BD D7 7D    JSR    $F5FF
F253: BD D4 B7    JSR    $F695
F256: BD 74 23    JSR    $F60B
F259: BD 7E 1D    JSR    $F695
F25C: BD DE D9    JSR    $F651
F25F: BD D4 B7    JSR    $F695
F262: BD 74 14    JSR    $F636
F265: BD 74 17    JSR    $F695
F268: BD DE CD    JSR    $F645
F26B: BD DE BD    JSR    $F695
F26E: 20 1A       BRA    $F202

F273: 8E C2 22    LDX    #$E000
F276: E6 46       LDB    ,U
F278: 27 73       BEQ    $F2D5
F27A: 4F          CLRA
F27B: A6 A3       LDA    D,X
F27D: 97 80       STA    $08
F27F: 8E C6 22    LDX    #$E400
F282: E6 C1       LDB    $3,U
F284: 4F          CLRA
F285: 58          ASLB
F286: 49          ROLA
F287: 30 A3       LEAX   D,X
F289: EC 01 8A 28 LDD    $0200,X
F28D: 2A 82       BPL    $F299
F28F: 96 2A       LDA    $08
F291: 3D          MUL
F292: 40          NEGA
F293: 2B 28       BMI    $F29F
F295: 27 8A       BEQ    $F29F
F297: 20 14       BRA    $F2D5    ; [uncovered] 

F299: 96 80       LDA    $08
F29B: 3D          MUL
F29C: 4D          TSTA
F29D: 2B BE       BMI    $F2D5
F29F: 8B 5E       ADDA   #$7C
F2A1: A7 46       STA    ,U
F2A3: EC A6       LDD    ,X
F2A5: 2A 88       BPL    $F2B1
F2A7: 96 20       LDA    $08
F2A9: 3D          MUL
F2AA: 40          NEGA
F2AB: 2B 22       BMI    $F2B7
F2AD: 27 80       BEQ    $F2B7
F2AF: 20 06       BRA    $F2D5

F2B1: 96 8A       LDA    $08
F2B3: 3D          MUL
F2B4: 4D          TSTA
F2B5: 2B 9C       BMI    $F2D5
F2B7: 8B 50       ADDA   #$78
F2B9: A7 CB       STA    $3,U
F2BB: 84 E8       ANDA   #$C0
F2BD: 97 9A       STA    $12
F2BF: 6C BD 60 93 INC    [$4211]
F2C3: A6 BD 60 93 LDA    [$4211]
F2C7: 9B 3A       ADDA   $12
F2C9: 97 9A       STA    $12
F2CB: DF 25       STU    $0D
F2CD: D6 86       LDB    $0E
F2CF: 54          LSRB
F2D0: 54          LSRB
F2D1: E7 1D C0 33 STB    [$4211]
F2D5: 33 C6       LEAU   $4,U
F2D7: 0A 24       DEC    $0C
F2D9: 26 10       BNE    $F273
F2DB: 39          RTS

F2DC: 8E C8 88    LDX    #$E000
F2DF: E6 E6       LDB    ,U
F2E1: 27 FE       BEQ    $F35F
F2E3: 4F          CLRA
F2E4: A6 A9       LDA    D,X
F2E6: 97 8A       STA    $08
F2E8: 8E CC 88    LDX    #$E400
F2EB: E6 6B       LDB    $3,U
F2ED: 4F          CLRA
F2EE: 58          ASLB
F2EF: 49          ROLA
F2F0: 30 A9       LEAX   D,X
F2F2: EC 0B 20 22 LDD    $0200,X
F2F6: 2A 88       BPL    $F302
F2F8: 96 20       LDA    $08
F2FA: 3D          MUL
F2FB: 40          NEGA
F2FC: 2B 22       BMI    $F308
F2FE: 27 80       BEQ    $F308
F300: 20 7F       BRA    $F35F

F302: 96 8A       LDA    $08
F304: 3D          MUL
F305: 4D          TSTA
F306: 2B D5       BMI    $F35F
F308: E6 6A       LDB    $2,U
F30A: C4 98       ANDB   #$10
F30C: 26 2C       BNE    $F312
F30E: 8B F4       ADDA   #$7C
F310: 20 20       BRA    $F314

F312: 8B FA       ADDA   #$78
F314: A7 E6       STA    ,U
F316: 8B 8A       ADDA   #$08
F318: A7 6C       STA    $4,U
F31A: EC 0C       LDD    ,X
F31C: 2A 22       BPL    $F328
F31E: 96 80       LDA    $08
F320: 3D          MUL
F321: 40          NEGA
F322: 2B 88       BMI    $F32E
F324: 27 2A       BEQ    $F32E
F326: 20 B5       BRA    $F35F

F328: 96 20       LDA    $08
F32A: 3D          MUL
F32B: 4D          TSTA
F32C: 2B 19       BMI    $F35F
F32E: 8B F0       ADDA   #$78
F330: A7 61       STA    $3,U
F332: A7 C5       STA    $7,U
F334: A6 60       LDA    $2,U
F336: 84 92       ANDA   #$10
F338: 27 06       BEQ    $F368
F33A: A6 CB       LDA    $3,U
F33C: 84 E8       ANDA   #$C0
F33E: 97 9A       STA    $12
F340: A6 BD C0 93 LDA    [$4211]
F344: 8B 20       ADDA   #$02
F346: A7 1D 6A 39 STA    [$4211]
F34A: 9B 9A       ADDA   $12
F34C: 97 3A       STA    $12
F34E: DF 85       STU    $0D
F350: D6 2C       LDB    $0E
F352: 54          LSRB
F353: 54          LSRB
F354: E7 BD C0 93 STB    [$4211]
F358: 0A 3A       DEC    $12
F35A: 5C          INCB
F35B: E7 B7 6A 99 STB    [$4211]
F35F: 33 6A       LEAU   $8,U
F361: 0A 8E       DEC    $0C
F363: 10 26 DD F7 LBNE   $F2DC
F367: 39          RTS

F368: A6 6B       LDA    $3,U
F36A: 84 48       ANDA   #$C0
F36C: 97 3A       STA    $12
F36E: 6C 17 60 33 INC    [$4211]
F372: A6 1D 60 33 LDA    [$4211]
F376: 9B 90       ADDA   $12
F378: 97 3A       STA    $12
F37A: DF 85       STU    $0D
F37C: D6 26       LDB    $0E
F37E: 54          LSRB
F37F: 54          LSRB
F380: E7 BD C0 93 STB    [$4211]
F384: 20 FB       BRA    $F35F

F386: 8E 62 28    LDX    #$E000
F389: E6 4C       LDB    ,U
F38B: 27 75       BEQ    $F3EA
F38D: 4F          CLRA
F38E: A6 03       LDA    D,X
F390: 97 2A       STA    $08
F392: 8E 66 22    LDX    #$E400
F395: E6 C1       LDB    $3,U
F397: 4F          CLRA
F398: 58          ASLB
F399: 49          ROLA
F39A: 30 03       LEAX   D,X
F39C: EC A1 8A 88 LDD    $0200,X
F3A0: 2A 28       BPL    $F3AC
F3A2: 96 8A       LDA    $08
F3A4: 3D          MUL
F3A5: 40          NEGA
F3A6: 2B 88       BMI    $F3B2
F3A8: 27 20       BEQ    $F3B2
F3AA: 20 B6       BRA    $F3EA

F3AC: 96 20       LDA    $08
F3AE: 3D          MUL
F3AF: 4D          TSTA
F3B0: 2B 1A       BMI    $F3EA
F3B2: 8B FE       ADDA   #$7C
F3B4: A7 E6       STA    ,U
F3B6: EC 06       LDD    ,X
F3B8: 2A 22       BPL    $F3C4
F3BA: 96 80       LDA    $08
F3BC: 3D          MUL
F3BD: 40          NEGA
F3BE: 2B 82       BMI    $F3CA
F3C0: 27 2A       BEQ    $F3CA
F3C2: 20 A4       BRA    $F3EA

F3C4: 96 2A       LDA    $08
F3C6: 3D          MUL
F3C7: 4D          TSTA
F3C8: 2B 08       BMI    $F3EA
F3CA: 8B F0       ADDA   #$78
F3CC: A7 6B       STA    $3,U
F3CE: 84 48       ANDA   #$C0
F3D0: 97 30       STA    $12
F3D2: 6C 1D 60 33 INC    [$4211]
F3D6: A6 1D 6A 39 LDA    [$4211]
F3DA: 9B 9A       ADDA   $12
F3DC: 97 3A       STA    $12
F3DE: DF 85       STU    $0D
F3E0: D6 2C       LDB    $0E
F3E2: 54          LSRB
F3E3: 54          LSRB
F3E4: CB 62       ADDB   #$40
F3E6: E7 1D 6A 39 STB    [$4211]
F3EA: 33 CC       LEAU   $4,U
F3EC: 0A 24       DEC    $0C
F3EE: 26 1E       BNE    $F386
F3F0: 39          RTS

F3F1: 8E 62 82    LDX    #$E000
F3F4: E6 E6       LDB    ,U
F3F6: 10 27 28 A0 LBEQ   $F482
F3FA: 4F          CLRA
F3FB: A6 A3       LDA    D,X
F3FD: 97 80       STA    $08
F3FF: 8E C6 22    LDX    #$E400
F402: E6 C1       LDB    $3,U
F404: 4F          CLRA
F405: 58          ASLB
F406: 49          ROLA
F407: 30 A3       LEAX   D,X
F409: EC 01 8A 28 LDD    $0200,X
F40D: 2A 82       BPL    $F419
F40F: 96 2A       LDA    $08
F411: 3D          MUL
F412: 40          NEGA
F413: 2B 28       BMI    $F41F
F415: 27 8A       BEQ    $F41F
F417: 20 41       BRA    $F482

F419: 96 80       LDA    $08
F41B: 3D          MUL
F41C: 4D          TSTA
F41D: 2B EB       BMI    $F482
F41F: 8B 5E       ADDA   #$7C
F421: A7 46       STA    ,U
F423: 8B DE       ADDA   #$FC
F425: A7 4A A1    STA    $23,U
F428: EC AC       LDD    ,X
F42A: 2A 82       BPL    $F436
F42C: 96 20       LDA    $08
F42E: 3D          MUL
F42F: 40          NEGA
F430: 2B 28       BMI    $F43C
F432: 27 8A       BEQ    $F43C
F434: 20 6E       BRA    $F482

F436: 96 8A       LDA    $08
F438: 3D          MUL
F439: 4D          TSTA
F43A: 2B CE       BMI    $F482
F43C: 8B 50       ADDA   #$78
F43E: A7 CB       STA    $3,U
F440: E6 61       LDB    $3,U
F442: CB 86       ADDB   #$04
F444: E7 EA A2    STB    $20,U
F447: 84 E8       ANDA   #$C0
F449: 97 9A       STA    $12
F44B: 6C B7 6A 99 INC    [$4211]
F44F: A6 BD 60 93 LDA    [$4211]
F453: 9B 30       ADDA   $12
F455: 97 90       STA    $12
F457: DF 25       STU    $0D
F459: D6 86       LDB    $0E
F45B: 54          LSRB
F45C: 54          LSRB
F45D: CB C8       ADDB   #$40
F45F: E7 BD 60 93 STB    [$4211]
F463: A6 EA 01    LDA    $23,U
F466: 84 42       ANDA   #$C0
F468: 97 3A       STA    $12
F46A: 6C 17 6A 39 INC    [$4211]
F46E: A6 17 60 33 LDA    [$4211]
F472: 9B 90       ADDA   $12
F474: 97 30       STA    $12
F476: DF 8F       STU    $0D
F478: D6 26       LDB    $0E
F47A: 54          LSRB
F47B: 54          LSRB
F47C: CB 60       ADDB   #$48
F47E: E7 17 60 33 STB    [$4211]
F482: 33 C6       LEAU   $4,U
F484: 0A 2E       DEC    $0C
F486: 10 26 D7 4F LBNE   $F3F1
F48A: 39          RTS

F48B: 8E 4C E8    LDX    #$64C0
F48E: A6 08       LDA    ,X+
F490: 97 2B       STA    $09
F492: 9F 82       STX    $00
F494: CE 62 C2    LDU    #sprite_ram_4040
F497: 0F 23       CLR    $0B
F499: 86 B8       LDA    #$30
F49B: 97 22       STA    $0A
F49D: 96 83       LDA    $0B
F49F: 81 26       CMPA   #$04
F4A1: 24 A1       BCC    $F4C6
F4A3: 96 2B       LDA    $09
F4A5: 27 AB       BEQ    $F4D0
F4A7: E6 B7 6A 88 LDB    [$4200]
F4AB: 4F          CLRA
F4AC: 58          ASLB
F4AD: 49          ROLA
F4AE: 58          ASLB
F4AF: 49          ROLA
F4B0: C3 42 82    ADDD   #shared_memory_6000
F4B3: 1F 23       TFR    D,X
F4B5: EC 03       LDD    ,X++
F4B7: ED E9       STD    ,U++
F4B9: EC 0C       LDD    ,X
F4BB: ED E9       STD    ,U++
F4BD: 0C 89       INC    $01
F4BF: 0A 2B       DEC    $09
F4C1: 0A 88       DEC    $0A
F4C3: 26 FC       BNE    $F4A3
F4C5: 39          RTS

F4C6: 4F          CLRA
F4C7: A7 6B       STA    $3,U
F4C9: 33 CC       LEAU   $4,U
F4CB: 0A 22       DEC    $0A
F4CD: 26 70       BNE    $F4C7
F4CF: 39          RTS

F4D0: 96 23       LDA    $01
F4D2: 84 42       ANDA   #$C0
F4D4: 80 62       SUBA   #$40
F4D6: 97 83       STA    $01
F4D8: A6 B7 CA 88 LDA    [$4200]
F4DC: 97 21       STA    $09
F4DE: 0C 89       INC    $01
F4E0: 0C 29       INC    $0B
F4E2: 20 3B       BRA    $F49D

F4E4: 8E 47 42    LDX    #$65C0
F4E7: A6 A8       LDA    ,X+
F4E9: 97 81       STA    $09
F4EB: 9F 28       STX    $00
F4ED: CE C8 C8    LDU    #sprite_ram_4040
F4F0: 0F 29       CLR    $0B
F4F2: 86 B2       LDA    #$30
F4F4: 97 28       STA    $0A
F4F6: 96 89       LDA    $0B
F4F8: 81 2C       CMPA   #$04
F4FA: 24 AB       BCC    $F51F
F4FC: 96 21       LDA    $09
F4FE: 27 A1       BEQ    $F529
F500: E6 BD C0 82 LDB    [$4200]
F504: 4F          CLRA
F505: 58          ASLB
F506: 49          ROLA
F507: 58          ASLB
F508: 49          ROLA
F509: C3 EA 88    ADDD   #$6200
F50C: 1F 29       TFR    D,X
F50E: EC 09       LDD    ,X++
F510: ED E3       STD    ,U++
F512: EC 06       LDD    ,X
F514: ED E3       STD    ,U++
F516: 0C 83       INC    $01
F518: 0A 21       DEC    $09
F51A: 0A 82       DEC    $0A
F51C: 26 F6       BNE    $F4FC
F51E: 39          RTS

F51F: 4F          CLRA
F520: A7 61       STA    $3,U
F522: 33 C6       LEAU   $4,U
F524: 0A 28       DEC    $0A
F526: 26 7A       BNE    $F520
F528: 39          RTS

F529: 96 89       LDA    $01
F52B: 84 E8       ANDA   #$C0
F52D: 80 C8       SUBA   #$40
F52F: 97 23       STA    $01
F531: A6 1D C0 22 LDA    [$4200]
F535: 97 8B       STA    $09
F537: 0C 29       INC    $01
F539: 0C 83       INC    $0B
F53B: 20 91       BRA    $F4F6

F54A: CE E8 28    LDU    #shared_memory_6000
F54D: 10 8E C8 62 LDY    #sprite_ram_4040
F551: 8E 82 B2    LDX    #$0030
F554: EC E3       LDD    ,U++
F556: ED 23       STD    ,Y++
F558: EC E9       LDD    ,U++
F55A: ED 29       STD    ,Y++
F55C: 30 37       LEAX   -$1,X
F55E: 26 7C       BNE    $F554
F560: 86 23       LDA    #$01
F562: B7 A2 22    STA    irq_flag_2000
F565: 3B          RTI
F566: DE 8D       LDU    $0F
F568: 5F          CLRB
F569: A6 CB       LDA    $3,U
F56B: 84 E8       ANDA   #$C0
F56D: 97 9A       STA    $12
F56F: 6C BD 60 93 INC    [$4211]
F573: A6 BD 60 93 LDA    [$4211]
F577: 9B 3A       ADDA   $12
F579: 97 9A       STA    $12
F57B: E7 B7 6A 99 STB    [$4211]
F57F: 33 66       LEAU   $4,U
F581: 5C          INCB
F582: C1 86       CMPB   #$04
F584: 25 C1       BCS    $F569
F586: DF 8D       STU    $0F
F588: 39          RTS

F589: B6 EF 74    LDA    $67FC
F58C: 26 38       BNE    $F59E
F58E: DE 87       LDU    $0F
F590: 33 EB 7C 5A LEAU   -$0128,U
F594: 86 28       LDA    #$0A
F596: 97 8E       STA    $0C
F598: BD DA 54    JSR    $F2DC
F59B: DF 27       STU    $0F
F59D: 39          RTS

F59E: DE 87       LDU    $0F
F5A0: 33 EB 7C 5A LEAU   -$0128,U
F5A4: 86 23       LDA    #$01
F5A6: 97 8E       STA    $0C
F5A8: BD DA 54    JSR    $F2DC
F5AB: 86 21       LDA    #$09
F5AD: 97 84       STA    $0C
F5AF: A6 E6       LDA    ,U
F5B1: 27 A9       BEQ    $F5DE
F5B3: 8B 2A       ADDA   #$08
F5B5: A7 C6       STA    $4,U
F5B7: A6 6B       LDA    $3,U
F5B9: A7 CF       STA    $7,U
F5BB: 84 E8       ANDA   #$C0
F5BD: 97 9A       STA    $12
F5BF: A6 BD 60 93 LDA    [$4211]
F5C3: 8B 20       ADDA   #$02
F5C5: A7 1D C0 39 STA    [$4211]
F5C9: 9B 9A       ADDA   $12
F5CB: 97 3A       STA    $12
F5CD: DF 85       STU    $0D
F5CF: D6 2C       LDB    $0E
F5D1: 54          LSRB
F5D2: 54          LSRB
F5D3: E7 BD 60 93 STB    [$4211]
F5D7: 0A 3A       DEC    $12
F5D9: 5C          INCB
F5DA: E7 17 6A 39 STB    [$4211]
F5DE: 33 C0       LEAU   $8,U
F5E0: 0A 2E       DEC    $0C
F5E2: 26 49       BNE    $F5AF
F5E4: DF 2D       STU    $0F
F5E6: 39          RTS

F5E7: DE 27       LDU    $0F
F5E9: 86 82       LDA    #$0A
F5EB: 97 24       STA    $0C
F5ED: BD 7A FB    JSR    $F273
F5F0: DF 2D       STU    $0F
F5F2: 39          RTS

F5F3: DE 2D       LDU    $0F
F5F5: 86 8A       LDA    #$08
F5F7: 97 24       STA    $0C
F5F9: BD 7A FB    JSR    $F273
F5FC: DF 27       STU    $0F
F5FE: 39          RTS

F5FF: DE 2D       LDU    $0F
F601: 86 88       LDA    #$0A
F603: 97 2E       STA    $0C
F605: BD 70 F1    JSR    $F273
F608: DF 27       STU    $0F
F60A: 39          RTS

F60B: DE 27       LDU    $0F
F60D: 86 80       LDA    #$08
F60F: 97 2E       STA    $0C
F611: BD 70 F1    JSR    $F273
F614: DF 2D       STU    $0F
F616: 39          RTS

F617: DE 27       LDU    $0F
F619: 33 40 98    LEAU   $10,U
F61C: 86 2E       LDA    #$06
F61E: 97 84       STA    $0C
F620: BD D1 04    JSR    $F386
F623: DF 2D       STU    $0F
F625: 39          RTS

F626: DE 8D       LDU    $0F
F628: 33 E1 89 80 LEAU   $0108,U
F62C: 86 20       LDA    #$08
F62E: 97 84       STA    $0C
F630: BD D1 04    JSR    $F386
F633: DF 2D       STU    $0F
F635: 39          RTS

F636: DE 8D       LDU    $0F
F638: 33 E0 A8    LEAU   $20,U
F63B: 86 2C       LDA    #$04
F63D: 97 84       STA    $0C
F63F: BD D1 D3    JSR    $F3F1
F642: DF 8D       STU    $0F
F644: 39          RTS

F645: DE 8D       LDU    $0F
F647: 86 2C       LDA    #$04
F649: 97 84       STA    $0C
F64B: BD DB D9    JSR    $F3F1
F64E: DF 87       STU    $0F
F650: 39          RTS

F651: DE 8D       LDU    $0F
F653: 33 EA 32    LEAU   $10,U
F656: 86 84       LDA    #$06
F658: 97 24       STA    $0C
F65A: BD 7E 58    JSR    $F670
F65D: DF 87       STU    $0F
F65F: 39          RTS

F660: DE 2D       LDU    $0F
F662: 33 4B 23 2A LEAU   $0108,U
F666: 86 8A       LDA    #$08
F668: 97 24       STA    $0C
F66A: BD 7E 58    JSR    $F670
F66D: DF 87       STU    $0F
F66F: 39          RTS

F670: A6 61       LDA    $3,U
F672: 84 42       ANDA   #$C0
F674: 97 30       STA    $12
F676: 6C 1D 6A 39 INC    [$4211]
F67A: A6 17 6A 39 LDA    [$4211]
F67E: 9B 9A       ADDA   $12
F680: 97 30       STA    $12
F682: DF 8F       STU    $0D
F684: D6 2C       LDB    $0E
F686: 54          LSRB
F687: 54          LSRB
F688: CB 68       ADDB   #$40
F68A: E7 17 6A 39 STB    [$4211]
F68E: 33 CC       LEAU   $4,U
F690: 0A 2E       DEC    $0C
F692: 26 5E       BNE    $F670
F694: 39          RTS

F695: 96 89       LDA    $0B
F697: 81 2C       CMPA   #$04
F699: 24 B1       BCC    $F6D4
F69B: 86 26       LDA    #$0E
F69D: 97 82       STA    $0A
; racing the beam: check if all sprites are above the current beam position
F69F: CE 62 62    LDU    #sprite_ram_4040
F6A2: B6 82 22    LDA    >$0000
F6A5: AB C1       ADDA   $3,U
F6A7: 25 21       BCS    $F6B2
F6A9: 33 CC       LEAU   $4,U
F6AB: 11 83 69 88 CMPU   #$4100
F6AF: 25 D3       BCS    $F6A2
F6B1: 39          RTS

F6B2: 96 8B       LDA    $09
F6B4: 27 3D       BEQ    $F6D5
F6B6: E6 1D 6A 28 LDB    [$4200]
F6BA: 4F          CLRA
F6BB: 58          ASLB
F6BC: 49          ROLA
F6BD: 58          ASLB
F6BE: 49          ROLA
F6BF: C3 42 22    ADDD   #shared_memory_6000
F6C2: 1F 83       TFR    D,X
F6C4: EC A3       LDD    ,X++
F6C6: ED 43       STD    ,U++
F6C8: EC AC       LDD    ,X
F6CA: ED 49       STD    ,U++
F6CC: 0C 29       INC    $01
F6CE: 0A 81       DEC    $09
F6D0: 0A 28       DEC    $0A
F6D2: 26 55       BNE    $F6AB
F6D4: 39          RTS

F6D5: 96 83       LDA    $01
F6D7: 84 E8       ANDA   #$C0
F6D9: 80 C8       SUBA   #$40
F6DB: 97 29       STA    $01
F6DD: A6 17 CA 22 LDA    [$4200]
F6E1: 97 8B       STA    $09
F6E3: 0C 23       INC    $01
F6E5: 0C 89       INC    $0B
F6E7: 96 23       LDA    $0B
F6E9: 81 8C       CMPA   #$04
F6EB: 24 ED       BCC    $F6B2
F6ED: 39          RTS

F6EE: 96 83       LDA    $0B
F6F0: 81 26       CMPA   #$04
F6F2: 24 BB       BCC    $F72D
F6F4: 86 2C       LDA    #$0E
F6F6: 97 88       STA    $0A
; racing the beam again
F6F8: CE 68 C8    LDU    #sprite_ram_4040
F6FB: B6 28 28    LDA    >$0000
F6FE: AB CB       ADDA   $3,U
F700: 25 2B       BCS    $F70B
F702: 33 C6       LEAU   $4,U
F704: 11 83 C3 82 CMPU   #$4100
F708: 25 D9       BCS    $F6FB
F70A: 39          RTS

F70B: 96 21       LDA    $09
F70D: 27 97       BEQ    $F72E
F70F: E6 BD 60 82 LDB    [$4200]
F713: 4F          CLRA
F714: 58          ASLB
F715: 49          ROLA
F716: 58          ASLB
F717: 49          ROLA
F718: C3 4A 88    ADDD   #$6200
F71B: 1F 29       TFR    D,X
F71D: EC 09       LDD    ,X++
F71F: ED E3       STD    ,U++
F721: EC 06       LDD    ,X
F723: ED E3       STD    ,U++
F725: 0C 83       INC    $01
F727: 0A 21       DEC    $09
F729: 0A 82       DEC    $0A
F72B: 26 FF       BNE    $F704
F72D: 39          RTS

F72E: 96 89       LDA    $01
F730: 84 E2       ANDA   #$C0
F732: 80 C2       SUBA   #$40
F734: 97 23       STA    $01
F736: A6 1D 6A 28 LDA    [$4200]
F73A: 97 81       STA    $09
F73C: 0C 29       INC    $01
F73E: 0C 83       INC    $0B
F740: 96 29       LDA    $0B
F742: 81 86       CMPA   #$04
F744: 24 E7       BCC    $F70B
F746: 39          RTS

