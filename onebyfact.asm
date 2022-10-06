section .data
	n dd 4
	one dq 1.0
	res dq 0.0
	pf db "%f",0
	
section .bss
	temp resd 1
	temp1 resq 1

section .text
	global main
	main:
	extern printf, fact
	
	mov eax, dword[n]
	
lp:	push eax
	push eax
	call fact
	add esp, 4
	mov dword[temp], eax
	
	fild qword[temp]
	fld qword[one]
	fdiv st0, st1
	
	fld qword[res]
	fadd st0, st1

	fstp qword[res]
	fstp qword[temp1]	
	fstp qword[temp1]

	pop eax
	dec eax
	cmp eax, 0
	jnz lp

	fld qword[res]
	sub esp, 8
	fstp qword[esp]	
	push pf
	call printf
	add esp, 12	

	ret
