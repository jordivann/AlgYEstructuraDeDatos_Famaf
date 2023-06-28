// ejercicio01.c que lee una variable n de tipo int e imprime por pantalla “hola” n
// veces. En esta ocasi´on el programa debe utilizar dos funciones a definir (adem´as de la
// funci´on main). Program´a en un archivo .c la funci´on de prototipo:
// void holaHasta(int n)
// 1
// que dado un int n, imprime n veces “Hola”. (Usar una bucle while). La funci´on main
// pide un n´umero en la entrada antes de llamar holaHasta (¿qu´e funci´on podes usar ya
// implementada?). Us´a la funci´on assert (ver te´orico) para chequear que x > 0.
#include <stdio.h>
#include <assert.h>

void holaHasta(int n)
{
    int i = 0;
    while (n != i)
    {
        printf("%d.) Hola \n", i + 1);
        i = i + 1;
    }
}

int main(void)
{
    int x;
    printf("Ingrese un valor positivo: ");
    scanf("%d", &x);
    assert(x >= 0);
    holaHasta(x);

    return 0;
}