section .data
msg db "oh my god", 10, 0
section .bss
msg1 resb 100
section .text
global main
extern printf
main: push msg
      call printf
      add esp, 4
      ret
