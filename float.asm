section .data
a dq 1.2
b dq 2.3
c dq 3.5
d dq 4.5
e dq 5.5
f dq 6.5
g dq 7.5
h dq 8.5
i dq 9.5

var dq 4

section .text
global main

main:	
;;	fldz
	
;;	fldpi
	
;	fst qword[a]
;	fstp qword[b]
;	fsqrt
	fld qword[a]
	fld qword[b]
;	fild dword[b]
	fmul st0, st0
;	fld qword[c]
;	fadd st0, st1
;	fsub st0, st1
;	fsubr st0, st1
	fdiv st0, st1
	fdivr st0, st1
	fchs 
	
;	fld qword[d]
;	fld qword[e]
;	fld qword[f]
;	fld qword[g]
;	fld qword[h]
;	fld qword[i]
	ret
