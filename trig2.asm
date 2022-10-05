section .data
	a dq 90.0
	oe dq 180.0
section .text
	global main
	main:
		fld qword[oe]
		fld qword[a]
		fldpi
		fmul
		fdivr
		fcos
	ret
