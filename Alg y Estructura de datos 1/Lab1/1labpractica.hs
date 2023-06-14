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
