

section .text
	global fact

fact:
	push ebp
	mov ebp, esp
	mov ecx, dword[ebp+8]
	
	xor ebx,ebx
	mov eax, 1
lp:	mul ecx
	dec ecx
	cmp ecx, 1
	jg lp
	
	mov esp, ebp
	pop ebp
	ret
