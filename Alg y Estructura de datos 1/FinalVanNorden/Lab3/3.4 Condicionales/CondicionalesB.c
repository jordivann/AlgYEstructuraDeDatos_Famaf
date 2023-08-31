#include <stdio.h>

int main(void)
{
    int x, y, z, m;

    printf("Ejercicio 1e:\n");

    printf("Ingrese un valor x: ");
    scanf("%d", &x);
    printf("Ingrese un valor y: ");
    scanf("%d", &y);
    printf("Ingrese un valor z: ");
    scanf("%d", &z);
    printf("Ingrese un valor m: ");
    scanf("%d", &m);

    printf("\nEstado inicial:\nSigma 0: (x,y,z,m)=(%d,%d,%d,%d)", x, y, z, m);
    if (x < y)
    {
        m = x;
        printf("\n (x < y) => m = %d", m);
    }
    else if (x >= y)
    {
        m = y;
        printf("\n (x >= y) => m = %d", m);
    }
    printf("\nSigma 1: (x,y,z,m)=(%d,%d,%d,%d)", x, y, z, m);

    if (m >= z)
    {
        m = z;
        printf("\n (m >= z) => m = %d", m);
    }
    else
    {
        printf("\n (m < z)");
    }

    printf("\nSigma 2: (x,y,z,m)=(%d,%d,%d,%d)", x, y, z, m);

    return 0;
}

// Este programa lo que hace es buscar el mínimo número entre 3, (x,y,z).. Yo haría que m no se lo pida al usuario, y definirlo como 0 desde arranque, ya que pedirlo no cambia en nada más que cambiar el estado inicial.
