-- Ejercicios 
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Distribution.Simple.Setup (falseArg)

-- esCero :: Int -> Bool , que verifica si un entero es igual a 0
esCero :: Int -> Bool
esCero n = n==0;

-- esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0 
esPositivo :: Int -> Bool
esPositivo n = n > 0 ;
-- Para números negativos usar parentesis. 


--esVocal :: Char -> Bool, que verifica si un carácter es una vocal en minúscula. 

esVocal:: Char -> Bool
esVocal x =( x=='a') || (x=='e' )|| (x=='i') || (x=='o') || (x=='u');
-- Utilizar el char entre comillas simples

-- Ejercicio 2 Con induccion y composición 
--Todos los elementos son true
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

-- Para hacerlo con composición usamos foldr
paratodo':: [Bool] -> Bool
paratodo' = foldr (&&) True;


--Que calcule la suma de todos los elementos de una lista de enteros
sumatoria :: [Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--composicion
sumatoria' :: [Int] -> Int
sumatoria' = foldr (+) 0


--Que calcule el productor de todos los elementos de la lista de enteros. 
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--con composicion 
productoria' :: [Int] -> Int
productoria' = foldr (*) 1

-- Que toma el número n y le calcula el factorial 
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)

-- Utilizando la función sumatoria antes definida, definir una funcion que toma una 
-- lista de números no vacía y calcula el valor promedio (truncado usando division entera)

-- Para hacerlo definimos largoLista
largoLista :: [Int] -> Int
largoLista [] = 0
largoLista (x:xs) = 1 + largoLista xs

promedio :: [Int] -> Int
promedio (xs) = div (sumatoria(xs))  (largoLista(xs))

-- Ejercicio 3. Programa la funcion pertenece :: Int -> [Int] -> Bool, que verifica si un número se encuentra
--              en la lista
pertenece :: Int -> [Int] -> Bool
pertenece x [] = False
pertenece x (y:ys) = x==y || pertenece x ys


-- Ejercicio 4. Programá las siguientes funciones que implementan los cuantificadores generales.
--              Nota el segundo parámetro de cada función, es otra función. 

--Dada una lista xs de tipo [a] y un predicado t:: a-> Bool, determina si todos los elementos 
--de xs satisfaces el predicado t. 
paratodo'' :: [a] -> (a->Bool) -> Bool
paratodo'' [] t = True
paratodo'' (x:xs) t = t x && (paratodo'' xs t)

--Dada una lista xs de tipo [a] y un predicado t:: a-> Bool, determina si algun elemento de xs 
-- satisface t- 
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

--Dada una lista xs de tipo [a] y una función t :: a -> Int, calcula el producto de los valores que 
--resultan de la aplicacion de t a los elementos xs 
sumatoria'' :: [a] -> ( a->Int ) -> Int
sumatoria'' [] t = 0
sumatoria'' (x:xs) t = t x + sumatoria'' xs t

productoria'' :: [a] -> (a -> Int ) -> Int
productoria'' [] t = 1
productoria'' (x:xs) t = t x * productoria'' xs t

-- Ejercicio 5- Definir nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo'' (sin usar recursion ni analisis de casos)
paratodo''' :: [Bool] -> Bool
paratodo''' xs = paratodo'' xs id


--Ejercicio 6, Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composicion sin usar recursion ni análisis de casos-

-- Verifica que todos los números de una lista sean pares. 
todosPares:: [Int]->Bool
todosPares xs = paratodo'' xs even

-- Verifica que algún elemento de la lista sea múltiplo del primer parámetro. 
esMultiplo :: Int -> Int -> Bool
esMultiplo n y = mod y n == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)

-- Dado un número no negativo n, calcula la suma de los primeros n cuadrados. 
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria'' [1..n-1] (^2)
-- Empieza de 1 porque 0^2=0  asi que no importa no incluirlo, ahorramos pasos. 

-- ¿Se te ocurre como redefinir factorial para evitar hacer recursión? 
factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = productoria' [1..n]

-- Que calcule el producto de todos los números pares de una lista .
--Realizamos nuestra propia función filter para que nos devuelva x si es par, 1 (neutro de multiplicación) si no lo es. 
esPar :: Int -> Int
esPar x | even x = x
        | otherwise = 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = (productoria'' xs esPar)


-- Ejercicio 7. 
-- La sintaxis general ed filter es: filter :: (a -> Bool) -> [a] -> [a]
sonPar :: [Int] -> [Int]
sonPar = filter even
-- La función map toma una función y una lista, y devuelve una nueva lista que resulta de aplicar la función a cada elemento
-- de la lista original. Transforma los datos según la función dada..

obtenerCuadrados :: [Int]-> [Int]
obtenerCuadrados xs = map (\x -> x*x) xs


