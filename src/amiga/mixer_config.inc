* 0xVER: mixer_config.i 3.6 (04.02.24)
*
* mixer_config.i
* Configuration file for the audio mixer.
*
* For mixer API, see mixer.i and the rest of the mixer documentation.
* For more information about this configuration file, see the 
* mixer documentation.
*
* Note: the audio mixer expects samples to be pre-processed such that adding
*       sample values together for all mixer channels can never exceed 8 bit
*       signed limits or overflow from positive to negative (or vice versa).
* 
* Author: Jeroen Knoester
* Version: 3.6
* Revision: 20240204
*
* converted to gcc 68k as by JOTD
	
	.ifndef	MIXER_CONFIG_I
MIXER_CONFIG_I	=	1

* Configuration defines
*-----------------------------------------------------------------------------
* Mixer type selection
*-----------------------------------------------------------------------------
* Set one of the defines below to 1 to select the desired mixer type:
* (note that only the code required for the selected type will end up in the
*  object file, with specific optimisations for each type as required)
*
* * MIXER_SINGLE		- mixer outputs to a single hardware channel.
*
* * MIXER_MULTI 		- mixer outputs to multiple hardware channels.
*
*						  Each hardware channel gets its own set of software
*						  mixed channels.
*
* * MIXER_MULTI_PAIRED	- mixer outputs to multiple hardware channels.
*
*						  Hardware channels are split into one pair of 
*						  channels and between zero and two unpaired channels.
*
*						  The paired hardware channels both play back the same
*						  set of software mixed channels. The unpaired channels
*						  (.ifeq	any) each get their own set of software mixed 
*						  channels. 
*
*						  The paired channels will always be AUD2 & AUD3.
*						  Unpaired channels are either none, AUD0, AUD1 or 
*						  AUD0 & AUD1.
MIXER_SINGLE			= 1
MIXER_MULTI				=	0
MIXER_MULTI_PAIRED		= 0

*-----------------------------------------------------------------------------
* Mixer mode selection
*-----------------------------------------------------------------------------
* Set define below to 1 to enable the high quality mixer routines. The high 
* quality mixer routines do not require pre-processed samples, allowing for
* full 8-bit quality to be used. However, the high quality mixer routines use
* considerably more CPU time to do the mixing.
MIXER_HQ_MODE			=	0


*-----------------------------------------------------------------------------
* Mixer output configuration
*-----------------------------------------------------------------------------
mixer_output_channels	=	DMAF_AUD3
									* valid values are DMAF_AUD0/1/2/3 or
									* any bitwise combination of these with at
									* least one channel set.
									*
									* Note: combining channels is only
									*       valid when MIXER_MULTI or
									*       MIXER_MULTI_PAIRED is set.
									* Note: if MIXER_MULTI_PAIRED is set,
									*       valid combinations are:
									*       * DMAF_AUD2|DMAF_AUD3
									*       * DMAF_AUD2|DMAF_AUD3|DMAF_AUD0
									*       * DMAF_AUD2|DMAF_AUD3|DMAF_AUD1
									*		* all 4 channels
									
mixer_sw_channels		=	4		| Maximum number of software mixed 
									* channels on a single hardware channel.
									* Valid values are 1,2,3 and 4
*mixer_period			=	161 	| Valid values: 124 and up
									* Default value of 322 is about
									* 11025Hz when using a PAL Amiga
									*
									* Note: there are minor differences in 
									*       period values between PAL and NTSC
									*       for the same desired output 
									*       frequency.
									*
									*       These differences are not taken 
									*       into account, the value set here 
									*       is used as the actual HW period 
									*       value for the mixer, irrespective
									*       of the video system of the Amiga 
									*       the mixer is running on.
									
MIXER_PER_IS_NTSC		=	0		| Set to 1 .ifeq	the mixer period value set
									* above is given for NTSC systems, leave 
									* at 0 .ifeq	it is given for PAL systems.


*-----------------------------------------------------------------------------
* Optimisation related options
*-----------------------------------------------------------------------------
* Set define below to 1 to optimise mixer code for the 68020+.
* if set to 0, optimised code for 68000 is used instead.
*
* Note: code generated will run on 68000/68010 and 68020+ irrespective of this
*       setting, the only difference is one of speed - the 68000 code is
*       significantly faster on 68000/68010 than the 68020+ code and
*       vice versa.
MIXER_68020				= 0

* Optimisations below only apply to the 68000 version, as they will not
* improve performance for 68020+ code/machines.

* Set define below to 1 to optimise the mixer by limiting maximum sample
* length to 65532 bytes (technically up to 65535, but the mixer always rounds
* lengths down to the nearest multiple of 4 bytes). This increases performance
* by switching some operations from being longword based to word based.
MIXER_WORDSIZED			= 0

