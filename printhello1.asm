section .text ; executable data goes here
	global main ; linker will consider this as entry point
	extern printf
	
	main:
		mov edx, len ; move length of string in edx register
		mov ecx, msg ; move msg in ecx register
		mov ebx, 1 ; move file description in ebc register
		mov eax, 4; move function call in eax register
		int 0x80
		ret	
		

section .data ; section for constant data

; db = DATA BYTES ..tells to put bytes 
; msg it as just a label
; 10 = newline
; 0 = endof string


msg db "how you doin :) gal",10, 0
len equ $-msg 

; len is a variable
; equ means "="
; $ is current position
; msg is start pos of our string
; length = currentpos - start of msg 
