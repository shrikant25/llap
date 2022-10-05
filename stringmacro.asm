%macro mystrcpy 2
	mov esi, %1
	mov edi, %2
%%lp:	cmp byte[esi], 0
	jz %%myend
	mov al, byte[esi]
	mov byte[edi], al
	inc esi
	inc edi
	jmp %%lp
%%myend: nop
%endmacro


section .data
	mstr db "abcd",0

section .bss
	mystr resb 10

section .text
	global main
	extern printf
	main:

	mystrcpy mstr, mystr
	push mystr
	call printf
	add esp, 4
	ret
	
