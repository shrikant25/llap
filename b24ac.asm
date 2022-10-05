section .data
	a dq 1.0
	b dq 7.0
	c dq 3.0
	
	four dq 4.0
	two dq 2.0	
	
	pf db "%f",0

section .bss
	val1 resq 1
	val2 resq 1

section .text
	global main
	extern printf
	main:
	fld qword[a]
	fld qword[two] ;;st6
	fmul st0, st1 ;;st5
	
	fld qword[a]
	fld qword[c] ;;st4
	fmul st0, st1 ;;st3
	fld qword[four]  
	fmul st0, st1  ;;st2

	fld qword[b]
	fmul st0, st0 
	fsub st0, st1 ;;st1
	fsqrt 

	fld qword[b]
	fchs   ;; st0
	fld st0 
	fsub st0, st2 ;; -b-sqrt(b^2-4ac) ... 
	
	fdiv st0, st6  ;; result/2a 
	fstp qword[val1] ;; push top of stack in given variabale

	fadd st0, st1 ;; -b+sqrt(b^2-4ac) 
	fdiv st0, st5 ;; 
	fstp qword[val2] 


	fld qword[val1]
	sub esp, 8
	fstp qword[esp]
	push pf
	call printf
	add esp, 12

	fld qword[val2]
	sub esp, 8
	fstp qword[esp]
	push pf
	call printf
	add esp, 12
	ret
