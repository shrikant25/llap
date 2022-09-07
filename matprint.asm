section .data
	msg1 db "How many rows", 10, 0
	msg2 db "How many columns", 10, 0
	input db "%d", 0
	nl db 10, 0
	ws db " %d ",0
	msg3 db "The rows are %d", 10, 0
	msg4 db "The columns are %d", 10, 0
	msg5 db	"Enter %d values", 10, 0
	msg6 db  "The matrix is", 10, 0
	
section .bss
	sz resd 1
	row resd 1
	column resd 1
	arr resd 30
	
section .text
	global main
	extern printf, scanf
	
	main:
		
		push msg1
		call printf
		add esp, 4

		push row
		push input
		call scanf
		add esp, 8

		push msg2
		call printf
		add esp, 4

		
		push column
		push input
		call scanf
		add esp, 8
		
		push dword[row]
		push msg3
		call printf
		add esp, 8

		push dword[column]
		push msg4
		call printf
		add esp, 8

		mov eax, dword[row]
		mov ebx, dword[column]
		mul ebx
		mov dword[sz], eax
		
		push dword[sz]
		push msg5
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

		push msg6
		call printf
		add esp, 4

		
		xor ecx, ecx
		mov ebx, arr
		mov eax, 4
		xor edx, edx
				
		
lp2: 		pusha
		push dword[ebx]
		push ws
		call printf
		add esp, 8
		popa


		inc edx
		cmp edx, dword[column]
		jl lp3

		pusha
		push nl
		call printf
		add esp, 4
		popa
		xor edx, edx 		

lp3:		inc ecx
		add ebx, eax
		cmp ecx, dword[sz]
		jl lp2
		
		ret		 
