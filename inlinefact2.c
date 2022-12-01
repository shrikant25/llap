#include<stdio.h>


int main(){
int result = 0;
int fact = 6;


asm volatile(   
	"movl $1, %%edx\n\t"	
	"lp:\n\t"	
	"imull %%ecx, %%edx\n\t"
	"loop lp\n\t"
	"movl %%edx, %%eax"
	: "=a"(result)
	: "c" (fact));
	fflush(stdout);
	printf("result is %d\n", result);

return 0;

}
