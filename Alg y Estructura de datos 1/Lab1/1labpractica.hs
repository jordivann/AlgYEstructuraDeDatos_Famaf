-- Ejercicios 
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

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


--Que calcule el productor de todos los elementos de la lista de enteros. 
productoria :: [Int] -> Int 
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- Que toma el número n y le calcula el factorial 
factorial :: Int -> Int 
factorial 0 = 1
factorial n = n * factorial(n-1)



