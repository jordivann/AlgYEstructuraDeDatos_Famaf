#include <stdio.h>

int main(void)
{
    int x, y;

    printf("Ejercicio 1e:\n");

    printf("Ingrese un valor x: ");
    scanf("%d", &x);
    printf("Ingrese un valor y: ");
    scanf("%d", &y);

    if (x >= y)
    {
        printf("\nCONDICIONAL (x > y):\nEstado sigma 1:  (x,y)=(%d,%d) \n", x, y);
        x = 0;
        printf("Actualizacion estado:\nEstado sigma 2: (x,y)=(%d,%d)\n\n", x, y);
    }
    else if (x <= y)
    {
        printf("\nCONDICIONAL (x < y):\nEstado sigma 1':  (x,y)=(%d,%d) \n", x, y);
        x = 2;
        printf("Actualizacion estado, sigma 2':  (x,y)=(%d,%d) \n\n", x, y);
    }
    printf("ESTADO FINAL:\nEstado sigma 3:  (x,y)=(%d,%d) \n\n", x, y);

    return 0;
}