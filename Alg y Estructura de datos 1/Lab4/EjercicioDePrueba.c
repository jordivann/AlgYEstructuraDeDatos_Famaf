
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

bool esPar(int x)
{
    if (x % 2 == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int minimo_pares(int a[], int tam)
{
    int i, minimoPar;
    minimoPar = INT_MAX;
    for (i = 0; i < tam; i++)
    {
        if (a[i] < minimoPar && esPar(a[i]))
        {
            minimoPar = a[i];
        }
    }
    if (minimoPar == INT_MAX)
    {
        printf("En este arreglo no hay numeros pares");
    }

    return minimoPar;
}

int minimo_impares(int a[], int tam)
{
    int i;
    int minimoImpar;
    minimoImpar = INT_MAX;
    for (i = 0; i < tam; i++)
    {
        if (a[i] < minimoImpar && !esPar(a[i]))
        {
            minimoImpar = a[i];
        }
    }
    if (minimoImpar == INT_MAX)
    {
        printf("En este arreglo no hay numeros impares");
    }
    return minimoImpar;
}

int main(void)
{
    int i, tam, minimoPar, minimoImpar, a[10];
    bool res;

    printf("Bienvenido al programa\n");
    printf("Ingrese el tamano del arreglo: ");
    scanf("%d", &tam);

    while (tam <= 0)
    {
        printf("El arreglo debe ser no vacio\n");
        printf("Ingrese el tamaño del arreglo: ");
        scanf("%d", &tam);
    }

    printf("\nIngrese el arreglo: \n");
    for (i = 0; i < tam; i++)
    {
        printf("\nIngrese el elemento %d: ", i + 1);
        scanf("%d", &a[i]);
    }

    printf("\nEl arreglo ingresado es: \n");
    printf("[");
    for (i = 0; i < tam; i++)
    {
        if (i == tam - 1)
        {
            printf("%d ]", a[i]);
        }
        else
        {
            printf("%d, ", a[i]);
        }
    }

    minimoPar = minimo_pares(a, tam);
    minimoImpar = minimo_impares(a, tam);

    printf("\nEl minimo par es: %d", minimoPar);
    printf("\nEl minimo impar es: %d", minimoImpar);

    res = minimoPar < minimoImpar;
    if (res)
    {
        printf("\nEl minimo del arreglo es: %d", minimoPar);
    }
    else
    {
        printf("\nEl minimo del arreglo es: %d", minimoImpar);
    }

    return 0;
}

// ME TOMARON:
// Escriba un programa que tenga:
struct datos
{
    bool existe_perfecto;
    int maximo_perfecto;
}