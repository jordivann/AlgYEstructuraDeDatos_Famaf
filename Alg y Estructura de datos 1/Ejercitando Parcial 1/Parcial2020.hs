-- Que dado un númeroi devuelve True sie s una de las cifras de tu dni. 
estaEnDNI:: Int -> Bool
estaEnDNI 0 = True
estaEnDNI 3 = True
estaEnDNI 5 = True
estaEnDNI 6 = True
estaEnDNI 8 = True
estaEnDNI 9 = True
estaEnDNI _ = False
