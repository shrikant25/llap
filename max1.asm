section .data
section .text
	global max
max:	
	push ebp
	mov ebp, esp
	mov eax, dword[ebp+8]
	mov ebx, dword[ebp+12]
	cmp eax, ebx
	jg lp
	mov dword[ebp-4], ebx
	jmp lp1
	

lp: 
	mov dword[ebp-4], eax
lp1:	
	mov eax, dword[ebp-4]
	mov esp, ebp
	pop ebp
	ret
