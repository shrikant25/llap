#include<stdio.h>
#include<string.h>
int main(){
	char input[32] = {"This is a test message\n"};
	char output[30];
	int length = strlen(input);

	asm(
				
		"addl %%ecx, %%esi\n"
		"subl $2,  %%esi\n"
		
"lp:\t"		"std\n"
		"lodsb\n"
		"cld\n"
		"stosb\n"
		"loop lp\n" 
		:

			:"S"(input), "D"(output), "c"(length));
	printf("%s", output);
	return 0;
}
