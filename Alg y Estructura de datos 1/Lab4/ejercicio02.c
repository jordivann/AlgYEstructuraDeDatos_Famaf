// (Asignaciones multiples) Considerar las siguientes asignaciones m´ultiples
// {Pre: x = X, y = Y}
// x, y := x + 1, x + y
// {Post: x = X + 1, y = X + Y}
// {Pre: x = X, y = Y, z = Z}
// x, y, z := y, y + x + z, y + x
// {Post: x = Y, y = Y + X + Z, z = Y + X}
// a) Escribir un programa equivalente que s´olo use secuencias de asignaciones simples.
// b) Traducir los programas resultantes a C en archivos nuevos llamados multiple1.c y
// multiple2.c respectivamente.
// Recordar: Como C no tiene asignaciones m´ultiples, siempre ser´a necesario traducirlas primero
// a secuencias de asignaciones simples.

// Ejercicio a.
//  {Pre: x = X, y = Y}
//  x := x + 1
//  y := x + y
//  {Post: x = X + 1, y = X + Y}

// {Pre: x = X, y = Y, z = Z}
// temp1 := y
// temp2 := y + x + z
// x := temp1
// y := temp2
// z := y + x
// {Post: x = Y, y = Y + X + Z, z = Y + X}
