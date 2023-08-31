#include <stdio.h>

int main(void)
{
    int x, i, cont;
    int res = 1;

    printf("Ingrese un valor x: ");
    scanf("%d", &x);

    i = 2;
    cont = 0;

    while ((i < x) && res)
    {
        printf("\nEstado %d (x,i,res)=(%d,%d,%d)", cont, x, i, res);
        cont++;
        res = res && (x % i != 0);
        i++;
        printf("\nEstado %d (x,i,res)=(%d,%d,%d)", cont, x, i, res);
    }

    return 0;
}
