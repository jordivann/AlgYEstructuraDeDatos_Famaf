// minimo --
// Enunciado: Especificar el programa en C que calcula el mínimo entre dos variables enteras x e y.
// Precondicion: Ninguna
//  PostCondicion: El valor de la variable min es igual minimo entre x e y.

// Derivación:
// El programa recibe los valores de x e y como entrada.
// Se inicializa la variable min con el valor de x
// Se verifica si y es menor que min, en cuyo caso se actualiza min con el valor de y.
// Se imprime el valor de min cxomo resultado.

#include <assert.h>
#include <stdio.h>

int pedirEntero(void)
{
    int num;
    printf("Ingrese un numero entero: ");
    scanf("%d", &num);
    return num;
};
void imprimeEntero(int x)
{
    printf("\nEl entero es : %d\n", x);
};

int main(void)
{
    int x, y, min;
    printf("DAME DOS NUMEROS Y TE DIRE CUAL ES MENOR.\n");
    x = pedirEntero();
    y = pedirEntero();

    min = x;

    if (y < min)
    {
        min = y;
    }
    printf("\nEl numero menor numero entre %d y %d es %d. \nVuelve a correr el programa para saber el menor entre otros dos numeros. ", x, y, min);

    // precondicion: ninguna
    // postcondicion:
    assert(min == (x < y ? x : y));
    printf("\n----------------Fin programa-----------------\n");
    return 0;
}