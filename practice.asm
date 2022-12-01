section .data

	student db "z z z,M,MCA,2017",0, 
		db "a a a,M,MCA,2018",0,
		db "b b b,M,MSC,2017",0,
		db "c c c,M,MCA,2017",0,
		db "d d d,M,MSC,2017",0,
		db "e e e,M,MCA,2017",0,-1
		
	studlen equ $-student
	course db "MCA"
	course_len equ $-course

	year db "2017"
	year_len equ $-year

	nl db 10

section .bss
	studname resb 30
	studname_len resb 10


section .text
	global main
	
main:	
	mov edi, student

lp:	xor eax, eax
	mov ecx, studlen
	mov esi, edi
	mov dword[studname], esi
	mov al, ' '
	repnz scasb

	mov edx, edi
	sub edx, esi
	mov dword[studname_len], edx

	mov ecx, studlen
	mov al, ','
	repnz scasb
	repnz scasb
	
	mov ecx, course_len
	mov esi, course
	repe cmpsb
	jnz lp2

	inc edi
	mov ecx, year_len
	mov esi, year
	repe cmpsb
	jnz lp2
	
	mov eax, 4
        mov ebx, 1
        mov ecx, dword[studname]
        mov edx, dword[studname_len]
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, nl
        mov edx, 1
        int 0x80
	
lp2:	mov ecx, studlen
	mov al, 0
	repnz scasb
	cmp byte[edi], -1
	jne lp
	ret

		
