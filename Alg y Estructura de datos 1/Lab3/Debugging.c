#include <stdio.h>
#include <stdbool.h>

int main()
{
    int x, y, z;

    bool expresion1;
    bool expresion2;
    printf("Ingrese valor de x: ");
    scanf("%d", &x);
    printf("Ingrese valor de y: ");
    scanf("%d", &y);
    printf("Ingrese valor de z: ");
    scanf("%d", &z);

    expresion1 = x % 4 == 0;
    expresion2 = (x + y == 0) && (y - x == (-1) * z);

    // char bBool;
    // (b == 0) ? bBool = 'False' : bBool = 'True';
    // char wBool

    printf("Expresion 1: %s, Expresion 2: %s \n",
           expresion1 ? "True" : "False", expresion2 ? "True" : "False");

    return 0;
}
