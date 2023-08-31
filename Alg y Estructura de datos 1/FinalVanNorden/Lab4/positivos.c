#include <stdio.h>
#include <stdbool.h>

void pedirArreglo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
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

bool existe_positivo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        if (a[i] > 0)
        {
            return true;
        }
    }
    return false;
}

bool todos_positivos(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        if (a[i] <= 0)
        {
            return false;
        }
    }
    return true;
}

int main(void)
{
    int x[10], tam, opcion;
    bool resultado1, resultado2;

    printf("Dame el tamanio del arreglo: ");
    scanf("%d", &tam);

    pedirArreglo(x, tam);

    printf("Elija una opcion:\n\n");
    printf("    1. Todos positivos.\n");
    printf("    2. Existe algun positivo.\n\n");
    printf("Ingrese el numero de opcion: ");
    scanf("%d", &opcion);

    switch (opcion)
    {
    case 1:
        printf("\nElegiste la funcion TODOS POSITIVOS.\n");
        resultado1 = todos_positivos(x, tam);
        printf("Respuesta: %s\n", resultado1 ? "True" : "False");
        break;

    case 2:
        printf("\nElegiste la funcion EXISTE UN POSITIVO.\n");
        resultado2 = existe_positivo(x, tam);
        printf("Respuesta: %s\n", resultado2 ? "True" : "False");
        break;

    default:
        printf("\nLa opcion ingresada es incorrecta.\n");
        break;
    }

    printf("\n\nEl arreglo ingresado fue : \n");
    imprimeArreglo(x, tam);
    printf("\n----------------Fin programa-----------------\n");
    // Para esta opción cambiar bool = resultado, no 1 ni 2.
    // if (opcion == 1)
    // {
    //     printf("Elegiste la funcion TODOS POSITIVOS.\n");
    //     resultado = todos_positivos(x, tam);
    //     printf("Respuesta: %s\n", resultado ? "True" : "False");
    // }
    // else if (opcion == 2)
    // {
    //     printf("Elegiste la funcion EXISTE UN POSITIVO.\n");
    //     resultado = existe_positivo(x, tam);
    //     printf("Respuesta: %s\n", resultado ? "True" : "False");
    // }
    // else
    // {
    //     printf("La opcion ingresada es incorrecta.\n");
    // }

    return 0;
}
