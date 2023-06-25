#include <stdio.h>
#include <stdbool.h>

int main()
{
    int x, y, z;

    int expresion1;
    int expresion2;
    bool expresion3;
    double expresion4;
    bool expresion5;
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese valor de y: ");
    scanf("%d", &y);
    printf("Ingrese valor de z: ");
    scanf("%d", &z);

    printf("Los valores de x, y y z son: %d, %d, %d respectivamente\n", x, y, z);

    expresion1 = x + y + 1;
    expresion2 = z * z + y * 45 - 15 * x;
    expresion3 = (y - 2 == (x * 3 + 1) % 5);
    expresion4 = (y / 2.0) * x;
    expresion5 = (y < x * z);

    printf("Expresion 1: %d, Expresion 2: %d, Expresion 3: %s, Expresion 4: %.2f, Expresion 5: %s\n",
           expresion1, expresion2, expresion3 ? "true" : "false", expresion4, expresion5 ? "true" : "false");

    return 0;
}
