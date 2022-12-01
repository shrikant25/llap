%macro strcpy 2
	mov esi, %1
	mov edi, %2

%%lp:	cmp byte[esi], 0
	je %%end
	mov al, byte[esi]
	mov byte[edi], al
	inc esi
	inc edi
	jmp %%lp

%%end: nop
		

%endmacro

section .data
	mystr db "lulz, lol", 10, 0
	len equ $-mystr

section .bss
	mystr2 resb 20

section .text
	global main
main:
	strcpy mystr, mystr2
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mystr2
	mov edx, len
	int 0x80
	ret
