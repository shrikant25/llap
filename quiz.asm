section .data
	msg1 db "Enter value of N",10, 0 
	msg2 db "%d x %d = %d",10,0
	db_hldr db "%d",0	

section .bss
	N resd 1
section .text
	global main
	extern printf, scanf

main:
	push msg1
	push N
	push db_hldr
	call scanf
	add esp, 12

	
	mov ecx, 1
lp:	mov eax, ecx
	mov ebx, dword[N]
	mul ebx

	pusha ;; save current value on stack
	
	push eax	;; push result 
	push ecx	;; push current multiple
	push ebx	;; push value of N
	push msg2
	call printf
	add esp, 16
	
	popa ;; get current values back from stack

	inc ecx
	cmp ecx, 10
	jle lp
	ret
	

	
	
	
