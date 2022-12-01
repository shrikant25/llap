section .data
	
	msg db "Enter a string", 10, 0
	
	char_holder db "%c", 0
	
	msg2 db "The counts are", 10, 0
	
	int_holder db "%d", 0
	
	nl db 10
	colon db " : ", 0	

section .bss
	mystr resb 100
	arr resd 256

section .text
	global main
	extern printf, scanf
main:
	push msg
	call printf
	add esp, 4

	mov eax, mystr
	lp:	
		push eax
		push char_holder
		call scanf
		add esp, 4
		
		cmp dword[eax], 10
		je cnt
		
		inc eax
		jmp lp

	cnt:	
		xor ecx, ecx
		mov eax, 4
		mov esi, mystr
		
		lp2:	
			cmp dword[esi], 0
			je prntcnt
		
			mov cl, byte[esi]		
			mul ecx
			mov ebx, arr
			add ebx, ecx
			inc dword[ebx]
			inc esi
			jmp lp2
	
	prntcnt:

		push msg2
		call printf
		add esp, 4

		xor ecx, ecx
		mov esi, mystr
		mov eax, 4

		lp3:	
			cmp dword[esi], 0
			je end

			push dword[esi]
			push char_holder
			call printf
			add esp, 8
			
			push colon
			call printf
			add esp, 4
		
			mov cl, byte[esi]
			mul ecx
			add ebx, ecx
			push dword[ebx]
			call printf
			add esp, 4
			
			push nl
			call printf
			add esp, 4			

			inc esi
			jmp lp3

	end:
		ret















	
