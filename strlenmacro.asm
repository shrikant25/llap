%macro mystrlen 1

	mov esi, %1
	xor eax, eax
	xor ecx, ecx

%%lp:   lodsb
	cmp al, 0
	jz %%myend
	inc ecx
	jmp %%lp

%%myend: mov eax, ecx
%endmacro


section .data
	mstr db "ab_cd%$",0
	dsp db "%d",0
	

section .text
	global main
	extern printf
	main:

	mystrlen mstr
	push eax
	push dsp
	call printf
	add esp, 8
	ret
	