-- Si reducimos como vscode quiere: 
--obtenerCuadrados :: [Int]-> [Int]
--obtenerCuadrados = map (\x -> x*x)

-- Ejercicio 8. Programá una función que dada una lista de números xs, devuelve la lista que resulta de duplicar cada valor de xs. 
-- Recursión. 
duplicaValores :: [Int] -> [Int]
duplicaValores [] = [];
duplicaValores (x:xs) = [x*2] ++ duplicaValores xs

duplicaValores' :: [Int] -> [Int]
duplicaValores' lista = map (*2) lista

-- Ejercicio 9. Programá una función que dada una lista de números xs, calcule una lista que tiene como elementos aquellos números de xs que son pares 
-- sonPar :: [Int] -> [Int]
-- sonPar = filter even

sonPar' :: [Int] -> [Int]
sonPar' [] = []
sonPar' (x:xs) | even x = x:sonPar' xs
               | otherwise = sonPar' xs

--Ejercicio 10. primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de la lista cuyos elementos son iguales a ese valor. 
primIgualesA' :: Eq a => a -> [a] ->[a]
primIgualesA' x [] = []
primIgualesA' x (y:ys) | x==y = y:primIgualesA' x ys
                       | otherwise = []

primIgualesA :: Eq a => a -> [a] ->[a]
primIgualesA n lista = takeWhile (==n) lista

--Ejercicio 11. Ahora modifique la función para que devuelva el primer elemento, y cuantos elementos iguales tenga. 
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:(y:xs)) 
    | x == y = x:primIguales (y:xs)
    | otherwise =[ x ]

primIguales' :: Eq a => [a] -> [a]
primIguales' [] = [] -- Solo para que no nos dé error al pasar el caso particular vacío, 
primIguales'(x:xd) = primIgualesA (x) (x:xd)

-- Ejercicio 12. Generalizar con termino paratodo, existe, sumatoria, productoria. 

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] _ = z
cuantGen op z (x:xs) t = op (t x) (cuantGen op z xs t)


paratodoGen :: [a] -> ( a-> Bool ) -> Bool 
paratodoGen xs t = cuantGen (&&) True xs t

existeGen :: [a] -> (a-> Bool) -> Bool
existeGen xs t = cuantGen (||) False xs t

sumatoriaGen :: [a] -> (a -> Int) -> Int
sumatoriaGen xs t = cuantGen (+) 0 xs t

productoriaGen :: [a]->(a-> Int)->Int
productoriaGen xs t = cuantGen (*) 1 xs t

-- Ejercicio 13. 
-- Para cada uno de los siguiente spatrones, decidí si están bien tipados, y en tal caso da los tipos de cada subexpresión. 
-- En caso de estar bien tyipado, ¿el patrón cubre todos los casos de definición?
-- a)
    -- f :: (a,b)
    -- f (x,y)              Si está bien tipado, f recibe una tupla de valores x,y. 

-- b)
    --f:: [(a,b)]
    --f(a,b) = ...          No es correcta, tenemos un error, f está recibiendo una tupla, cuando tiene que recibir una lista de tuplas.

-- c)
    --f:: [(a,b)]
    --f (x:xs) = ...        Es correcto, pero x será una tupla, y xs una tupla de listas. 

-- d)
    -- f:: [(a,b)] ->
    -- f((x,y):((a,b):xs)) Si, es correcto, a diferencia del anterior tenemos acceso a los datos de cada tupla. Para ampliar el anterior: 
    --                     x=(x,y) xs=((a,b):xs). Donde podríamos por ejemplo comparar los valores de las tuplas x=a && y=b, entonces 
    --                      estaríamos en el caso de que tenemos los mismos puntos, en los primeros dos elementos de la lista, POR EJEMPLO. 


-- e)
    -- f::[(Int,a)]
    -- f[(0,a)]=... Si es correcto, es un caso particular, para el caso de una lista de una sola tupla, donde el primer elemento es 0. 

-- f)
    -- f::[(Int,a)]
    -- f((x,1):xs) = ...  No es correcto, (1,x) sería el orden correcto para estar bien tipado. 

--i) -- No está bien tipado, pues le debe pasar una función que te transforma un int en otro int, no dos int's- 


-- Ejercicio 14. 
--a) f::(a,b)->b
    --f (x,y) = y
--b) f::(a,b)-> c
    --f(x,y)=z
--c) f :: (a->b)->a->b
    --f func x = y
    -- func :: a -> b
--d) f :: (a->b) -> [a] -> [b]
    --f func xs = ys
    -- Por ejemplo filtrado 
--e) ff:: (a-> b ) -> (b-> c) -> a -> c
    --f func funcb x = z

    -- func :: (a -> b)
    --funcb :: (b -> c)