* Set define below to 1 to optimise the mixer by forcing both the buffer size
* and source sample sizes to be multiples of 32 bytes. This improves
* performance slightly by removing the need to deal with samples that are a 
* multiple of 4 bytes in size.
*
* Note: the amount of performance gained this way will be dependend on the 
*       calculated buffer size for the chosen period - if this buffer size is 
*       already a multiple of 32, the performance gain will be very limited or
*       non-existent.
* Note: irrespective of the calculated buffer size, the possible gain for this
*       option is usually limited.
MIXER_SIZEX32			= 0

* Set define below to 1 to optimise the mixer by forcing the source sample 
* size to always be a multiple of the buffer size. This increases performance
* significantly by removing the need to decide the correct number of bytes to
* mix.
*
* Note: this setting adapts to the video system selected at runtime using the
*       MixerSetup() routine and will use an appropriate buffer size to keep
*       the interrupt running once per frame for both PAL and NTSC based 
*       displays.
* Note: off all the performance options for the 68000 code, this will give the
*       largest performance gain, at the cost of needing (potentially
*       significantly) more memory for samples.
* Note: if both this and MIXER_SIZEX32 are set, the buffer size will be a
*       multiple of 32 bytes.
* Note: the combination of MIXER_SIZEX32 and MIXER_SIZEXBUF does not normally
*       increase performance meaningfully - selecting MIXER_SIZEXBUF will
*       mostly make MIXER_SIZEX32 irrelevant. However, in some edge cases,
*       it can still create a slight increase in performance over just using
*       MIXER_SIZEXBUF.
MIXER_SIZEXBUF			= 0


*-----------------------------------------------------------------------------
* Performance measurement options
*-----------------------------------------------------------------------------
* Set define below to 1 to enable colour/timing bars
MIXER_TIMING_BARS		=	0
* Set to desired background colour to reset to after colour bars end (valid .ifeq	* mixer timing bars are in use).
MIXER_DEFAULT_COLOUR	=	0x000

* Set define below to 1 to enable CIA based timing of the performance of the
* interrupt handler. This uses the CIA-A timer.
MIXER_CIA_TIMER			= 0
* Set define below to 1 to enable restoring the keyboard for OS use after
* using CIA based performance timing. Has no function .ifeq	MIXER_CIA_TIMER is
* set to 0.
MIXER_CIA_KBOARD_RES	=	1

* Set define below to 1 to enable the mixer interrupt counter. This word sized
* counter increases by one every time the mixer interrupt has been executed
* and can be accessed using the routines MixerResetCounter() and
* MixerGetCounter()
MIXER_COUNTER			= 0


*-----------------------------------------------------------------------------
* Advanced options
*-----------------------------------------------------------------------------
* Set define below to 1 to enable the use of callback functions. .ifeq	enabled, 
* whenever a sample ends playing back, the mixer will check .ifeq	a callback 
* function has been configured. .ifeq	so, the callback function will be called.
*
* .ifeq	the define is set to 0, callback functions can't be used.
* 
* Note: enabling callback functions slightly increases CPU cost of the mixer
*       when a sample ends.
MIXER_ENABLE_CALLBACK	= 0

* Set define below to enable plugins. Plugins are real time effect routines
* that are called by the mixer prior to the mixing of a given mixer channel.
* They can be enabled or disabled per channel and when active output sample 
* data into an output buffer which is used by the mixer for further 
* processing.
*
* Note: enabling plugins slightly increases CPU and memory costs of the mixer
*       for all mixer channels playing back samples. In addition, the effects
*       routines themselves will also add CPU overhead.
* Note: enabling plugins will 
MIXER_ENABLE_PLUGINS	= 0

* Set define below to 1 to .include "the" mixer in .section code,code.
* .ifeq	set to 0, the mixer will not be set a specific .section (normally this is
* not needed, but it can be useful in certain cases)
MIXER_SECTION			=	0

* Set define below to 1 if the assembler used does not support the ".error"
* command. This blocks mixer.asm displaying messages during assembly.
MIXER_NO_ECHO			= 0
	.endif	| MIXER_CONFIG_I
	
* Set define below to 1 to .include "C" style function definition aliases in
* addition to the standard function definitions. This effectively creates
* a number of .global _<FunctionName> symbols for use in linking against C based
* code.
*
* Note: enabling this option also changes the way plugins and callbacks are
*       handled, so that they can deal with the registers that C compilers can
*       trash between function calls.
MIXER_C_DEFS			= 0
* End of File
