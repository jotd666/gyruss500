	.ifdef	RELEASE
	.macro	BREAKPOINT comment
	.endm

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

	.ifdef	RELEASE
OPT_PERFECT_CHANCE_STAGE = 0		| do not change!!
	.else
OPT_PERFECT_CHANCE_STAGE = 0
	.endif
     

	.endc

