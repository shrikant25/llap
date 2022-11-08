section .data
	msg db "what is the ques", 10, 0

section .text
	global main
	main:
	extern printf	
	mov rdi, msg
	push rdi
	call printf
	pop rdi
	ret
