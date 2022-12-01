section .data
	four dq 4.0
	two dq 2.0
	
	b dq 7.0
	a dq 1.0
	c dq 3.0
	
	msg db " %f ", 10, 0

section .text
	global main
	extern printf
main:
	fld qword[a]
	fld qword[two]
	fmul st0, st1
	

	fld qword[four]
	fmul st0, st2
	fld qword[c]
	fmul st0, st1

	fld qword[b]
	fmul st0, st0
	fsub st0, st1
	fsqrt	

	fld qword[b]
	fchs 
	fadd st0, st1
	fdiv st0, st4
	sub esp, 8
	fstp qword[esp]
	push msg
	call printf
	add esp, 12
		
	fld qword[b]
	fchs 
	fsub st0, st1
	fdiv st0, st4
	sub esp, 8
	fstp qword[esp]
	push msg
	call printf
	add esp, 12

	ret
