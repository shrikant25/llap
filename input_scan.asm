section .data
	input db "%d",0
	msg db "Enter count required:",0
	msg1 db "Number entered by you is %d",10, 0
	msg2 db "Addition is of array is %d",10, 0
	msg3 db "Max of array is %d", 10, 0
	msg4 db "Min of aray is %d", 10, 0

section .bss
	n resd 1
	myarray resd 10

section .text
	global main
	extern printf, scanf, puts

main: 
	push msg
	call printf
	add esp, 4

	push n
	push input
	call scanf
	add esp, 8

	push dword[n]
	push msg1
	call printf
	add esp, 8

	xor ecx, ecx
lp:     mov ebx, myarray
	mov eax, 4
	mul ecx
	add ebx, eax
	pusha
	push ebx
	push input
	call scanf
	add esp, 8
	popa
	inc ecx
	cmp ecx, dword[n]
	jl lp


	xor ecx, ecx
lp1:    mov ebx, myarray
	mov eax, 4
	mul ecx
	add ebx, eax
	pusha
	push dword[ebx]
	push msg1
	call printf
	add esp, 8
	popa
	inc ecx
	cmp ecx, dword[n]
	jl lp1
	

	xor edx, edx
	xor ecx, ecx
lp2:	mov ebx, myarray
	mov eax, 4
	push edx
	mul ecx
	pop edx
	add ebx, eax
	add edx, dword[ebx]
	inc ecx 	
	cmp ecx, dword[n]
	jl lp2
	push edx
	push msg2
	call printf
	add esp,8
	
	
	xor ecx, ecx
lp3:	
	inc ecx 	
	cmp ecx, dword[n]
	jl lp3
	push edx
	push msg3
	call printf
	add esp,8
