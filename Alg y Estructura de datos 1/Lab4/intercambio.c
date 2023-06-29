// Enunciado: Especificar el programa en C que intecambia los valores de dos variables x y de tip int.

// Preciondicion: Ninguna.

// Postcondicion: El valor de x es igual al valor inicial de y. El valor de y es igual al valor inicial de x.

// Derivacion:
// El prrograma primero pide 2 números enteros, x e y.
// guardo temporalmente el valor de x en temp que vendría a ser z,
// Guardo temporalmente el valor de y en temp que vendría a ser t,
// Intercambiamos vvalores de x e y con la varible temporal.
// luego, le asigno a x el valor de y, sin miedo a perder su anterior valor.
// Lo mismo para y.
// Assert puedo usarlo con x == t (valor inicial de y), y == z (valor inicial de x)

#include <stdio.h>
#include <assert.h>

int pedirEntero(char s)
{
    int num;
    printf("Ingrese un numero entero para %c: ", s);
    scanf("%d", &num);
    return num;
};

int main(void)
{
    int x, y, z, t;

    x = pedirEntero('x');
    y = pedirEntero('y');

    z = x;
    t = y;
    x = y;
    y = z;

    printf("\nEl intercambio de variables ha sido realizado:\n      x = %d \n      y = %d \n", x, y);

    // Precondicion ninguna
    // postcondicion
    assert(x == t && y == z);

    return 0;
}