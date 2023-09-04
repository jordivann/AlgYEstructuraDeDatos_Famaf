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


--d) valorAbsoluto 
valorAbsoluto :: Int -> Int
valorAbsoluto x 
    | x<0 = -x 
    | otherwise = x 


-- Ejercicio 2 Con induccion y composición 
--Todos los elementos son true
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

-- -- Para hacerlo con composición usamos foldr
-- paratodo':: [Bool] -> Bool
-- paratodo' = foldr (&&) True;


--Que calcule la suma de todos los elementos de una lista de enteros
sumatoria :: [Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- --composicion
-- sumatoria' :: [Int] -> Int
-- sumatoria' = foldr (+) 0


--Que calcule el productor de todos los elementos de la lista de enteros. 
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- --con composicion 
-- productoria' :: [Int] -> Int
-- productoria' = foldr (*) 1

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
paratodo' :: [a] -> (a->Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && (paratodo' xs t)

--Dada una lista xs de tipo [a] y un predicado t:: a-> Bool, determina si algun elemento de xs 
-- satisface t- 
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

--Dada una lista xs de tipo [a] y una función t :: a -> Int, calcula el producto de los valores que 
--resultan de la aplicacion de t a los elementos xs 
sumatoria' :: [a] -> ( a->Int ) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

productoria' :: [a] -> (a -> Int ) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t

-- Ejercicio 5- Definir nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo' (sin usar recursion ni analisis de casos)
paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id


--Ejercicio 6, Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composicion sin usar recursion ni análisis de casos-

-- a) Verifica que todos los números de una lista sean pares. 
todosPares:: [Int]->Bool
todosPares xs = paratodo' xs even

-- b) Verifica que algún elemento de la lista sea múltiplo del primer parámetro. 
esMultiplo :: Int -> Int -> Bool
esMultiplo n y = mod y n == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)

--c) sumaCuadrados
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [1..n-1] (^2)

--d) Existe divisor
divisor :: Int -> Int -> Bool
divisor n x = n `mod` x == 0

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n [] = False
existeDivisor n (x:xs) = existe' xs (divisor n)

-- e) esPrimo 
esPrimo :: Int -> Bool
esPrimo n = not (existeDivisor n [1..n-1])

--f)  ¿Se te ocurre como redefinir factorial para evitar hacer recursión? 
factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = productoria [1..n] 


--g) multiplicaPrimos 
listaPrimos :: [Int] -> [Int]
listaPrimos xs = filter esPrimo xs

multiplicaPrimos :: [Int]-> Int
multiplicaPrimos xs = productoria (listaPrimos xs) 

--h) esFib :: Int -> Bool 
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

esFib :: Int -> Bool
esFib n
    | n < 0     = False  -- Caso base: Si n es menor que 0, n no está en la sucesión de Fibonacci.
    | otherwise = auxFib n 0 1

auxFib :: Int -> Int -> Int -> Bool
auxFib n a b
    | n == a    = True  -- Caso base: Si n es igual a a, n está en la sucesión de Fibonacci.
    | n < a     = False -- Caso base: Si n es menor que a, n no está en la sucesión de Fibonacci.
    | otherwise = auxFib n b (a + b)


todosFib :: [Int] -> Bool
todosFib [] = True
todosFib (x:xs) 
    | esFib x = True && todosFib xs
    | otherwise = False 


{- Ejercicio 7) 
Map lo que hace es tomar una función y aplicarsela a todo elemento de una lista. 
Filter lo que hace es tomar una lista, y hacer un "test" a cada elemento de la lista, si es True, añade el elemento al principio de una nueva lista. 


map succ = [1, -4, 6, 2, -8],
map va a tomar la función succ y lo que va a hacer es que va a sumar 1 unidad a cada elemento de la lista. 
La lista resultante va a ser [2, -3, 7, 3, -7],

filter esPositivo [ 1, -4, 6, 2, -8]
Lo que va a hacer es construir una nueva lista solo con valores positivos osea: [1,6,2]
-}

-- Ejercicio 8
-- Por recursion: 
duplicar :: [Int] -> [Int]
duplicar [] = []
duplicar (x:xs) = (2*x):duplicar (xs)

-- Funcion Map 
duplicar' :: [Int]-> [Int]
duplicar' xs = map (*2) xs

