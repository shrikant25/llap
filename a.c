#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[], char **envp){
	int i;
	if(argc < 2){
	
	
		printf("invalid args\n");
		exit(1);
	}


	for(i=0; i<=12; i++){
	
		printf("envp %d = %s and argv %d =  %s\n", i, envp[i], i, argv[i]);
	}




}



