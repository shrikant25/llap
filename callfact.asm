section .data
	ph db "%d",0
	val dd 5


section .bss
	summ resd 1

section .text
	global main
	extern printf, fact
	main:
		mov edx, dword[val]
		xor ebx,ebx
		mov dword[summ],0

	lp:	
		push edx
		push edx 
		call fact
		add esp, 4
		pop edx
		
		mov ebx, dword[summ]
		add ebx, eax		
		mov dword[summ], ebx

		dec edx
		cmp edx, 0
		jg lp

		push dword[summ]
		push ph
		call printf
		add esp, 8
		ret
	
