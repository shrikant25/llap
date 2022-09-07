section .data
	source db "src str", 10, 0
	len equ $-source

section .bss
	destination resb len

section .text
	global main
	
	main:
		mov esi, source		; add start address  of str
		mov edi, destination 	; add start address of str
		dec esi			; go one pos back to avoid going to /0 in next step
		add esi, len		; move esi to end of str

		mov ecx, len
	lp 	STD                	; sets DF flag
		LODSB			; moves the byte from esi to al
		CLD			; clears DF flag
		STOSB			; moves the byte from al to edi
		loop lp			; loop will always decrement ecx and compares for next instruction
		
		mov eax, 4
		mov ebx, 1
		mov ecx, destination
		mov edx, len
		int 0x80
		ret
