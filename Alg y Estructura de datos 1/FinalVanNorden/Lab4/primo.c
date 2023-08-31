#include <stdio.h>
#include <stdbool.h>

bool es_primo(int num)
{
    int i;
    if (num < 2)
    {
        return false;
    }
    for (i = 2; i * i <= num; i++) // Si un num es compuesto, lo hace no primo. Por lo que no miramos divisores.
    {
        if (num % i == 0)
        {
            return false;
        }
    }
    return true;
}

int nesimo_primo(int N)
{
    int contador = 0;
    int num = 2;
    while (contador < N)
    {
        if (es_primo(num))
        {
            contador++;
        }
        num++;
    }
    return num - 1;
}
int main(void)
{
    int n, resultado;
    printf("Ingrese un numero entero no negativo:");
    scanf("%d", &n);
    while (n < 0)
    {
        printf("\nEl numero ingresado es negativo.\nIngrese uno valido: ");
        scanf("%d", &n);
    }

    resultado = nesimo_primo(n);

    printf("El %d-esimo numero primo es: %d\n", n, resultado);
    return 0;
}