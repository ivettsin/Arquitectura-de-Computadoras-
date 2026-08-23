#include <stdio.h>

int main() {
	int sig=1,act=0,n,aux;
	printf("Cantidad de numeros a mostrar:");
	scanf("%d", &n);
	for(int i=1; i<=n; i++){
		printf("%d \t", act);
		aux=act;
		act=sig;
		sig+=aux;
	}
	printf("\n");
	return 0;
}

