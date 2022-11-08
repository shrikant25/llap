section .text
	global main
	main:
	
	mov eax, 5
	mov ebx, 5
	cmp eax, ebx
	CMOVAE eax, ebx
	mov ebx, eax	
ret
