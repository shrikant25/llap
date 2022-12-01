section .data
	
	msg db "Enter a string", 10, 0
	
	char_holder db "%c", 0
	
	msg2 db "The counts are", 10, 0
	
	int_holder db "%d", 0
	
	nl db 10, 0
	colon db " : ", 0	

section .bss
	mystr resb 100
	arr resd 256

section .text
	global main
	extern printf, scanf
main:

	mov ecx, 256
	mov eax, arr
lp1:	mov dword[eax], 0
	add eax, 4
	dec ecx
	cmp ecx, 0
	jg lp1

	push msg
	call printf
	add esp, 4

	mov esi, mystr
	lp:	
		
		push esi
		push char_holder
		call scanf
		add esp, 8
		
		mov al, byte[esi]
		cmp al, 10
		je cnt
		
		inc esi
		jmp lp

	cnt:	
		xor ecx, ecx
		mov esi, mystr
		
		lp2:
			mov eax, 4	
			cmp dword[esi], 0
			je prntcnt
		
			mov cl, byte[esi]		
			mul ecx
			mov ebx, arr
			add ebx, eax
			inc dword[ebx]
			inc esi
			jmp lp2
	
	prntcnt:

		push msg2
		call printf
		add esp, 4

		xor ebx, ebx
		mov esi, arr

		lp3:	
			cmp dword[esi], 0
			jne show

		lbl:	
                        inc ebx
			add esi, 4
               	        cmp ebx, 255
                      	jg end
			jmp lp3				

		show:	
			mov eax, ebx			
			push eax
			push int_holder
			call printf
			add esp, 8
			
			push colon
			call printf
			add esp, 4

			push dword[esi]
			push int_holder
			call printf
			add esp, 8
			
			push nl
			call printf
			add esp, 4			

			jmp lbl
	
	end: ret















	
