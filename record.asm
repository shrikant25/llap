section .data
	student db "z z z,M,MCA,2017",0,
		db "a a a,M,MCA,2017",0,
		db "b b b,M,MSC,2017",0,
		db "c c c,F,MSC,2017",0,
		db "d d d,M,MSC,2017",0,
		db "e e e,M,MCA.2017",0,-1

	len equ $-student

	course db "MSC"
	course_len equ $-course

	year db "2017"
	year_len equ $-year

	newline db 10

section .bss
	fname resd 1
	fname_len resd 1

section .text
	global main

main:
	xor eax, eax
	mov edi, student

lp:	mov ecx, len
	mov esi, edi
	mov dword[fname], esi
	mov al, ' '
	repnz scasb
	
	mov edx, edi
	sub edx, esi
	mov dword[fname_len], edx

	mov ecx, len
	mov al, ','
	repnz scasb
	repnz scasb

	mov ecx, course_len
	mov esi, course
	repe cmpsb
	jnz skip

	inc edi

	mov ecx, year_len
	mov esi, year
	repe cmpsb
	jnz skip

	mov eax, 4
	mov ebx, 1
	mov ecx, dword[fname]
	mov edx, dword[fname_len]
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

skip:
	mov ecx, len
	mov al, 0
	repnz scasb
	cmp byte[edi], -1
	jnz lp
	ret
