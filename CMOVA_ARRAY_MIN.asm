section .data
	arr dd 11,2,3,5,4,1,2, -1
	msg db "%d",0

section .text
	global main
	extern printf
	main:
	xor eax, eax
	mov ecx, arr
	mov eax, dword[ecx]
	
lp:	cmp dword[ecx], eax
	CMOVB eax, dword[ecx]
	add ecx, 4
	cmp dword[ecx], -1
	jne lp

	push eax
	push msg
	call printf
	add esp, 8
	ret
