section .text
	global main
	main:
	
	mov eax, 5
	mov ebx, 5
	cmp eax, ebx
	CMOVAE eax, ebx
	

	mov eax, 6
	mov ebx, 5
	cmp eax, ebx
	CMOVAE eax, ebx
	
	mov eax, 7
	mov ebx, 6
	cmp eax, ebx
	CMOVAE eax, ebx

	
	
ret
