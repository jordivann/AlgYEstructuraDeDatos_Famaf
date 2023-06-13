{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# LANGUAGE InstanceSigs #-}
import Data.Ord (Ord)
import Data.Char (GeneralCategory(DecimalNumber))
import GHC.Natural (Natural)
import Prelude hiding (Bool)
import System.Win32 (COORD(y), lANGIDFROMLCID)
import Data.Sequence (adjust')
-- Polimorfismo ad hoc 
 
data Bool = True | False 

data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Eq, Show)

tareaDiaria :: Dia -> String
tareaDiaria Viernes = "Trabajar poco"
tareaDiaria Sabado = "Joda"
tareaDiaria Domingo = "Descanso"
tareaDiaria _ = "Trabajar"


--LABORATORIO 2
--EJERCICIOS
--1. Tipos enumerados
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematicas"
titulo Fisica = "Licenciatura en Física"
titulo Computacion = "Licenciatura en ciencias de la computacion"
titulo Astronomia = "Licenciatura en Astronomía"

--data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si 
  

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
data NotaBasica' = Do' | Re' | Mi' | Fa' | Sol' | La' | Si'
  deriving (Show, Eq, Bounded, Ord)

  
cifradoAmericano' :: NotaBasica' -> Char
cifradoAmericano' Do' = 'C'
cifradoAmericano' Re' = 'D'
cifradoAmericano' Mi' = 'E'
cifradoAmericano' Fa' = 'F'
cifradoAmericano' Sol' = 'G'
cifradoAmericano' La' = 'A'
cifradoAmericano' Si' = 'B'

--3 Polimorfismo ad hoc 
-- Recordandon la funcion sumatoria: Modificandola: 
sumatoria :: Num a => [a] -> a
sumatoria [] = 0 
sumatoria (x:xs) = x + sumatoria xs 

-- minBound es el absorbente, maxBound es el neutro
minimoElemento ::  (Bounded a, Ord a)=>[a] -> a
minimoElemento [] = maxBound
minimoElemento [t] = t
minimoElemento (x:xs) = x `min` minimoElemento xs
-- minimoElemento[2,3,54,65,1]::Int
-- minimoElemento[Fa', La', Sol', Re']::NotaBasica'


-- Sinónimos de tipos; constructores con parámetros
type Ingreso = Int
-- tipos enumerados: 
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar     deriving (Show, Eq)
data Area = Administrativa | Ensenanza | Economica | Postgrado     deriving (Show, Eq)
-- Persona es un tipo algebraico 
data Persona = Decane          -- Constructor sin argumento
            | Docente Cargo
            | NoDocente Area       --constructor con un argumento 
            | Estudiante Carrera Ingreso -- constructor con dos argumentos
    deriving (Eq)

-- :type Docente     Docente :: Cargo -> Persona

cuantos_doc :: [Persona]-> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc ((Docente c):ls) cm     | c == cm  = 1 + cuantos_doc ls cm 
                                    | otherwise = cuantos_doc ls cm
cuantos_doc _ _ = 0

--En Terminal:  cuantos_doc [Docente Titular, Docente Asociado, Docente Adjunto, Docente Adjunto] Adjunto

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
  deriving (Show)

data Alteracion = Bemol | Sostenido | Natural
data NotaMusical = Nota NotaBasica Alteracion 

-- Esta notacion es confusa, Nota es una funcion con dos argumentos.

sonido :: NotaBasica -> Int
sonido Do = 1 
sonido Re = 3 
sonido Mi = 5 
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb Bemol) = sonido(nb) - 1
sonidoCromatico (Nota nb Natural) = sonido(nb) 
sonidoCromatico (Nota nb Sostenido) = sonido(nb) + 1

instance (Eq NotaMusical) where
    nm1 == nm2 = sonidoCromatico nm1 == sonidoCromatico nm2

instance (Ord NotaMusical) where
    nm1 <= nm2 = sonidoCromatico nm1 <= sonidoCromatico nm2


dividir :: Int -> Int -> Maybe Int
dividir x 0 = Nothing
dividir x y = Just (x `div` y)

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- Tipos Recursivos.

data Cola = VaciaC | Encolada Persona Cola
--Primer elemento es el de la derecha. 
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p c) = Just c

encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada p' c) = Encolada p' (encolar p c)

busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC k = Nothing
busca (Encolada persona cola) cargo
    | persona == Docente cargo = Just (persona)
    | otherwise = busca cola cargo


-- El primer elemento es el de más a la izquierda
atender' :: Cola -> Maybe Cola
atender' VaciaC = Nothing
atender' (Encolada p c) = case(atender' c) of
  Nothing -> Just VaciaC
  Just c' -> Just (Encolada p c' )

encolar' :: Persona -> Cola -> Cola
encolar' p c = Encolada p c

-- 8 

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


data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )
type Prefijos = Arbol String
can , cana , canario , canas , cant , cantar , canto :: Prefijos
can = Rama cana "can" cant
cana = Rama canario "a" canas
canario = Rama Hoja "r i o " Hoja
canas = Rama Hoja "s" Hoja
cant = Rama cantar "t" canto
cantar = Rama Hoja "ar" Hoja
canto = Rama Hoja "o" Hoja

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama i n d) = a_hojas i + a_hojas d