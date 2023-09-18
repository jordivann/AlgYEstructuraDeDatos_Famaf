
type Titulo = String
type Artista = String
type Duracion = Int
data Genero = Rock | Blues | Pop | Jazz
    deriving Show

data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion
    deriving Show


mismo_genero :: Genero -> Genero -> Bool
mismo_genero Rock Rock = True
mismo_genero Blues Blues = True
mismo_genero Pop Pop= True
mismo_genero Jazz Jazz = True
mismo_genero _ _ = True

duracion_de :: Cancion -> Duracion
duracion_de (Publicidad d) = d
duracion_de (Tema _ _ _ d) = d

instance Eq Cancion
    where
        c1 == c2 = duracion_de c1 == duracion_de c2
instance Ord Cancion
    where
        c1 <= c2 = duracion_de c1 <= duracion_de c2




solo_genero :: [Cancion] -> Genero -> [Titulo]
solo_genero [] _ = []
solo_genero ((Tema titulo _ g _):xs) gen
    | mismo_genero g gen = titulo : solo_genero xs gen
    | otherwise = solo_genero xs gen
solo_genero(_:xs) gen = solo_genero xs gen

-- *Main> solo_genero [(Tema "a" "a" Rock 10),(Tema "b" "b" Rock 12)] Rock
-- ["a","b"]
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
    deriving (Show)

la_suma_mayores ::(Num b, Ord b) => ListaAsoc a b -> b -> b
la_suma_mayores Vacia _ = 0
la_suma_mayores (Nodo a1 b1 ls) x
    | x <= b1 = b1 + la_suma_mayores ls x
    | otherwise = la_suma_mayores ls x

-- *Main> la_suma_mayores (Nodo "a" 2 (Nodo "b" 5 (Nodo "c" 15 (Nodo "d" 7 Vacia)))) 7
-- 22
-- *Main> la_suma_mayores (Nodo "a" 2 (Nodo "b" 5 (Nodo "c" 15 (Nodo "d" 7 Vacia)))) 4
-- 27
-- *Main> la_suma_mayores (Nodo "a" 2 (Nodo "b" 5 (Nodo "c" 15 (Nodo "d" 7 Vacia)))) 1
-- 29


data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

a_listar :: Arbol a -> [a]
a_listar Hoja  = []
a_listar (Rama izq x der) = (x : a_listar izq )++ a_listar der

-- *Main> arbol = Rama (Rama Hoja 3 Hoja) 5 (Rama Hoja 8 (Rama Hoja 10 Hoja))
-- *Main> arbol2= Rama (Rama Hoja 4 (Rama Hoja 5 Hoja)) 7 (Rama (Rama Hoja 10 Hoja) 15 (Ramaa))
-- *Main> a_listar arbol2
-- [7,4,5,15,10,18]
-- *Main> a_listar arbol 
-- [5,3,8,10]