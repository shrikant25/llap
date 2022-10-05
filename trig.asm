section .data
	a dq 90
	oe dq 180
section .text
	global main
	main:
		fld qword[a]
		fsin
		fldpi
		fmul st0, st1
		fld qword[oe]
		fdiv st1, st0 
	ret
