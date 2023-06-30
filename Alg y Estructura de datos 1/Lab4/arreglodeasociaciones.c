#include <stdio.h>
#include <stdbool.h>

typedef char clave_t[15];
typedef int valor_t;

struct asoc
{
    clave_t clave;
    valor_t valor;
};

bool asoc_existe(struct asoc a[], int tam, clave_t c)
{
    bool fin = false;
    int i, valorc;
    for (i = 0; i < tam; i++)
    {
        if (strcmp(a[i].clave, c) == 0) // Utilizamos strcmp para comparar cadenas de caracteres
        {
            fin = true;
            break;
        }
    }
    return fin;
}

int main(void)
{
    struct asoc asociados[10];
    clave_t c;
    int i, tam, opcion;
    bool res = false;
    printf("---------------------------------------------");
    printf("\nIngrese tamanio de arreglo: ");
    scanf("%d", &tam);

    printf("\nIngrese el arreglo de asociados.\n");
    for (i = 0; i < tam; i++)
    {
        printf("Ingrese la clave del elemento %d: ", i + 1);
        scanf("%s", &asociados[i].clave);

        printf("Ingrese el valor del elemento %d: ", i + 1);
        scanf("%d", &asociados[i].valor);
    }
    printf("\n\nIngrese una clave: ");
    scanf("%s", &c);

    res = asoc_existe(asociados, tam, c);

    printf("Buscando %s -------> %s", c, res ? "Encontrado" : "No encontrado");
    printf("\n----------------Fin programa-----------------\n");

    return 0;
}

// Lo hice con char[50] y defini clave_t c. en lugar de char, y char c, cambiando respectivamente con " %c" los "%s" según corresponda.
// Para poder hacer claves más largas. Y usamos strcmp, que devuelve 0 si son iguales, negativo si la primera es menor, y positivo si la primera es mayor.
