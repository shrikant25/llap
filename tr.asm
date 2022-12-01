section .data
	array dd 50,28,57,12,13,11,10,-1
	msg db "Second minimum element is %d",10,0

section .text
	global main
	extern printf
	
main:
	xor edx,edx
	mov ebx,array
	mov eax,dword[ebx]
	
lp:	
	cmp dword[ebx],-1
	jz lp2
	
	cmp eax,dword[ebx]
	jl lp1
	
	mov edx,eax
	mov eax,dword[ebx]
	
lp1:
	
	add ebx,4
	jmp lp
	
	
lp2:	push edx
	push msg
	call printf
	add esp,8
	ret
