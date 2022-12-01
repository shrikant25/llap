section .data
	msg db "%d",10, 0		;; just a msg to hold integer

section .text
	global divisors
	extern printf

divisors:	
					;; move stack pointers to create new stack frame for this function
		push ebp		;; push current value of ebp on stack
		mov ebp, esp		;; move value of esp in ebp (now ebp ans esp point to same address)
		mov ebx, 1		;; initialize ebx to 1

	lp:	xor edx, edx		;; initialize edx to zero, remainder will be stored in edx
		mov eax, dword[ebp+8]	;; move received parameter in eax
		div ebx 		;; divide value in eax by value in ebx
		cmp edx, 0		;; check if remainder is zero (remainders are stored in edx by default)
		je print		;; if edx is zero, then it means that value at ebx ..
					;; is a divisor so print it by jumping to print function

	lp2:	inc ebx			;; increment value of ebx 
		cmp ebx, dword[ebp+8]	;; compare value of ebx and original parameter
		jge end			;; if value at ebx > parameter, then there will be no divisors so jump to end
		jmp lp			;; otherwise jump to begining of loop

	print:	
		push ebx		;; push value of ebx on stack (push call moves stack by 4 bytes)
		push msg		;; push msg (%d) on stack
		call printf		;; call printf 
		add esp, 8		;; printing is finished, so move esp back to its original position(4 + 4 = 8)
		jmp lp2 		;; get back to find next divisors

	end: 
		mov esp,ebp		;; function is finished, so move back esp to ebp
		pop ebp			;; every pop moves esp by 4	
		ret			;; pop current value on stack into ebp(so ebp gets back its previous value)
					;; return back to caller function
					;; (eip will point to whatever address stored add esp i.e address of next instruction from caller function)
