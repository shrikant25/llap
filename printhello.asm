section .text ; executable data goes here
	global main ; linker will consider this as entry point
	extern printf
	
	main:
		push msg ; push msg on stack
		call printf ; gives call to printf
		add esp, 4
		ret	
		

section .data ; section for constant data

; db = DATA BYTES ..tells to put bytes 
; msg it as just a label
; 10 = newline
; 0 = endof string


msg db "how you doin :)",10, 0
