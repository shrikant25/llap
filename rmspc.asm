section .data
	source db "low level string",0
	len equ $-source

section .bss
	fstring resb len
	sstring resb len
	fcount resd 1
	scount resd 1

section .text
	global main

	main:
	;	mov esi, fstring
		mov edi, source
		mov al, ' '
		repnz	scasb
		mov edx, edi
		mov esi, source
		sub edx, esi

		push ecx
		mov eax, 4
		mov ebx, 1
		mov ecx, source
		int 0x80
		pop ecx

	
		mov al,' '
		repnz scasb
		
		mov esi, edi
		mov al, 0
		repnz scasb
		mov edx, edi

		sub edx, esi
		mov eax, 4
		mov ebx, 1
		mov ecx, esi
		int 0x80
		ret
