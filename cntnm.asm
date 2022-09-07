section .data
	msg1 db "How many numbers", 10, 0
	input db "%d",0
	ws db " %d ", 0
	msg2 db	"Enter %d values", 10, 0
	msg3 db  "The array is", 10, 
	msg4 db "Enter number to search", 10, 0 
	msg5 db "The count of num is %d", 10, 0
	
section .bss
	sz resd 1
	num resd 1
	arr resd 30
	
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

lp:		pusha
		push ebx
		push input
		call scanf
		add esp, 8
		popa

		inc ecx
		add ebx, 4
		cmp ecx, dword[sz]
		jl lp

		
		push msg4
		call printf
		add esp, 4
		
		push num
		push input
		call scanf
		add esp, 8
		

		xor ecx, ecx
		mov ebx, arr
		xor edx, edx
		mov eax, dword[num]
						
lp2:		cmp eax, dword[ebx]
		jnz lp3
		inc edx  
	
lp3:		pusha
		push dword[ebx]
		push ws
		call printf
		add esp, 8
		popa

		inc ecx
		add ebx, 4
		cmp ecx, dword[sz]
		jl lp2
			
		push edx
		push msg5
		call printf
		add esp, 8
		ret		 
