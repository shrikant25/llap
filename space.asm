section .data
	mystring db "llaap lec program", 0
	len equ $ - mystring
	msg db "space count is %d", 10, 0
	
section .bss
	mydest resb len

section .text
	global main
	extern printf, puts

	main:
		mov esi, mystring
		xor ecx, ecx
	lp:	xor eax, eax
		cmp byte[esi], 0
		jz lp1
		mov al, ' '
		cmp byte[esi], al
		jnz lp2
		inc ecx

	lp2:	inc esi
		jmp lp

	lp1:	push ecx
		push msg
		call printf
		add esp, 8
		ret

