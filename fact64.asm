section .data
	msg db "%d",0

section .text
	global main
	extern printf
main:
	mov rcx, 4

	mov rax, 1
lp:	mul rcx
	dec rcx
	cmp rcx, 1
	jg lp
	
	
	mov rdi, rax
	mov rsi, msg
	push rdi
	push rsi
	call printf
	pop rdi
	ret
	
	
