section .data
	msg db "*", 0
	nl db 10, 0
	n dd 5

section .text
	global main
	extern printf	
main:
	
	xor esi, esi
	xor edi, edi
	
	lp:
		mov ebx, dword[n]
		sub ebx, esi
		 
		lp1:
			push msg
			call printf
			add esp, 4
			
			inc edi		
			cmp edi, ebx
			jl lp1
		
		xor edi, edi	 
		push nl
		call printf
		add esp, 4

		inc esi	
		cmp esi, dword[n]
		jl lp

	ret
