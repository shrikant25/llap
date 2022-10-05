section .data
	msg db "factorial is %d", 10,0
section .text
	global main
	extern printf, fact

main:
	mov eax, 5
	push eax
	call fact
	add esp, 4
	
	push eax
	push msg
	call printf
	add esp, 8
	ret
