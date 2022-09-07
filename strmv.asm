section .data
	source db "src str", 10, 0
	len equ $-source

section .bss
	destination resb len

section .text
	global main
	
	main:
		mov esi, source
		mov edi, destination 
		mov ecx, len
		xor eax, eax ; just to check value of al in gdb
		rep movsb

		mov eax, 4
		mov ebx, 1
		mov ecx, destination
		mov edx, len
		int 0x80
		ret
