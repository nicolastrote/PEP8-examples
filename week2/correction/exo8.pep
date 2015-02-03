; Simple Pep/8 program, reads a String char by char, stops when a `\n` is encountered
; with a success message, or when a non ASCII-letter is encountered, in which case
; an error message is output.

; First, check if the end of the stream has been reached (the
; stream is considered to be the line being read).
mainlp:		CHARI	tmpchr, d
		LDBYTEA	tmpchr, d
		ANDA	0x00FF, i
		CPA	'\n', i
		BREQ	outsucc
; Once validated, start checking
lpcode:		CPA	'A', i
		BRLT	outfl
		CPA	'z', i
		BRGT	outfl
		CPA	'Z'
		BRLE	mainlp
		CPA	'a'
		BRLT	outfl
		BR	mainlp
outsucc:	STRO	succmsg, d
		STOP
outfl:		STRO	flmsg, d
		STOP

; Char read on each loop
tmpchr:		.BYTE 0
; Position in string
pos:		.BLOCK 2

; Success message
succmsg:	.ASCII	"The string contained letters only\x00"
; Failure message
flmsg:		.ASCII	"There was a non-letter character in the string\x00"

		.END
