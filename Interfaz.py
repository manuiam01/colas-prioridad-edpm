from pyswip import Prolog
#def main():
prolog =Prolog()
prolog.consult("p_queue.pl")
#Prolog.assertz("monticulo_vacio(H), anadir_elemento(H,1,'Mario',L)")
for i in prolog.query("monticulo_vacio(H), anadir_elemento(H,1,'Mario',L), anadir_elemento(L,3,'Marioddd',R), obtener_primero(R,_,X,Q)"):
    print(i["X"], "es el mejor.", " El monticulo queda como ", i["Q"])
