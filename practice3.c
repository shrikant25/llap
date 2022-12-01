#include<stdio.h>

int main(void){
	int d1 = 10;
	int d2 = 5;
	int result;

	asm volatile(
		"xor %%edx, %%edx\n\t"
		"div %%ebx\n\t"
		"movl %%eax, %%ecx"
		:"=c" (result)
		:"a"  (d1), "b"  (d2)		
	
	);
	fflush(stdout);
	printf("result %d\n", result);
	return 0;
}
