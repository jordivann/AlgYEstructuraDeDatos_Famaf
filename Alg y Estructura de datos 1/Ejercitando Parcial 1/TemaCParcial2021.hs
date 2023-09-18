data Deporte = Futbol | Basket | Tenis | Valorant | Dota2
    deriving (Eq, Show)

type MinJugadores = Int

--Que a cada depoorte le asocia la cantidad de jugadores necesarios para jguar. 
minimaCantidad :: Deporte -> MinJugadores 
minimaCantidad Futbol = 22
minimaCantidad Tenis = 2
minimaCantidad _ = 10 

-- *Main> minimaCantidad Valorant
-- 10
-- *Main> minimaCantidad Basket
-- 10
-- *Main> minimaCantidad Futbol
-- 22
-- *Main> minimaCantidad Dota2   
-- 10

type NombrePersona = String 
data PracticoDeporte = NoPractica | AgregaDeporte Deporte NombrePersona PracticoDeporte

deporte :: PracticoDeporte -> Deporte -> NombrePersona -> Bool 
deporte NoPractica _ _ = False 
deporte (AgregaDeporte d n ls) dep nombre 
    | (d==dep) && (nombre == n) = True
    | otherwise = deporte ls dep nombre

-- *Main> pd = AgregaDeporte Futbol "Juan" (AgregaDeporte Basket "Lautaro" (AgregaDeporte Valorant "Jordi" NoPractica))
-- *Main> deporte pd Futbol "Jordi"
-- False
-- *Main> deporte pd Valorant "Jordi"
-- True

type EquipoFavorito = String 

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
    deriving Show 

agregaEquipoFavorito :: ListaAsoc Deporte EquipoFavorito -> Deporte -> EquipoFavorito -> ListaAsoc Deporte EquipoFavorito 
agregaEquipoFavorito Vacia d e = Nodo d e Vacia
agregaEquipoFavorito ls dep equipofav = Nodo dep equipofav ls

-- *Main> lista = Nodo Futbol "Racing" Vacia        
-- *Main> lista2 = agregaEquipoFavorito lista Tenis "Federer"
-- *Main> agregaEquipoFavorito lista2 Valorant "Kuni"         
-- Nodo Valorant "Kuni" (Nodo Tenis "Federer" (Nodo Futbol "Racing" Vacia))

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

aCuantos :: Arbol Int -> Int -> Int
aCuantos Hoja _ = 0
aCuantos (Rama izq x der) y 
    | x < y = 1 + aCuantos izq y + aCuantos der y
    | otherwise = aCuantos izq y + aCuantos der y 

-- *Main> arbol = Rama (Rama Hoja 3 Hoja) 5 (Rama Hoja 8 (Rama Hoja 10 Hoja))
-- *Main> aCuantos arbol 6
-- 2
-- *Main> aCuantos arbol 2
-- 0
-- *Main> aCuantos arbol 9
-- 3