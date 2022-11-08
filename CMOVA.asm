section .text
	global main
	main:
	
	mov eax, 5
	mov ebx, 5
	mov ecx, 10
	cmp eax, ebx ;; ebx is smaller so zero flag will be set
	CMOVA eax, ecx ;; and value of ebx will be stored in eax
	mov ebx, 1000
ret
