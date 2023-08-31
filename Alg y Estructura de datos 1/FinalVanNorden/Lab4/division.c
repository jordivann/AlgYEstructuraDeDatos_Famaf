#include <stdio.h>

struct div_t
{
    int cociente;
    int resto;
};

struct div_t division(int x, int y)
{
    struct div_t resultado;

    if (y == 0)
    {
        printf("Error: El denominador no puede ser cero.");
        resultado.cociente = 0;
        resultado.resto = 0;
    }
    else
    {
        resultado.cociente = x / y;
        resultado.resto = x % y;
    }

    return resultado;
}

int main(void)
{
    struct div_t resultado;
    int dividendo, divisor;
    printf("Ingrese dividendo: ");
    scanf("%d", &dividendo);
    printf("Ingrese divisor: ");
    scanf("%d", &divisor);
    resultado = division(dividendo, divisor);

    if (divisor != 0)
    {
        printf("Cociente: %d\n", resultado.cociente);
        printf("Resto: %d\n", resultado.resto);
    }
    printf("\n----------------Fin programa-----------------\n");

    return 0;
}
