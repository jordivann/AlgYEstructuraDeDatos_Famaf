#include <stdio.h>
#include <limits.h>

struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};
float max(float a[], int tam)
{
    int i;
    float max = INT_MIN;

    for (i = 0; i < tam; i++)
    {
        if (a[i] > max)
        {
            max = a[i];
        }
    }
    return max;
}

float min(float a[], int tam)
{
    int i;
    float min = INT_MAX;
    for (i = 0; i < tam; i++)
    {
        if (a[i] < min)
        {
            min = a[i];
        }
    }
    return min;
}
float sumatoria(float a[], int tam)
{
    int i;
    float suma = 0;
    for (i = 0; i < tam; i++)
    {
        suma += a[i];
    }

    return suma;
}

float prom(float a[], int tam)
{
    float suma, prom;
    suma = sumatoria(a, tam);
    prom = suma / tam;
    return prom;
}

struct datos_t stats(float a[], int tam)
{
    struct datos_t stats;

    stats.maximo = max(a, tam);
    stats.minimo = min(a, tam);
    stats.promedio = prom(a, tam);
    return stats;
}
void pedirArreglo(float a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        printf("Elemento %d: ", i + 1);
        scanf("%f", &a[i]);
    }
}

int main(void)
{
    int tam;
    float x[10];
    struct datos_t stats_r;
    printf("Tamanio del arreglo: ");
    scanf("%d", &tam);

    printf("\nIngrese Arreglo:\n");
    pedirArreglo(x, tam);

    stats_r = stats(x, tam);
    printf("Imprimiendo stats:\n         -Minimo:     %.2f\n         -Maximo:     %.2f\n         -Promedio:   %.2f ",
           stats_r.minimo, stats_r.maximo, stats_r.promedio);
    return 0;
}