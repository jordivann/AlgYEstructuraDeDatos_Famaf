#include <stdio.h>
#include <float.h>

typedef struct persona_t
{
    char nombre[50];
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(persona_t arr[], unsigned int longitud)
{
    int i;
    float suma, prom;
    suma = 0;
    prom = 0;
    for (i = 0; i < longitud; i++)
    {
        suma += arr[i].peso;
    }
    prom = suma / longitud;
    return prom;
}
persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud)
{
    int i;
    int edadMayor = -1;
    persona_t mayor;
    for (i = 0; i < longitud; i++)
    {
        if (arr[i].edad > edadMayor)
        {
            edadMayor = arr[i].edad;
            mayor = arr[i];
        }
    }
    return mayor;
}
persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud)
{
    int i;
    float alturaMenor = FLT_MAX;
    persona_t bajo;
    for (i = 0; i < longitud; i++)
    {
        if (arr[i].altura < alturaMenor)
        {
            alturaMenor = arr[i].altura;
            bajo = arr[i];
        }
    }
    return bajo;
}

int main(void)
{
    persona_t p1 = {"Paola", 21, 1.85, 75};
    persona_t p2 = {"Luis", 54, 1.75, 69};
    persona_t p3 = {"Julio", 40, 1.70, 80};
    persona_t p;
    unsigned int longitud = 3;
    persona_t arr[] = {p1, p2, p3};
    printf("El peso promedio es %.2f\n kg", peso_promedio(arr, longitud));
    p = persona_de_mayor_edad(arr, longitud);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);
    p = persona_de_menor_altura(arr, longitud);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);
    return 0;
}
