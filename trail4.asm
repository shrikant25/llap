section .data
Array  dd 10, 20, 30, 40, -1
msg db "Max number is %d", 10, 0

section .text 
global main
extern printf

main:
xor ecx,ecx
xor esi,esi
mov ebx,Array
mov eax,4
mul ecx
add ebx, eax
add esi, dword[ebx]
push dword[ebx], -1
jz endof
pusha
push dword[ebx]
push msg
call printf
add esp,8
pop a

