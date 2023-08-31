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
    int i, min;
    min = INT_MAX;
    for (i = 0; i < tam; i++)
    {
        if (esPar(a[i]))
        {
            if (a[i] < min)
            {
                min = a[i];
            }
        }
    }
    return min;
}
int minimo_impares(int a[], int tam)
{
    int i, min;
    min = INT_MAX;
    for (i = 0; i < tam; i++)
    {
        if (!esPar(a[i]))
        {
            if (a[i] < min)
            {
                min = a[i];
            }
        }
    }
    return min;
}

void pedirArreglo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        printf("Elemento %d: ", i + 1);
        scanf("%d", &a[i]);
    }
}
void imprimeArreglo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        if (i == 0)
        {
            printf("[ %d ,", a[i]);
        }
        else if (i == tam - 1)
        {
            printf(" %d ] \n", a[i]);
        }
        else
        {
            printf(" %d ,", a[i]);
        }
    }
}
int main(void)
{
    int tam, minPar, minImpar;
    int x[10];
    bool min;
    printf("Tamanio de arreglo: ");
    scanf("%d", &tam);

    pedirArreglo(x, tam);
    printf("\nEl arreglo ingresado es: \n");
    imprimeArreglo(x, tam);

    minPar = minimo_pares(x, tam);
    printf("\n\nEl minimo par es: %d\n", minPar);

    minImpar = minimo_impares(x, tam);
    printf("El minimo impar es: %d\n", minImpar);

    min = minPar <= minImpar;
    printf("\nEl minimo del arreglo es: %d \n", min ? minPar : minImpar);
    printf("\n----------------Fin programa-----------------\n");

    return 0;
}