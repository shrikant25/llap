section .data
	msg1 db "invalid params", 10, 0
	msg1 db "envp %d  = %s and argv %d = %s", 10, 0
	msg3 db "" 
section .text
	global main
	extern printf

main:
	push ebp
	mov ebp, esp
	mov ecx, [ebp]
	mov ecx, [ebp+4]
	mov ecx, [ebp+8]
	mov esp, ebp
	pop ebp
