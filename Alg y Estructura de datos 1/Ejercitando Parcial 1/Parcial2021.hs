data EmpresaTelefono = Claro | Personal | Movistar | Tuenti
    deriving (Eq, Show)

type Frase = String;

fraseEmpresa :: EmpresaTelefono -> Frase
fraseEmpresa Claro = "Claro, la red mas poderosa";
fraseEmpresa Personal= "Personal, es como vos";
fraseEmpresa Movistar = "Movistar, Compartida la vida es mas...";
fraseEmpresa Tuenti = "Tuenti es la mas economica";

-- *Main> fraseEmpresa Claro
-- "Claro, la red mas poderosa"
-- *Main> fraseEmpresa Movistar
-- "Movistar, Compartida la vida es mas..."
-- *Main> fraseEmpresa Tuenti
-- "Tuenti es la mas economica"

type NombrePersona = String;
data MisEmpresas = VaciaE | AgregaEmpresa EmpresaTelefono NombrePersona MisEmpresas


--dado un valor del tipo misempresas, una empresatelefono y un nombrepersona, devuelve true si la emprestalefono y el nombrepersona estan en misempresas.
tengoEmpresa :: MisEmpresas -> EmpresaTelefono -> NombrePersona -> Bool
tengoEmpresa VaciaE _ _ = False
tengoEmpresa (AgregaEmpresa emp per xs) empresa nombre
    | (emp == empresa) && (per==nombre) = True
    | otherwise = tengoEmpresa xs empresa nombre

-- *Main> ejemplo = AgregaEmpresa Claro "Juan" (AgregaEmpresa Personal "Pedro" (AgregaEmpresa Claro "Jordi" VaciaE)) 
-- *Main> tengoEmpresa ejemplo Claro "Jordi"
-- True

type NroTel = Int

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
    deriving Show

agregarLA :: ListaAsoc EmpresaTelefono NroTel -> EmpresaTelefono -> NroTel -> ListaAsoc EmpresaTelefono NroTel
agregarLA lista empresa nro = Nodo empresa nro lista

-- *Main> listaVacia=Vacia
-- *Main> listaConClaro = agregarLA listaVacia Claro 123
-- *Main> listaConClaroYMovistar = agregarLA listaConClaro Movistar 321 
-- *Main> listaConClaroYMovistar
-- Nodo Movistar 321 (Nodo Claro 123 Vacia)

-- *Main> lista = (Nodo Claro 232 (Nodo Personal 234 (Nodo Tuenti 452  Vacia)))
-- *Main> agregarLA lista Movistar 212 
-- Nodo Movistar 212 (Nodo Claro 232 (Nodo Personal 234 (Nodo Tuenti 452 Vacia)))

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

aBusca :: Eq a => Arbol a -> a -> Bool
aBusca Hoja _ = False
aBusca (Rama arbolIzq x arbolDer) y
    | x == y = True
    | otherwise = aBusca arbolIzq y || aBusca arbolDer y

-- *Main> arbol = Rama (Rama Hoja 3 Hoja) 5 (Rama Hoja 8 (Rama Hoja 10 Hoja))
-- *Main> aBusca arbol 8
-- True
-- *Main> aBusca arbol 6
-- False
-- *Main> aBusca arbol 10
-- True
-- *Main> aBusca arbol 3 
-- True
-- *Main> aBusca arbol 2
-- False