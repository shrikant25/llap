section .data
	msg db "%d",0
	n dd 5

section .bss
	array resd 5

section .text
	global main
	extern printf, scanf

main:
	xor ecx, ecx
        mov eax, array

lp:	pusha 
	push eax
	push msg
	call scanf
	add esp, 8
	popa
	add eax, 4
	inc ecx
	cmp ecx, dword[n]
	jl lp
	
	xor ecx, ecx
lp1:    
			xor eax,eax
			mov ebx, array
		lp2:	
			mov esi, dword[ebx]
			cmp esi, dword[ebx+4]	
			jg myswap

			
		lbl:	inc eax
			add ebx,4
			mov edx, dword[n]
			sub edx, ecx
			sub edx, 1
			cmp eax, edx
			jl lp2


	inc ecx
	cmp ecx, dword[n]
	jnz lp1
	jmp myprint



myswap:
	mov edi, dword[ebx+4]
	mov dword[ebx], edi
	mov dword[ebx+4], esi
	jmp lbl
	
myprint:
	xor ecx,ecx
	mov edx, array
lp3:	pusha
	push dword[edx]
        push msg
	call printf
	add esp, 8
	popa
	add edx, 4
	inc ecx
	cmp ecx, dword[n]
	jl lp3


ret
