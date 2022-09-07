section .data
	msg1 db "How many numbers", 10, 0
	input db "%d", 0
	msg2 db "The number is %d", 10, 0	
	msg3 db "Min number is : %d",0
	
section .bss
	sz resd 1
	arr resd 10
	
section .text
	global main
	extern printf, scanf
	
	main:
	
		push msg1
		call printf
		add esp, 4
		
		push sz
		push input
		call scanf
		add esp, 8

		push dword[sz]
		push msg2
		call printf
		add esp, 8

		xor ecx, ecx
		mov ebx, arr
		mov eax, 4

lp:		pusha
		push ebx
		push input
		call scanf
		add esp, 8
		popa
		
		inc ecx
		add ebx, eax
		cmp ecx, dword[sz]
		jl lp


		
		xor ecx, ecx
		mov edx, dword[arr]
		mov ebx, arr
		mov eax, 4

lp2:		cmp edx, dword[ebx]
		jl lp3
		mov edx, dword[ebx]
		
lp3:		inc ecx
		add ebx, eax
		cmp ecx, dword[sz]
		jl lp2

		push edx
		push msg3
		call printf
		add esp, 8
		ret
