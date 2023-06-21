
-- <----- EJERCICIO 1  ------->

-- Ejercicio 1. TIPOS ENUMERADOS

-- a. Implementar el tipo carrera
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
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

-- <----- FIN EJERCICIO 1 ------->


-- <-----EJERCICIO 5 ------->

--SALTO AL PUNTO 5 - DONDE RELACIONA DE NUEVO CON LA ESCALA MUSICAL
-- Hagamos ahora las alteraciones de las notas musicales 

data Alteracion = Bemol | Sostenido | Natural
data NotaMusical = Nota NotaBasica Alteracion

-- Considerando a la nota Do el primer sonido
sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

-- b. definí la función sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota,
--      Sostenido ->   + 1 
--      Bemol     ->   - 1
--      Natural   ->   + 0

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota a Sostenido)  = (sonido a) + 1
sonidoCromatico( Nota a Bemol) = (sonido a) - 1
sonidoCromatico (Nota a Natural) = (sonido a)

instance Eq NotaMusical
    where
        nota1 == nota2 = sonidoCromatico nota1 == sonidoCromatico nota2


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

-- https://docs.google.com/presentation/d/15dhZOodeKXUirtK9Lf2Nwy1AgMdovnVdm5CenyGnFiY/edit#slide=id.g2688bde02a_0_68 teorico


-- <----- FIN EJERCICIO 5 ------->


-- <----- EJERCICIO 2 ------->

-- 2. CLASES DE TIPOS.
-- Clase Eq: tipos que proveen una noci´on de igualdad (operador ==).
-- Clase Ord: tipos que proveen una noci´on de orden (operadores <=, >=, funciones min, max y más).
-- Clase Bounded: tipos proveen una cota superior y una cota inferior para sus valores.Tienen entonces un elemento mas grande, 
-- definido como la constante maxBound, y un elemento mas chico, definido como minBound.
-- Clase Show: tipos que proveen una representaci´on en forma de texto (funci´on show).

-- Ejercicio a. 
--              Completamos la definicion del tipo NotaBasica para que podamos tener la clase Ord. Para hacerlo también necesito clase Eq
--              Do <= Re     ,     Fa 'min' Sol

-- <----- FIN EJERCICIO 2 ------->


-- <----- EJERCICIO 3 ------->

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

-- <----- FIN EJERCICIO 3 ------->


-- <----- EJERCICIO 4 ------->

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
    deriving (Eq, Show)

--b ¿Cuál es el tipo del constructor Docente? 
--  Docente :: Cargo -> Persona

--c. Programa la función cuandos_doc :: [Persona] -> Cargo -> Int que dada una lista de personas xs, y un cargo c, devuelve la cantidad de 
--  docentes incluidos en xs que poseen cargo c. 


cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc ((Docente cargo):xs) c | cargo==c = 1 + cuantos_doc xs c
                                | otherwise = cuantos_doc xs c



cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' xs c = length(filter (mismoCargo c) xs)
    where
        mismoCargo c' (Docente cargo) = cargo == c
        mismoCargo _ _= False



-- <----- FIN EJERCICIO 4 ------->

-- <----- EJERCICIO 6 ------->
-- Definir la función primerElemento que devuelve el primer elemento ed una lista no vacía, o Nothing si es vacía
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- <----- FIN EJERCICIO 6 ------->

-- <----- EJERCICIO 7 ------->
--  TIPOS RECURSIVOS. 
-- Queremos representar una cola de personas. El orden de atención respeta el orden de llegada.

data Cola = VaciaC | Encolada Persona Cola 
    deriving (Show)
-- Es recursiva porque aparece en uno de sus constructores. 
-- Programar: 
-- atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está en la cola, si está vacía, devuelve nothing.
atender:: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada a c) = Just c

-- encolar :: Persona -> Cola -> Cola , que agrega a una persona en la última posición. 
encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada s c) = Encolada s (encolar p c)
-- en consola: 
-- encolar (Estudiante Computacion 1) ( Encolada Decane (Encolada (Docente Titular) (Encolada (Docente Adjunto) VaciaC)))
--Encolada Decane (Encolada (Docente Titular) (Encolada (Docente Adjunto) (Encolada (Estudiante Computacion 1) VaciaC)))

