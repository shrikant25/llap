%macro strlen 1
	mov esi, %1
	xor ecx,ecx
lp:	lodsb
	cmp al, 0
	je %%end
	inc ecx
	jmp lp
%%end:  nop
%endmacro


section .data
	mystr db "why delete", 10, 0
	len equ $-mystr

section .text
	global main
main:
	mov edx, len
	strlen mystr
	ret
