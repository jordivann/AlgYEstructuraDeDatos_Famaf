#include <stdio.h>

int sumatoria(int a[], int tam)
{
    int i, suma;
    suma = 0;
    for (i = 0; i < tam; i++)
    {
        suma += a[i];
    }

    return suma;
}
void pedirArreglo(int a[], int n_max)
{
    int i;
    for (i = 0; i < n_max; i++)
    {
        printf("Elemento %d: ", i + 1);
        scanf("%d", &a[i]);
    }
}
void imprimeArreglo(int a[], int n_max)
{
    int i;
    for (i = 0; i < n_max; i++)
    {
        if (i == 0)
        {
            printf("[ %d ,", a[i]);
        }
        else if (i == n_max - 1)
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
    int tam, a[10], res;
    printf("Ingrese la cantidad de datos que vamos a sumar: ");
    scanf("%d", &tam);

    if (tam == 0)
    {
        res = 0;
    }
    else if (tam < 0)
    {
        printf("No existe tal arreglo");
        return 0;
    }
    else
    {
        pedirArreglo(a, tam);
        printf("El arreglo ingresado es: \n");
        imprimeArreglo(a, tam);
        res = sumatoria(a, tam);
    }

    printf("La sumatoria de nuestro arreglo es: %d ", res);
    return 0;
}