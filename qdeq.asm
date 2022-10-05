section .data
a dq 1.2
b dq 2.3
c dq 3.5
four dd 4
two dd 2

var dq 4

section .text
global main
; -b +-sqrt(b^2-4ac)/2a
main:
	fld qword[b]
	fmul st0, st0
	fld qword[four]
	fld qword[a]
	fmul st0, st1
	fld qword[c]
	fmul st0, st1
	

	
