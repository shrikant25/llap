section .data
	msg db "enter some text : "
	lenmsg equ $-msg

	msg1 db "you have entered : "
	lenmsg1 equ $-msg1

section .bss
	num resb 5

section .text
	global main

	main:
		mov eax, 4
	 	mov ebx, 1
		mov ecx, msg
		mov edx, lenmsg
		int 80h
		
		mov eax, 3
		mov ebx, 0
		mov ecx, num
		mov edx, 5
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, msg1
		mov edx, lenmsg1
		int 80h

		mov eax, 4
		mov ebx, 1
		mov ecx, num
		mov edx, 5
		int 80h
		
		mov eax, 1
		mov ebx, 0
