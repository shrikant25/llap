section .data
	msg db "Enter string : ", 0
	input db "%c", 0
	msg1 db "The string is : ", 0
	strfound db "str found", 10, 0
	strnotfound db "str not found", 10, 0

section .bss
	mystr resb 40
	substr resb 40
	
section .text
	global main
	extern printf, puts, scanf

	main:
		push msg		  ; asks to enter a string
		call printf
		add esp, 4


		mov ebx, mystr
	lp:     pusha			; accepts a string
		push ebx
		push input
		call scanf
		add esp, 8
		popa
	
		mov al, byte[ebx]
		inc ebx
		cmp al,10
		jne lp
	

		push msg1
		push mystr
		call puts         ; displays the string
		add esp, 8


		
		push msg
		call printf     ; asks to enter a string
		add esp, 4


		mov ebx, substr 
	lp1:    pusha
		push ebx         ; accepts a string
		push input
		call scanf
		add esp, 8
		popa
	
		mov al, byte[ebx]
		inc ebx
		cmp al, 10
		jne lp1		 
	

		push msg1
		push substr   
		call puts     ; displays the string
		add esp, 8



		mov ebx, mystr
		mov ecx, substr

	lp2:	mov al, byte[ebx]
		mov ah, byte[ecx]
		cmp al, ah
		jne reset		
		inc ecx
		inc ebx
		xor eax, eax
		mov al, byte[ecx]
		cmp al, 10
		je lp4

	lp3:	xor eax, eax
		mov al, byte[ebx]
		cmp al, 0
		je lp5
		jmp lp2

	reset:  cmp ecx, substr
		jne reset1
		inc ebx	
		jmp lp3

	reset1:	mov ecx, substr
		jmp lp3

	lp4: 	push strfound
		call puts
		add esp, 4
		jmp pend

	lp5:   	push strnotfound
		call puts
		add esp, 4
 
	pend:	ret
