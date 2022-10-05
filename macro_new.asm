
%macro mymacro 3
	mov eax, %1
	mov ebx, %2
	add eax, ebx
	mov %3, eax
%endmacro

%macro mymacro 2
	mov ebx, %1
	mov eax, %2
	sub eax, ebx
%endmacro

section .data
 hold db "%d"
section .text
global main
extern printf
main:
	mov edx, 60
	mymacro 10,20,edx
	push eax
	push hold
	call printf
	add esp, 8

	mymacro 10,20
	push eax
	push hold
	call printf
	add esp, 8
	ret
