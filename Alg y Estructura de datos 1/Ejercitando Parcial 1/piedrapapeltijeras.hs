data Forma = Piedra | Papel | Tijera


le_gana :: Forma -> Forma -> Bool
le_gana Piedra Tijera = True
le_gana Papel Piedra = True
le_gana Tijera Papel = True
le_gana _ _ = False 

type Nombre = String 

data Jugador = Mano Nombre Forma 

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2) 
    | le_gana f1 f2 = Just n1
    | le_gana f2 f1 = Just n2
    | otherwise = Nothing

-- *Main> ganador (Mano "Juan" Tijera) (Mano "Pedro" Piedra)
-- Just "Pedro"
-- *Main>
-- *Main> ganador (Mano "Juan" Tijera) (Mano "Pedro" Tijera)
-- Nothing