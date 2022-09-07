section .data
	msg1 db "Enter string", 10, 0
	input db "%c", 0
	dspcnt db "%d : %d", 10, 0
	msg2 db "The count of characters are : ", 10, 0
	msg3 db "The string is : ", 0

section .bss
	chr_cnts resd 256
	mystr resb 100

section .text
	global main
	extern printf, puts, scanf

	main:
		push msg1      ; asks to enter string
		call printf
		add esp, 4
				
	     ; this loop accepts the string
		mov ebx, mystr

lp:		pusha
		push ebx
		push input
		call scanf
		add esp, 8
		popa
		
		inc ecx
		mov al, byte[ebx]
		add ebx, 1
		cmp al, 10
		jne lp
		
		push msg3      ; display the string
		call printf
		add esp, 4
		push mystr
		call puts
		add esp, 4
		
		
	; count occurence of each character
		mov ebx, mystr
		mov ecx, 4

lp1:	        mov al, byte[ebx]
		mul ecx
		mov edx, chr_cnts
		add edx, eax
		inc dword[edx]

		inc ebx
		xor eax, eax
		mov al, byte[ebx]
		cmp al, 0
		jne lp1


	; display the occurrence of each character

		mov ebx, chr_cnts
		xor ecx, ecx
	
lp3:		cmp dword[ebx], 0
		je lp4

		pusha 
		push dword[ebx]
		push ecx
		push dspcnt
		call printf
		add esp, 12
		popa

lp4:		add ebx, 4
		inc ecx
		cmp ecx, 256
		jl lp3

		ret






		
