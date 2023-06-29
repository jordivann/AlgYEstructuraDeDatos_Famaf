// Escribir un programa que solicite el ingreso de un arreglo de enteros
// int a[] y luego imprime por pantalla. El programa debe utilizar dos nuevas funciones con
// prototipo adem´as de la funci´on main:
// una que dado un arreglo y su tama˜no, solicita los valores del arreglo y los devuelve en
// el mismo arreglo int a[] con prototipo:
// void pedirArreglo(int a[], int n_max)
// otra que imprime cada uno de los valores de arreglo int a[].
// void imprimeArreglo(int a[], int n_max)
#include <stdio.h>

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
            printf(" %d ]", a[i]);
        }
        else
        {
            printf(" %d ,", a[i]);
        }
    }
}

int main(void)
{
    int max_arreglo = 10;
    int a[max_arreglo];
    int n_max;
    printf("Ingrese la cantidad de datos del arreglo: ");
    scanf("%d", &n_max);

    if (max_arreglo < n_max)
    {
        printf("El maximo de arreglo impuesto por mi es 10");
        return 0;
    }
    else if (n_max < 0)
    {
        printf("El arreglo debe tener una cantidad positiva de datos");
        return 0;
    }
    else if (n_max == 0)
    {
        printf("[ ]");
        return 0;
    }

    pedirArreglo(a, n_max);

    printf("El arreglo ingresado es:\n");

    imprimeArreglo(a, n_max);

    return 0;
}
