#include <stdio.h>
        int data1 = 10;
int data2 = 20;

int result;
int main(){
	

	asm volatile(
		"movl data1, %ebx\n\t"
		"movl data2, %ecx\n\t"
		"imull %ebx, %ecx\n\t"
		"movl %ecx, result\n\t");

	printf("the answer is %d\n", result);
	return 0;
}


