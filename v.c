#include<stdio.h>
int num1 = 10;
int num2 = 5;
int result;

int main(){

	asm volatile(
	"movl num1, %ebx\n\t"
	"movl num2, %ecx\n\t"
	"imull %ebx, %ecx\n\t"
	"movl %ecx,result\n\t"
	
	);
	
	printf("answer: %d",result);
	
	return 0;

}
