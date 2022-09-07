section .data
	input db "%d", 0
	msg db "enter some text : ", 10, 0
	msg1 db "you have entered : ", 10, 0
	

section .bss
	num resb 4

section .text
	global main
	extern printf, scanf

	main:
		push msg
		call printf
		add esp, 4
		
		push num
		push input
		call scanf
		add esp, 8

		push msg1
		call printf
		add esp, 4

		push dword[num]
		push input
		call printf
		add esp, 8

		ret	
