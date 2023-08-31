#include <stdio.h>

int main(void)
{
    int x, y, i;
    printf("Ingrese un valor x: ");
    scanf("%d", &x);
    printf("Ingrese un valor y: ");
    scanf("%d", &y);

    i = 0;
    printf("\nEstado Inicial (x,y,z)=(%d,%d,%d)\n", x, y, i);
    while (x >= y)
    {
        x = x - y;
        i++;
        printf("\nEstado %d (x,y,z)=(%d,%d,%d)", i, x, y, i);
    }
    return 0;
}