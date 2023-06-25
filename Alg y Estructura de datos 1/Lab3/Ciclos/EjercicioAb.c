#include <stdio.h>

int main(void)
{
    int i;

    printf("Ingrese un valor i: ");
    scanf("%d", &i);

    while (i != 0)
    {
        printf("i = %d\n", i);
        i = 0;
    }

    printf("Estado final: i = %d\n", i);

    return 0;
}
