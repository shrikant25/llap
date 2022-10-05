%macro abc 3
	mov eax , %1
	mov ebx ,%2
	add eax, ebx
	mov %3, eax
%endmacro

section .data
	msg db "val is %d",0

section .text
	global main
	main:
	abc 2,3,ecx
	ret

			
