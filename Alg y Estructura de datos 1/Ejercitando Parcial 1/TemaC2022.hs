data Numeracion = Cero | Uno | Dos | Tres | Cuatro
    deriving Show

misma_numeracion :: Numeracion -> Numeracion -> Bool
misma_numeracion Cero Cero = True
misma_numeracion Uno Uno = True
misma_numeracion Dos Dos = True
misma_numeracion Tres Tres = True
misma_numeracion Cuatro Cuatro = True
misma_numeracion _ _ = False

data Domino  = Ficha Numeracion Numeracion

encajar :: Domino -> Domino -> Maybe Numeracion
encajar (Ficha a1 b1) (Ficha a2 b2) 
    | misma_numeracion b1 a2 = Just b2
    | otherwise = Nothing

-- *Main> encajar (Ficha Cero Tres) (Ficha Tres Uno)
-- Just Uno
-- *Main> encajar (Ficha Uno Cero) (Ficha Dos Tres)    
-- Nothing

compatibles :: [Domino] -> Numeracion -> [Numeracion]
compatibles [] _ = []
compatibles ((Ficha a b):xs) x
    | misma_numeracion a x = b: compatibles xs x
    | otherwise = compatibles xs x

-- *Main> compatibles [ Ficha Cero Uno, Ficha Tres Dos, Ficha Cero Cuatro] Cero
-- [Uno,Cuatro]

type Evento = String
data Categoria = Cumple | Reunion | Otro
data Calendario = Agendar Evento Categoria Calendario | SinEventos

listar_reuniones :: Calendario -> [Evento]
listar_reuniones SinEventos = []
listar_reuniones (Agendar e c ca) 
    | esReunion c = e: listar_reuniones ca
    | otherwise = listar_reuniones ca

esReunion :: Categoria -> Bool 
esReunion Reunion = True
esReunion _ = False

-- *Main> lista = Agendar "a" Cumple (Agendar "b" Reunion(Agendar "c" Reunion (Agendar "d" Otro SinEventos)))
-- *Main> listar_reuniones lista
-- ["b","c"]


data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

a_min :: (Ord a) => Arbol a -> a
a_min (Rama Hoja x Hoja) = x  -- Caso base: Cuando es una hoja, el mínimo es el valor de la hoja.
a_min (Rama izq x Hoja) = min x (a_min izq)  -- Buscar en el subárbol izquierdo.
a_min (Rama Hoja x der) = min x (a_min der)  -- Buscar en el subárbol derecho.
a_min (Rama izq x der) = minimum [x, a_min izq, a_min der]  -- Comparar con ambos subárboles.