--Ejercicio 9
--Recursión
-- soloPares:: [Int] -> [Int]
-- soloPares [] = [] 
-- soloPares (x:xs)
--     | even x = [x] ++ soloPares xs
--     | otherwise = soloPares xs

-- Funcion filter
-- soloPares' :: [Int] -> [Int]
-- soloPares' xs = filter esPar xs 


-- --multiplicaPares'
-- multiplicaPares' ::[Int] -> Int
-- multiplicaPares' xs = productoria(soloPares' xs)

soloPrimos :: [Int] -> [Int]
soloPrimos []  = [] 
soloPrimos (x:xs) 
    | esPrimo x = x : soloPrimos xs
    | otherwise = soloPrimos xs

--Funcion filter
soloPrimos' ::  [Int] -> [Int]
soloPrimos' xs = filter esPrimo xs


-- Ejercicio 10
-- Recursion
primIgualesA :: Eq a1=> a1 -> [a1] -> [a1]
primIgualesA a [] = []
primIgualesA a (x:xs) 
    | a == x = a: primIgualesA a xs
    | otherwise = [] 

--TakeWhile

primIgualesA' :: Eq a1 => a1 -> [a1] -> [a1]
primIgualesA' s xs = takeWhile(==s) xs 

-- [1 of 1] Compiling Main             ( Lab1.hs, interpreted )
-- Ok, one module loaded.
-- *Main> primIgualesA 3 [3,3,4,1]
-- [3,3]
-- *Main> primIgualesA 3 [4,3,3,4,1]
-- []
-- *Main> primIgualesA 3 []         
-- []
-- *Main> primIgualesA 'a' "aaada"
-- "aaa"


-- Ejercicio 11
-- Recursion 
primIguales :: Eq a1 => [a1] -> [a1]
primIguales [] = []
primIguales [x]=[x]
primIguales (x:(y:xs)) 
    | x == y = x: primIguales (y:xs)
    | otherwise = [x]

primIguales' :: Eq a1 => [a1] -> [a1]
primIguales' (x:xs) = primIgualesA x (x:xs) 



 -- Ejercicio 12 
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ z [] _ = z
cuantGen op z (x:xs) t = op(t x) (cuantGen op z xs t)

--a) paratodo'
paratodo''' :: [a] -> (a->Bool) -> Bool
paratodo''' xs t = cuantGen(&&) True xs t


--b) existe'
existe''':: [a] -> (a->Bool) -> Bool
existe''' xs t = cuantGen(&&) True xs t

--c) Sumatoria' 
sumatoria''' :: [a] -> (a -> Int) -> Int
sumatoria''' xs t = cuantGen(+) 0 xs t

--d) Productoria'
productoria''' :: [a] -> (a->Int)-> Int
productoria''' xs t = cuantGen(*) 1 xs t


-- Ejercicio 13 
-- Definir una función que se denomina distania de edición. Que toma como entrada dos strings
distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] xs = length xs
distanciaEdicion ys [] = length ys
distanciaEdicion (x:xs) (y:ys) 
    | x==y = distanciaEdicion xs ys
    | x /= y = 1 + distanciaEdicion xs ys


--Ejercicio 14
primQueCumplen :: Eq a => [a] -> (a -> Bool) -> [a]
primQueCumplen ls p = takeWhile p ls




{- 
    a.  f :: (a, b) -> ...
        f (x , y) = ...

        (x,y) :: (a,b)
        x::a
        y::b

        Si cubre todos los casos
    b.  f :: [(a, b)] -> ...
        f (a , b) = ...

        Mal tipado, pues le pasa una tupla, y necesita una lista de tuplas

    c.  
        Está bien tipado pero no se cubre la lista vacía.
    d.  f :: [(a, b)] -> ...
        f ((x, y) : ((a, b) : xs)) = ...
        Bien tipado. 
        Faltan 2 casos, vacío y un elemento sólo. 
    e.  Bien tipado, falta caso vacío.
    f.  Mal tipado pues pone un Int donde debe ir un a.(1 no es cualquier cosa)
    g.  Bien, falta caso vacío.
    h. Bien tipado.
    i. Mal tipado.

-}

{- Ejercicio 14. 
a. x|f (_,y) = y
b. no se puede escribir la funcion de este tipo, porque no puedo a partir de 
    a y b otro tipo c.. 
    f= undefined... 
c) 
-}
