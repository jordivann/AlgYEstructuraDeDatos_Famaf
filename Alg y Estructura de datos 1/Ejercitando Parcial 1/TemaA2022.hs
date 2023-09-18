data Palo = Treboles | Corazones | Picas | Diamantes
    deriving (Eq, Show)

mismo_palo :: Palo -> Palo -> Bool
mismo_palo Treboles Treboles = True
mismo_palo Corazones Corazones = True
mismo_palo Picas Picas = True
mismo_palo Diamantes Diamantes = True
mismo_palo _ _ = False

type Numero = Int
data Naipe = Numerada Numero Palo | Rey Palo | Reina Palo | Jota Palo | As Palo
    

valor_naipe :: Naipe -> Int
valor_naipe (Numerada n p) = n
valor_naipe (Jota _ )= 11
valor_naipe (Reina _) = 12
valor_naipe (Rey _ )= 13
valor_naipe (As _ )= 14

-- *Main> valor_naipe (As Picas)
-- 14
-- *Main> valor_naipe (Jota Corazones)
-- 11
-- *Main> valor_naipe(Numerada 9 Diamantes)
-- 9
instance Eq Naipe
    where
        n1 == n2 = valor_naipe n1 == valor_naipe n2

instance Ord Naipe
    where
        n1 <= n2 = valor_naipe n1 <= valor_naipe n2

-- *Main> Numerada 9 Diamantes <= Jota Corazones
-- True

solo_numeradas :: [Naipe] -> Palo -> [Numero]
solo_numeradas [] _ = []
solo_numeradas ((Numerada x palo):xs) p
    | palo == p = x : (solo_numeradas xs p)
    | otherwise = solo_numeradas xs p
solo_numeradas (_:xs) p = solo_numeradas xs p 


-- *Main> listaNaipes = [(Numerada 7 Diamantes), (Jota Treboles),(Numerada 3 Corazones),(Numerada 7 Corazones),(Numerada 3 Diamantes) ]
-- *Main> solo_numeradas listaNaipes Corazones                                                                                 
-- [3,7] 
-- *Main> listaNaipes2  = [(Numerada 7 Diamantes), (Jota Treboles),(Numerada 3 Corazones),(Numerada 7 Corazones),(Numerada 3 Di
-- amantes) ]             
-- *Main> solo_numeradas listaNaipes2 Diamantes                                                                                
-- [7,3]


data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)  
    deriving (Show)

la_menores :: (Ord b )=> ListaAsoc a b -> b -> ListaAsoc a b
la_menores Vacia _ = Vacia
la_menores (Nodo a b ls) valor 
    | b < valor = Nodo a b (la_menores ls valor)
    | otherwise = la_menores ls valor


-- *Main> la_menores (Nodo "a" 3 (Nodo "b" 2 (Nodo "c" 5 (Nodo "d" 10 Vacia)))) 7
-- Nodo "a" 3 (Nodo "b" 2 (Nodo "c" 5 Vacia))

-- Main> asoc=  Nodo "A" 5 (Nodo "B" 10 (Nodo "C" 3 Vacia))
-- *Main> la_menores asoc 6
-- Nodo "A" 5 (Nodo "C" 3 Vacia)
-- *Main> la_menores asoc 11
-- Nodo "A" 5 (Nodo "B" 10 (Nodo "C" 3 Vacia))

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

a_esCota_sup :: (Ord a) => a -> Arbol a -> Bool 
a_esCota_sup _ Hoja = True
a_esCota_sup x (Rama izq y der) 
    | y <= x = a_esCota_sup x izq && a_esCota_sup x der
    | otherwise = False


-- *Main> arbol = Rama (Rama Hoja 3 Hoja) 5 (Rama Hoja 8 (Rama Hoja 10 Hoja))
-- *Main> a_esCota_sup 10 arbol
-- True
-- *Main> a_esCota_sup 11 arbol
-- True
-- *Main> a_esCota_sup 9 arbol 
-- False
-- *Main> a_esCota_sup 4 arbol
-- False


