#include <stdio.h>

int suma_hasta(int n)
{
    int x, suma;
    x = 0;
    suma = 0;
    while (x != n && x < 9)
    {
        int aux;
        x++;
        aux = suma;
        suma = aux + x;
        printf("\nPasada numero %d:  -> la suma vale: %d \n", x, suma);
    };

    return suma;
    // for (i=1; i<=n;i++){
    //     suma += i
    // };

    // Por formula de gauss: = suma = (n * (n + 1)) / 2
}

int main(void)
{
    int n;
    printf("Ingrese un numero: ");
    scanf("%d", &n);

    if (n < 0)
    {
        printf("Error: El numero ingresado debe ser positivo");
    }
    else
    {
        suma_hasta(n);
    }

    return 0;
}