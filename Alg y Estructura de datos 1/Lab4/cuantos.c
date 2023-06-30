#include <stdio.h>
#include <stdbool.h>

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t
cuantos(int a[], int tam, int elem)
{
    struct comp_t res;
    int i;
    res.menores = 0;
    res.iguales = 0;
    res.mayores = 0;
    for (i = 0; i < tam; i++)
    {
        if (a[i] > elem)
        {
            res.mayores += 1;
        }
        else if (a[i] < elem)
        {
            res.menores += 1;
        }
        else
        {
            res.iguales += 1;
        }
    }
    return res;
}
void pedirArreglo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        printf("Elemento %d: ", i + 1);
        scanf("%d", &a[i]);
    }
}

int main(void)
{
    int tam, elem; // Definirlo así, hace que sea siempre una lista de tamaño 10, y yo solo estoy recorriendo las primeras tam posiciones?
    int x[10];
    struct comp_t resultados;
    bool pmen, pmay, piq;

    printf("Ingrese el tamanio del arreglo: ");
    scanf("%d", &tam);

    pedirArreglo(x, tam);

    printf("\nIngrese numero a comparar: ");
    scanf("%d", &elem);

    resultados = cuantos(x, tam, elem);

    pmen = (resultados.menores > 1 || resultados.menores == 0);
    pmay = (resultados.mayores > 1 || resultados.mayores == 0);
    piq = (resultados.iguales > 1 || resultados.iguales == 0);

    printf("\nEn el arreglo hay:\n       - %d numero%s menor%s\n       - %d numero%s igual%s\n       - %d numero%s mayor%s\n ",
           resultados.menores,
           pmen ? "s" : "", pmen ? "es" : "",
           resultados.iguales, piq ? "s" : "", piq ? "es" : "",
           resultados.mayores, pmay ? "s" : "", pmay ? "es" : "");
    return 0;
}