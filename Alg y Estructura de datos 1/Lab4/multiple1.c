#include <stdio.h>
#include <assert.h>

int pedirEntero(char *variable)
{
    int num;
    printf("Ingrese un numero entero para %s: ", variable);
    scanf("%d", &num);
    return num;
}

int main(void)
{
    int x, y, X, Y;
    x = pedirEntero("x");
    y = pedirEntero("y");

    X = x;
    Y = y;

    y = x + y;
    x = x + 1;

    printf("x = %d\n", x);
    printf("y = %d\n", y);

    assert(x == X + 1);
    assert(y == X + Y);
    return 0;
}
