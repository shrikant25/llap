#include<stdio.h>

int main(){
char input[30]=("This is a last message");
char output[30];

int len=25;

asm volatile ("cld\n\t"
"rep movsb"

:

: "S"(input), "D"(output),"c"(len));

printf("%s",output);

return 0;

}
