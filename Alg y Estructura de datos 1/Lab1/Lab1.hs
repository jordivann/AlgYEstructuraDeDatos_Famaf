--EJERCICIOS
--Ejercicio 1. 
--a) esCero
esCero:: Int -> Bool
esCero n= n==0

--b) esPositivo
esPositivo :: Int -> Bool
esPositivo n = n>0

--c) esVocal
esVocal :: Char -> Bool
esVocal n = n=='a' || n=='e'|| n=='i' || n=='o' || n=='u'


--Ejercicio 2.
--a) paratodo
paratodo :: [Bool] -> Bool
paratodo xs = foldr (&&) True xs

--b) sumatoria
sumatoria :: [Int]->Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--c) Productoria 
productoria :: [Int] -> Int
productoria[] = 1
productoria (x:xs) = x * productoria xs

--d) Factorial
factorial :: Int -> Int
factorial n = productoria [1..n]

--e) Usando sumatoria hacer promedio 
largoLista :: [a] -> Int
largoLista = foldr (\ x -> (+) 1) 0
--Después me acordé de length pero ya que lo hice, lo dejamos así (:
promedio :: [Int]->Int
promedio [] = 0;
promedio xs = div(sumatoria xs) (largoLista xs)


--Ejercicio 3. 
-- Función pertenece
pertenece :: Int -> [Int] -> Bool
pertenece x [] = False;
pertenece x (y:ys) = x==y || pertenece x ys


--Ejercicio 4. 
--a) paratodo'
paratodo' :: [a] -> (a->Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

--b) existe'
existe' :: [a]-> (a->Bool)-> Bool
existe' [] f = False
existe' (x:xs) f = f x || existe' xs f

--c) Sumatoria' 
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = f x + sumatoria' xs f

--d) Productoria'
productoria' :: [a] -> (a->Int)-> Int
productoria' [] s = 1
productoria' (x:xs) s = s x * productoria' xs s


--Ejercicio 5. 
--Redefinimos paratodo pero usando paratodo' y sin recursión. 
paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id

--Ejercicio 6. 
--a) todosPares8
esPar :: Int -> Bool
esPar = even

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs esPar


--b) hayMultiplo

esMultiplo :: Int -> Int -> Bool
esMultiplo n x = mod x n == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)

--c) sumaCuadrados
sumaCuadrados:: Int -> Int
sumaCuadrados n = sumatoria' [1..n-1] (^2)

--d) Factorial ya está hecho en el 2 sin recursion.

--e) multiplicaPares 
multiplicaPares :: [Int]-> Int
multiplicaPares xs = productoria' (filter even xs) (*1)

{- Ejercicio 7) 
Map lo que hace es tomar una función y aplicarsela a todo elemento de una lista. 
Filter lo que hace es tomar una lista, y hacer un "test" a cada elemento de la lista, si es True, añade el elemento al principio de una nueva lista. 


map succ = [ 1,-4, 6,2,-8]
map va a tomar la función succ y lo que va a hacer es que va a sumar 1 unidad a cada elemento de la lista. 
La lista resultante va a ser [2,-3,7,3,-7]

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
soloPares:: [Int] -> [Int]
soloPares [] = [] 
soloPares (x:xs)
    | even x = [x] ++ soloPares xs
    | otherwise = soloPares xs

-- Funcion filter
soloPares' :: [Int] -> [Int]
soloPares' xs = filter esPar xs 

--multiplicaPares'
multiplicaPares' ::[Int] -> Int
multiplicaPares' xs = productoria(soloPares' xs)

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

-- Ejercicio 11
-- Recursion 
primIguales :: Eq a1 => [a1] -> [a1]
primIguales xs = primIgualesA (head xs) xs   

primIguales' :: Eq a1 => [a1] -> [a1]
primIguales' xs = primIgualesA' (head xs) xs

{- Tengo un error en este ejercicio, pero no puedo llegar con el tiempo 
 por temas de trabajo y un viaje (razones familiares), si puedo recibir una corrección 
 y la oportunidad de completarlo, para poder acceder a la promoción, sería mucho pedir, pero se agradecería muchisimo -}

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
