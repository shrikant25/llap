section .data
	msg1 db "Enter string", 10, 0
	input db "%c", 0
	msg2 db "Enter the character to search", 10, 0
	msg3 db "The count of character is %d", 10, 0
	msg4 db "The string is : ", 0

section .bss
	mych resb 1
	mystr resb 30

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
		
		push msg4      ; display the string
		call printf
		add esp, 4
		push mystr
		call puts
		add esp, 4
		
				
		push msg2	; asks to enter character
		call printf
		add esp, 4

		push mych		; takes character as input
		push input
		call scanf
		add esp, 8

		
		xor ecx, ecx	; counts the instances of character in str
		mov ebx, mystr
		xor edx, edx
		
	
lp1:		mov al, byte[ebx]
		cmp al, byte[mych]
		jne lp2
		inc edx
			
lp2:		inc ecx
		add ebx, 1
		mov al, byte[ebx]
		cmp al, 0
		jne lp1
		
		push edx  ; displays the count of characters
		push msg3
		call printf
		add esp, 8

		ret
