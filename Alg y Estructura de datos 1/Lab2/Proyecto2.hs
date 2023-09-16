
--LABORATORIO 2
--EJERCICIOS
--1. Tipos enumerados
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematicas"
titulo Fisica = "Licenciatura en Física"
titulo Computacion = "Licenciatura en ciencias de la computacion"
titulo Astronomia = "Licenciatura en Astronomía"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
  deriving (Show, Eq, Bounded, Ord)
--modificado por el punto 2a .  

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- 2. Clases de Tipos 
-- deriving Eq -> Para comparar. 
--          Show -> Para mostrar
--          Bounded -> Para definir minimos 
--          Ord -> da un Orden

--3 Polimorfismo ad hoc 
-- Recordandon la funcion sumatoria: Modificandola: 
sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
-- Num a , es para limitar el polimorfismo de la función a la clase de nums, que contiene a floats, integer... 

--Definiendo listas NO vacías y por recursión. No necesitamos bounded, necesitamos ord. 
minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:(y:xs))
  | x < y = minimoElemento (x:xs)
  | otherwise = minimoElemento (y:xs)

-- minBound es el absorbente, maxBound es el neutro
minimoElemento' ::  (Bounded a, Ord a)=>[a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = x `min` minimoElemento' xs
-- minimoElemento'[2,3,54,65,1]::Int

-- 'Cual es más grave de las notas musicales?'
-- minimoElemento'[Fa', La', Sol', Re']::NotaBasica'


-- 4 -- Sinónimos de tipos; constructores con parámetros
type Altura = Int
type NumCamiseta = Int
-- Tipos algebr ́aicos sin par ́ametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving Eq
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha
-- Sin ́onimo
type ManoHabil = PiernaHabil
-- Deportista es un tipo algebraico con constructores param ́etricos
data Deportista = Ajedrecista --Constructor sin argumentos
  | Ciclista Modalidad --Constructor con un argumento
  | Velocista Altura --Constructor con un argumento
  | Tenista TipoReves ManoHabil Altura -- Constructor con tres argumentos
  | Futbolista Zona NumCamiseta PiernaHabil Altura -- Constructor con 

--b) QUE TIPO TIENE CICLISTA? 
-- :t Ciclista 
-- Ciclista :: Modalidad -> Deportista

--c) 
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista a):xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs


--d) 
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0 ;
contar_futbolistas ((Futbolista z n p h):xs) zona
  | z == zona = 1 + (contar_futbolistas xs zona)
  | otherwise = contar_futbolistas xs zona
contar_futbolistas (_:xs) z = contar_futbolistas xs z

--e) Reprogramala para usar filter 
contar_futbolistas':: [Deportista] -> Zona -> Int
contar_futbolistas' xs zona = length( filter esFutbolenZona xs)
  where
    esFutbolenZona (Futbolista z _ _ _ ) = z == zona
    esFutbolenZona _ = False


-- Definición de clases
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11
--b)
data Alteracion = Bemol | Natural | Sostenido
--c)

data NotaMusical = Nota NotaBasica Alteracion

--d)
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nm Sostenido) = sonidoNatural nm + 1
sonidoCromatico (Nota nm Bemol) = sonidoNatural nm - 1
sonidoCromatico (Nota nm Natural )= sonidoNatural nm


--e)
instance Eq NotaMusical
  where
    nota1 == nota2 = sonidoCromatico nota1 == sonidoCromatico nota2

--f) 
instance Ord NotaMusical
  where
    nota1 <= nota2 = sonidoCromatico nota1 <= sonidoCromatico nota2

-- Ejercicio 6 
-- Tipos enumerados con polimorfismo. 
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- Ejercicio 7 
-- Tipos Recursivos. 


data Cola = VaciaC | Encolada Deportista Cola
--Primer elemento es el de la derecha. 
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p c) = Just c

encolar :: Deportista -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada p' c) = Encolada p' (encolar p c)

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC k = Nothing
busca (Encolada deportista cola) zona
    | esFutbolistaEnZona deportista zona = Just deportista
    | otherwise = busca cola zona
    where
      esFutbolistaEnZona :: Deportista -> Zona -> Bool
      esFutbolistaEnZona (Futbolista z _ _ _) zona = z==zona
      esFutbolistaEnZona _ zona= False


-- El primer elemento es el de más a la izquierda
atender' :: Cola -> Maybe Cola
atender' VaciaC = Nothing
atender' (Encolada p c) = case(atender' c) of
  Nothing -> Just VaciaC
  Just c' -> Just (Encolada p c' )

encolar' :: Deportista -> Cola -> Cola
encolar' p c = Encolada p c




-- Ejercicio 8   
-- Tipos recursivos y polimórficos. 


data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)  deriving (Show)
type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

--a 
type GuiaTelefonica = ListaAsoc String Int

-- b1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ la) = 1 + la_long la

--b2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia la2 = la2
la_concat (Nodo a b la1) la2 = Nodo a b (la_concat la1 la2)

--b3 
la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar la a b = Nodo a b la

--b4
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia= []
la_pares (Nodo a b la) = (a,b) : la_pares la

--b5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b la) a'
  | a == a' = Just b
  | otherwise = la_busca la a'

