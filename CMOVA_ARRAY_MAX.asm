section .data
	arr dd 1,2,3,5,4,3,2, -1
	msg db "%d",0

section .text
	global main
	extern printf
	main:
	xor eax, eax
	mov ecx, arr

lp:	cmp dword[ecx], eax
	CMOVA eax, dword[ecx]
	add ecx, 4
	cmp dword[ecx], -1
	jne lp

	push eax
	push msg
	call printf
	add esp, 8
	ret
