// Enunciado: Especificar el programa en C que calcula el valor absoluto de un número entero x.

// Precondición: Ninguna.

// Postcondición: El valor de la variable abs es igual al valor absoluto de x.

// Derivación:

// El programa recibe el valor de x como entrada.
// Se verifica si x es menor que cero. Si es así, se multiplica por -1 para obtener el valor absoluto.
// Se imprime el valor absoluto de x como resultado.

#include <stdio.h>
#include <assert.h>

int pedirEntero(void)
{
    int num;
    printf("Ingrese un numero entero: ");
    scanf("%d", &num);
    return num;
};

int main(void)
{
    int x, abs;
    printf("Calculadora de valores absolutos: \n\n");

    x = pedirEntero();
    abs = x;
    if (x < 0)
    {
        abs = -x;
    };

    printf("\nEl resultado es:  | %d | = %d \n\n", x, abs);
    // Precondición: Ninguna.
    // Postcondición: El valor de la variable abs es igual al valor absoluto de x.
    assert(abs == (x < 0 ? -x : x));

    return 0;
}