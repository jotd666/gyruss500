* Converted with 6809to68k by JOTD
*
* make sure you call "cpu_init" first so all bits of data registers
* are zeroed out so we can use add.l dy,ax with dy > 0x7FFF
* without systematic masking
*
* WARNING: you also have to call "cpu_init"
* at start of any interrupt you could hook
*
* the get_6809_address macro can just call get_6809_address or it can also use
* conditional compilation to select the proper memory banks at compile time
* (see my burger time 6502 conversion which does that in RELEASE mode)



	.macro	MAKE_D
	rol.w	#8,d0
	move.b	d1,d0
	rol.w	#8,d0
	.endm


	.macro	MAKE_B
	move.w	d0,d1
	rol.w	#8,d1
	.endm

	.macro INVERT_XC_FLAGS
	PUSH_SR
	move.w	(sp),d6
	eor.b	#0x11,d6
	move.w	d6,(sp)
	POP_SR
	.endm

* useful to recall C from X (add then move then bcx)
	.macro	SET_C_FROM_X
	PUSH_SR
	move.w	(sp),d6
	bset	#0,d6   | set C
	btst	#4,d6
	bne.b	0f
	bclr	#0,d6   | X is clear: clear C
0:
	move.w	d6,(sp)
	POP_SR
	.endm

	.macro	SET_X_FROM_CLEARED_C
	PUSH_SR
	move.w	(sp),d6
	bset	#4,d6   | set X
	btst	#0,d6
	beq.b	0f
	bclr	#4,d6   | C is set: clear X
0:
	move.w	d6,(sp)
	POP_SR
	.endm

	.macro CLR_XC_FLAGS
	moveq	#0,d5
	roxl.b	#1,d5
	.endm
	.macro SET_XC_FLAGS
	st	d5
	roxl.b	#1,d5
	.endm

	.macro CLR_V_FLAG
	moveq	#0,WTF
	add.b	WTF,WTF
	.endm

	.macro SET_I_FLAG
    .error   "TODO: insert interrupt disable code here"
	.endm
	.macro CLR_I_FLAG
    .error   "TODO: insert interrupt enable code here"
	.endm
	.ifdef	MC68020
	.macro PUSH_SR
	move.w	ccr,-(sp)
	.endm
	.macro POP_SR
	move.w	(sp)+,ccr
	.endm
	.macro	MOVE_W_TO_REG	src,dest
	move.w	\src,\dest
	.endm
	.macro	MOVE_W_FROM_REG	src,dest
	move.w	\src,\dest
	.endm
	.else
	.macro PUSH_SR
	move.w	sr,-(sp)
	.endm
	.macro POP_SR
	move.w	(sp)+,sr
	.endm
	
	.macro	MOVE_W_TO_REG	src,dest
	ror.w	#8,\dest
	move.b	\src+,\dest
	ror.w	#8,\dest
	move.b	\src,\dest
	subq	#1,\dest
	.endm
	
	.macro	MOVE_W_FROM_REG	src,dest
	ror.w	#8,\src
	move.b	\src,\dest+
	ror.w	#8,\src
	move.b	\src,\dest
	subq	#1,\dest
	.endm
	.endif

	.macro READ_BE_WORD	srcreg
	move.b	(\srcreg),d6
	lsl.w	#8,d6
	move.b	(1,\srcreg),d6
	move.w	d6,\srcreg
	.endm

	.macro GET_ADDRESS	offset
	* statically checking a lot of stuff
	* so we don't need to check it again in "get_6809_address"
	.ifeq	\offset
	.error	"reading ybeam"
	.endif
	.ifeq	\offset-0x2000
	.error	"loading irq flag address"
	.endif
	.ifge	\offset-0x6800
	.error	"loading address > 0x6800"
	.endif
	.iflt	\offset-0x6000
	.ifge	\offset-0x4800
	.error	"0x4800 < loading address < 0x6000"	
	.endif
	.endif
	.iflt	\offset-0x4000
	.error	"loading address < 0x4000"
	.endif
	lea	\offset,a0
	jbsr	get_6809_address
	.endm

	.macro GET_DP_ADDRESS	offset
	lea	(a4,\offset\().W),a0
	.endm


	.macro GET_INDIRECT_ADDRESS	offset
	GET_ADDRESS	\offset
	READ_BE_WORD	a0
	jbsr	get_6809_address
	.endm

	.macro SET_DP_FROM_A
	lsl.w    #8,d0
	move.l    d0,a0
	jbsr    get_6809_address
	move.l	a0,a4
	lsr.w    #8,d0
	.endm

	.macro SET_DP_FROM    reg
	exg	d0,\reg
	SET_DP_FROM_A

	exg	d0,\reg
	.endm

	.macro GET_X_ADDRESS	offset
	.ifeq	\offset
	move.l	d2,a0
	.else
	lea	\offset,a0
	add.l	d2,a0
	.endif
	jbsr	get_6809_address
	.endm

	.macro GET_X_ADDRESS_FROM_REG	reg
	move.l	\reg,a0
	add.l	d2,a0
	jbsr	get_6809_address
	.endm

	.macro GET_Y_ADDRESS	offset
	.ifeq	\offset
	move.l	d3,a0
	.else
	lea	\offset,a0
	.endif
	add.l	d3,a0
	jbsr	get_6809_address
	.endm

	.macro GET_Y_ADDRESS_FROM_REG	reg
	move.l	\reg,a0
	add.l	d3,a0
	jbsr	get_6809_address
	.endm

	.macro GET_U_ADDRESS	offset
	.ifeq	\offset
	move.l	d4,a0
	.else
	lea	\offset,a0
	add.l	d4,a0
	.endif
	jbsr	get_6809_address
	.endm

	.macro GET_U_ADDRESS_FROM_REG	reg
	move.l	\reg,a0
	add.l	d4,a0
	jbsr	get_6809_address
	.endm

cpu_init:
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	moveq	#0,d3
	moveq	#0,d4
	moveq	#0,d5
	moveq	#0,d6
	moveq	#0,d7
	rts

* < A0: 16-bit address
* < A5: ram start (0x6000, maps to 0xA000 in the other CPU)
* < A6: ram start (0x4000)
get_6809_address:
	sub.w	#0x4000,a0
	.ifndef	RELEASE
	jpl		0f
	* should not happen
	add.w	#0x4000,a0
	BREAKPOINT	"invalid 6809 address < 0x4000"
	rts
0:
	cmp.w	#0x2000,a0
	jcc		1f
	cmp.w	#0x800,a0
	jcs		0f
	BREAKPOINT	"invalid 6809 0x6000 > address > 0x4800"
	rts
0:
	.endif
	cmp.w	#0x2000,a0
	jcc		0f
1:
	* 0x4000-0x4800 area
	lea	(a6,a0.w),a0
	rts
0:
	* 0x6000 area
	.ifndef	RELEASE
	cmp.w	#0x2800,a0
	jcs		0f
	BREAKPOINT	"invalid 6809 address > 0x67FF"
	rts
0:
	.endif
	
	sub.w	#0x2000,a0
	lea	(a5,a0.w),a0
	rts

