#include <stdio.h>

int main(void)
{
    int x, y, xc, yc;
    printf("Ejercicio 1 b\n");

    printf("Ingrese un valor x: ");
    scanf("%d", &x);
    printf("Ingrese un valor y: ");
    scanf("%d", &y);
    printf("σ0 -> x=%d y=%d\n", x, y);
    x = x + y;
    printf("σ1 -> x=%d y=%d\n", x, y);

    y = y + y;
    printf("σ2 -> x=%d y=%d\n", x, y);

    printf("\nEjercicio 1 c\n");

    printf("Ingrese un valor x: ");
    scanf("%d", &xc);
    printf("Ingrese un valor y: ");
    scanf("%d", &yc);

    printf("σ0 -> x=%d y=%d\n", xc, yc);
    yc = yc + yc;
    printf("σ1 -> x=%d y=%d\n", xc, yc);
    xc = xc + yc;
    printf("σ2 -> x=%d y=%d\n", xc, yc);

    return 0;
}
