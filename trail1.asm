section .data
	msg db "how you doin", 10, 0

section .text
	global main
	extern puts, printf

main:
	push msg
	call puts
	add esp, 4
        push msg
        call printf
        add esp, 4
	ret
