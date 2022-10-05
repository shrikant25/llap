section .data
	a dq 5.0
	b dq 5.0

section .text
	global main
	main:
		fld qword[b]
		fld qword[a]
		fcom
		xor eax, eax
		fstsw ax
		sahf
	ret
