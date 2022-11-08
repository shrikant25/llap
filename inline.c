int main(){

	asm("mov $1, %eax\n\t" "movl $0, %ebx\n\t" "int $0x80");
}
