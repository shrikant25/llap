section .data
	msg db "Enter a value",10,0  			;; just a msg to display
	input db "%d",0 				;; to hold integer value

section .bss
	value resd 1					;; to store user input

section .text
	global main
	extern scanf, printf, divisors			;; required functions

main:
	push msg					;; push msg
	call printf					;; print the msg
	add esp, 4					;; move esp back to its preivious position

	push value					;; integer on variable "value" on stack (each push moves esp by 4)
	push input					;; push "%d" on stack
	call scanf					;; call scanf
	add esp, 8					;; work done, now move esp back to its original position
		
	mov eax, dword[value]				;; move integer value in eax
	push eax					;; (variable "value" is a address, so dword[value] is like read 4 bytes at address "value")
	call divisors					;; push eax on stack, so it can be accessed by another function
	add esp, 4					;; call function
	ret						;; move esp back to its original position
							;; end of function
