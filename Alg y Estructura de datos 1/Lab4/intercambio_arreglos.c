#include <stdio.h>

void intercambiar(int a[], int tam, int i, int j)
{
    int temp;
    temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
int pedirEntero(char *variable)
{
    int num;
    printf("Ingrese valor de %s : ", variable);
    scanf("%d", &num);
    return (num);
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
void imprimeArreglo(int a[], int tam)
{
    int i;
    for (i = 0; i < tam; i++)
    {
        if (i == 0)
        {
            printf("[ %d ,", a[i]);
        }
        else if (i == tam - 1)
        {
            printf(" %d ] \n", a[i]);
        }
        else
        {
            printf(" %d ,", a[i]);
        }
    }
}

int main(void)
{
    int tam, s, t, x[10];

    // Pedimos el tamaño y el arreglo:
    tam = pedirEntero("Tamanio de arreglo");
    pedirArreglo(x, tam);
    imprimeArreglo(x, tam);

    // Pedimos las posiciones a cambiar:
    s = pedirEntero("Posicion 1");
    t = pedirEntero("Posicion 2");

    // Restamos 1 a la posicion ingresada por el usuario, ya que por como estamos mostrando por pantalla el número de los elementos,
    //  el usuario está ingresando valores del 1 al tam, y los arreglos tienen indices desde 0 al tam-1.
    // Es una solución, controlando lo que ingresan los usuario llevandolo al idioma arreglo..
    // o podría modificar la lógica condicional de abajo y adaptarlo.
    s -= 1;
    t -= 1;

    // Verifiquemos que si están dentro del rango se intercambie, sino msj de error.
    if (s >= 0 && s < tam && t >= 0 && t < tam) // SI el valor que se pasa i, j están dentro del tamaño especificado y mayor a cero.
    {
        printf("%d", x[1]);
        intercambiar(x, tam, s, t);
        printf("El nuevo arreglo es: \n");
    }
    else
    {
        printf("Las posiciones ingresadas estan fuera de rango.");
        return 0;
    };
    imprimeArreglo(x, tam);
    printf("\n----------------Fin programa-----------------\n");

    return 0;
}