--b6
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar a' (Nodo a b la)
  | a' == a = la
  | otherwise = Nodo a b (la_borrar a' la)

-- Para borrar todas las veces que aparece 
la_borrar' :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar' _ Vacia = Vacia
la_borrar' a' (Nodo a b la)
  | a' == a = Nodo a' b la
  | otherwise = Nodo a b (la_borrar' a' la)

---------------------------------------------------
-- Ejercicio 9 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

type Prefijos = Arbol String
-- Programá las funciones: 

-- a) a_long :: Arbol a -> Int  que dado un árbol devuelve la cantidad de datos almacenados 
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

-- Comose va dividiendo en dos ramas una izq y una der, podemos hacer recursividad dos veces en cada una de estas ramas contanto
-- cuantas ramas tiene cada uno por así decirlo. 
-- Si vamos al ejemplo graficado "Can" se divide en 2 ramas "a" y "t" por lo que en el primer paso tenemos 
-- 1 + a_long(a) + a_long(t) -> Luego tenemos 1 + (1 + a_long("rio") + a_long("s")) + (1 + a_long("ar") + a_long("o"))
-- que termina --> 1 + (1+ (1+0) + (1+0)) + (1 + (1+0) + (1+0))

-- a_inc :: Num a => Arbol a -> Abol a que dado un árbol que contiene números los incrementa en uno
a_inc :: Num a => Arbol a -> Arbol a
a_inc  Hoja = Hoja
a_inc (Rama izq a der) = Rama (a_inc izq) (a+1) (a_inc der)


-- a_map :: (a->b) -> Arbol a -> Arbol b que dada una función y un árbol, devuelve el árbol con la misma estructura, 
--          que resulta de aplicar la función a cada uno de los elementos del árbol.
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map t (Rama izq a der) = Rama (a_map t izq) (t a) (a_map t der)

-- Reprogramar a_inc usando a_map 

a_inc':: Num a => Arbol a -> Arbol a
a_inc' Hoja= Hoja
a_inc' xs = a_map (+1) xs
-- <----- FIN EJERCICIO 9 ------->


--- Ejercicio 10 
--a)
data ABB a = VacioABB | RamaABB (ABB a) a (ABB a) 
  deriving Show
-- b)
insertarABB :: Ord a => a -> ABB a -> ABB a
insertarABB valor VacioABB =  RamaABB VacioABB valor VacioABB
insertarABB valor (RamaABB subI nodo subD)
  | valor < nodo = RamaABB (insertarABB valor subI) nodo subD
  | valor > nodo = RamaABB subI nodo (insertarABB valor subD)
  | otherwise = RamaABB subI nodo subD

-- *Main> ejemplo = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 VacioA)
-- *Main> insertarABB 7 ejemplo                                                                                                                       
-- RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB (RamaABB VacioABB 7 VacioABB) 8 (RamaABB VacioABB 10 VacioABB))
-- *Main> ejemplo2 = insertarABB 7 ejemplo
-- *Main> insertarABB 6 ejemplo2
-- RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB (RamaABB (RamaABB VacioABB 6 VacioABB) 7 VacioABB) 8 (RamaABB VacioABB 10 VacioABB))

--c) 
buscarEnArbol :: Eq a => a -> ABB a -> Bool
buscarEnArbol _ VacioABB = False
buscarEnArbol valor (RamaABB subI x subD) 
  | valor == x = True
  | otherwise = buscarEnArbol valor subI || buscarEnArbol valor subD

-- *Main> ejemplo = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 VacioABB))
-- *Main> buscarEnArbol 8 ejemplo                                                                                                                     
-- True
-- *Main> buscarEnArbol 7 ejemplo
-- False
-- *Main> buscarEnArbol 7 (insertarABB 7 ejemplo)
-- True

--d) 

-- Función principal para verificar si un árbol binario es un ABB válido.
verificarABB :: Ord a => ABB a -> Bool
verificarABB VacioABB = True
verificarABB (RamaABB subI valor subD) =
  verificarABB subI && verificarABB subD && esMenorQue valor subD && esMayorQue valor subI

-- Función auxiliar para verificar si un valor es menor que todos los valores en un árbol.
esMenorQue :: Ord a => a -> ABB a -> Bool
esMenorQue _ VacioABB = True
esMenorQue valor (RamaABB subI x subD)
  | valor < x = esMenorQue valor subI && esMenorQue valor subD
  | otherwise = False

-- Función auxiliar para verificar si un valor es mayor que todos los valores en un árbol.
esMayorQue :: Ord a => a -> ABB a -> Bool
esMayorQue _ VacioABB = True
esMayorQue valor (RamaABB subI x subD)
  | valor > x = esMayorQue valor subI && esMayorQue valor subD
  | otherwise = False

-- ejemplo1 = RamaABB (RamaABB VacioABB 10 VacioABB) 2 (RamaABB VacioABB 11 VacioABB)
-- *Main> verificarABB ejemplo1
-- False

-- *Main> ejemplo2 = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 7 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 Vacio)
-- *Main> verificarABB ejemplo2
-- False
-- *Main> ejemplo = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 VacioA)
-- *Main> verificarABB ejemplo
-- True