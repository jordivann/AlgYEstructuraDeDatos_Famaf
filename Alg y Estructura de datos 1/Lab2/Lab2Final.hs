


-- Ejercicio 1. TIPOS ENUMERADOS

-- a. Implementar el tipo carrera
data Carrera = Matematica | Fisica | Computacion | Astronomia  deriving (Show, Eq)
-- b. funcion que devuelva el titulo de la carrera
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion= "Licenciatura en ciencias de la computacion"
titulo Astronomia="Licenciatura en Astronomia"

-- c. Notacion musical. la cual consta de notas. No tenemos en cuenta los modificadores ahora. Usar pattern matching

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord, Bounded)

-- Escribir funcion usando pattern Matching para hacer el cifrado a las notas americanas. 
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- 2. CLASES DE TIPOS.
-- Clase Eq: tipos que proveen una noci´on de igualdad (operador ==).
-- Clase Ord: tipos que proveen una noci´on de orden (operadores <=, >=, funciones min, max y más).
-- Clase Bounded: tipos proveen una cota superior y una cota inferior para sus valores.Tienen entonces un elemento mas grande, 
-- definido como la constante maxBound, y un elemento mas chico, definido como minBound.
-- Clase Show: tipos que proveen una representaci´on en forma de texto (funci´on show).

-- Ejercicio a. 
--              Completamos la definicion del tipo NotaBasica para que podamos tener la clase Ord. Para hacerlo también necesito clase Eq
--              Do <= Re     ,     Fa 'min' Sol


-- 3. POLIMORFISMO AD HOC
--Cambiemos sumatoria que teníamos antes para hacerla polimorfica, es decir polimorfismo paramétrico. Como ejemplo: 

sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs 

-- a. Definir usando polimorfismo ad hoc la función minimoiElemento que calcula recursivamente cuál es el menor valor de una lsita de tipo [a]. 
--    Asergurarse que sólo esté definida para listas NO vacías. 

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

-- b. Definir la función minimoElemento' de manera tal que el caso base de la recursión sea el de la lista vacía. Para ello usar Bounded.
--    En la consola aclaarar el tipo de ej: ([1,5,10]::[int])
minimoElemento' :: (Bounded a, Ord a) => [a] -> a 
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

-- minimoElemento[2,3,54,65,1]::Int
-- Actualicemos NotaBasica para que pueda implementar Bounded y Show para que lo muestre por consola 
-- minimoElemento[Fa', La', Sol', Re']::NotaBasica'


-- 4. SINONIMO DE TIPOS; CONSTRUCTORES CON PARÁMETROS
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

--b ¿Cuál es el tipo del constructor Docente? 
--  Docente :: Cargo -> Persona

--c. Programa la función cuandos_doc :: [Persona] -> Cargo -> Int que dada una lista de personas xs, y un cargo c, devuelve la cantidad de 
--  docentes incluidos en xs que poseen cargo c. 

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc ((Docente cargo):xs) c | cargo==c = 1 + cuantos_doc xs c
                                   | otherwise = cuantos_doc xs c
cuantos_doc _ _ = 0







-- NOTAS APARTE. INSTANCE CLASS
type Punto = (Float, Float)
type Radio = Float
data Figura = 
        Circulo Punto Radio | Rectangulo Punto Punto

area :: Figura -> Float
area (Circulo p r)    = 3.1416 * r * r
area (Rectangulo p q) = base * altura
    where 
            base   = fst q - fst p
            altura = snd q - snd p

instance Eq Figura 
    where
        Circulo p r1 == Circulo q r2 = area (Circulo p r1) == area (Circulo q r2)
        Rectangulo p1 p2 == Rectangulo p3 p4 =
            area (Rectangulo p1 p2) == area (Rectangulo p3 p4)
        Circulo p r1 == Rectangulo p1 p2 =
            area (Circulo p r1) == area (Rectangulo p1 p2)
        Rectangulo p1 p2 == Circulo p r1 =
            area (Circulo p r1) == area (Rectangulo p1 p2)

