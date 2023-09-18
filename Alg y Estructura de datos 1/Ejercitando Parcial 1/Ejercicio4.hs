separar :: [a] -> (a->Bool) -> ([a],[a])
separar [] _ = ([],[])
separar xs t = (listaCumple xs t, listaNoCumple xs t)

listaCumple:: [a] ->(a->Bool) -> [a]
listaCumple [] t = []
listaCumple (x:xs) t
    | t x = x: listaCumple xs t
    | otherwise = listaCumple xs t

listaNoCumple :: [a] -> (a->Bool)-> [a]
listaNoCumple [] t = []
listaNoCumple (x:xs) t
    | t x = listaNoCumple xs t
    | otherwise = x: listaNoCumple xs t
