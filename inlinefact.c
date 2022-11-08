#include<stdio.h>

int result = 0;
int fact = 5;

int main(){


asm(    "pusha\n"
	"movl $1, %eax\n"
	"movl fact, %ecx\n"
	"lp:\t"	
	"mul %ecx\n"
	"decl %ecx\n"
	"cmpl $1,%ecx\n"
	"jg lp\n"
	"movl %eax, result\n"
	"popa\n");
	printf("result is %d\n", result);

return 0;

}
