#include<stdio.h>


int main(){
int result = 1;
int fact = 5;


asm(   	"lp:\t"	
	"mul %%ecx\n"
	"loop\n"
	: "=a"(result)
	: "d" (fact));
	printf("result is %d\n", result);

return 0;

}
