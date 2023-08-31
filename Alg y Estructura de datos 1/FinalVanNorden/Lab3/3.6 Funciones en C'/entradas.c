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
    int num = pedirEntero();
    imprimeEntero(num);
    return 0;
};

// 6.b Todos los programas que piden enteros, y que además lo muestran por consola pueden ser reescritos
// utilizando estas funciones, lo que hace que escribamos menos veces el mismo código. Es el principio de
// programar por componentes que se pueden repetir más de una vez en el código, evitando así recursos, memoria, errores y pérdida de legibilidad.
