	.ifdef	RELEASE
	.macro	BREAKPOINT comment
	.endm
OPT_NO_STARS = 0
* 0: use 6809 0x4040 computed buffer (len: 0xC0), which is what the original
*    machine uses. works but multiplexing cannot be emulated so
*    some flashing could occur (unless stars are turned off)
* 1: use Z80 0xAx00 buffer (len: 0x200), which is the source that 6809
*    uses (at address 0x6x00) to multiplex the sprites in the 0x4040 buffer
*    it doesn't require sprite multiplexing
* 2: use Z80 computed coords (98xx) not 6809 computed ones (completely bogus)
OPT_COORDS_MODE = 1
	.else
LOG_BUFFER_SIZE = 0x10000
	* amiga specific
	.macro	BREAKPOINT comment
	move.l	a0,-(a7)
	lea		comment\@(pc),a0
	jbsr	osd_break
	move.l	(a7)+,a0
	jra		next\@
comment\@:
	.asciz	"\comment"
	.align	2
next\@:
	.endm


OPT_NO_STARS = 0		| disable stars
OPT_COORDS_MODE = 0     

	.endc

