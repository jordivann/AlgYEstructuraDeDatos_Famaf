#include <stdio.h>
#include <assert.h>

int pedirEntero(char *variable)
{
    int num;
    printf("Ingrese valor de %s : ", variable);
    scanf("%d", &num);
    return (num);
}

int main(void)
{
    int x, y, z, X, Y, Z;
    x = pedirEntero("x");
    y = pedirEntero("y");
    z = pedirEntero("z");
    X = x;
    Y = y;
    Z = z;

    x = y;
    y = y + X + z;
    z = Y + X;

    printf("x = y = %d\n", x);
    printf("y = y + x + z = %d\n", y);
    printf("z = y + x = %d\n", z);

    assert(x == Y && y == Y + X + Z && z == Y + X);
    return 0;
}