-- busca :: Cola -> Cargo -> Maybe Persona, que devuelve el primer docente dentro de la cola que tiene un cargo que se corresponde con el segundo parámetro.
--                                          Sino encuentra que devuelva nothing
busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing
busca (Encolada persona resto) cargo
    | esDocente persona && getCargo persona == Just cargo = Just persona -- En la igualdad agrego "Just Cargo" porque getCargo :: Persona -> Maybe Cargo, entonces ahora el tipo cambio a Just Cargo y no solamente Cargo.
    | otherwise = busca resto cargo
    where 
        esDocente :: Persona -> Bool
        esDocente (Docente _) = True
        esDocente _ = False
        
        getCargo :: Persona -> Maybe Cargo
        getCargo (Docente c) = Just c
        getCargo _ = Nothing

-- ejercicio teorico 
-- En el contexto del ejercicio y la definición de Cola, podemos decir que Cola se asemeja a la estructura de datos conocida como "lista enlazada". Una lista enlazada es una colección de elementos donde cada elemento contiene una referencia al siguiente elemento de la lista. De manera similar, la definición de Cola utiliza una estructura recursiva donde cada elemento (Encolada) contiene una referencia a la cola restante.

-- En este sentido, Cola se asemeja a la lista enlazada en términos de su estructura recursiva y la forma en que se puede agregar y eliminar elementos. Sin embargo, hay diferencias importantes, como el acceso eficiente al primer elemento y la capacidad de agregar elementos al final de la cola.

-- En resumen, podemos decir que Cola se parece a la lista enlazada en términos de su estructura recursiva y su funcionalidad de agregar y eliminar elementos, aunque con características específicas de una cola, como el acceso eficiente al primer elemento.
-- <----- FIN EJERCICIO 7 ------->

-- <----- EJERCICIO 8 ------->
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

type Diccionario = ListaAsoc String String
type Padron  = ListaAsoc Int String
-- a) ¿Como harías para type Guia Teléfonica?.
-- Para hacerlo debería tener un nombre y un número de teléfono, por lo que diría que un string que represente el nombre del titular de la linea,
-- y como segundo parámetro un entero que representa el número telefónico
type GuiaTelefonica = ListaAsoc String Int
--b) PROGRAMAR LAS SIGUIENTES FUNCIONES: 
-- la_long :: ListaAsoc a b  -> Int que devuelve la cantidad de datos en una lista
la_long :: ListaAsoc a b  -> Int
la_long Vacia = 0
la_long (Nodo a b ls) = 1 + la_long ls

-- la_concat:: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b que devuelve la concatenación de dos listas. 
la_concat:: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia xs = xs
la_concat (Nodo a b ls) xs = Nodo a b (la_concat ls xs)  

-- la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no está en la lista.
--                                                                  o actualiza la info si ya existe. 
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia clave dato = Nodo clave dato Vacia
la_agregar (Nodo a b xs)  clave dato
    | a == clave = Nodo a dato xs
    | otherwise = Nodo a b (la_agregar xs clave dato)

-- la_pares :: ListaAsoc a b -> [ (a,b) ] que transforma una lista de asociacion en lista de pares clave-dato
la_pares :: ListaAsoc a b -> [ (a,b) ]
la_pares Vacia = []
la_pares (Nodo a b xs) = (a,b) : la_pares xs 

-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b  que dada una lista
-- y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
-- Nothing.

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b xs ) clave 
    | clave == a = Just b
    | otherwise =  la_busca xs clave

-- la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada una clave a elimina la entrada en la lista.
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar clave (Nodo a b xs)
    | clave == a = xs
    | otherwise = Nodo a b (la_borrar clave xs)

-- <----- FIN EJERCICIO 8 ------->

    -- <----- EJERCICIO 9 ------->

-- Un tipo util para representar situaciones es el árbol. 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

type Prefijos = Arbol String
-- Programá las funciones: 

-- a) a_long :: Arbol a -> Int  que dado un árbol devuelve la cantidad de datos almacenados 
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

-- <----- FIN EJERCICIO 9 ------->
