section .data

	msg db "sum of array is %d", 10,0

section .text
	global main
	extern printf, fact

section .bss
	arr resd 5
main:
	
	mov eax, arr
	push arr
	call fact
	add esp, 4
	
	push eax
	push msg
	call printf
	add esp, 8
	ret
