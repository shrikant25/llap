#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main(){
	char input[32] = {"This is a test message\n"};
	 int length = strlen(input);
	char *output = malloc(length+1);
	

	asm(
				
		"addl %%ecx, %%esi\n"
		"subl $2, %%esi\n"	
		
"lp:\t"		"std\n"
		"lodsb\n"
		"cld\n"
		"stosb\n"
		"loop lp\n"	
		:
		:"S"(input), "D"(output), "c"(length));
	output[length] = '\0';
	printf("%s", output);
	return 0;
}
