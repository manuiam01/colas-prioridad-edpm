/* IMPLEMENTACIÓN DE COLAS DE PRIORIDAD USANDO MONTÍCULOS BINARIOS
El presente código es parte del informe 3 para el curso de Estructura de datos y programación metódica (2018-1)

> TENORIO QUIROZ Bruno Gustavo     20145679
> ROJAS MAYHUA   Rubí Estefanía    20161215
> SOSA PEZO      Carlos Alberto    20161310
*/

/*monticulo(Arbol,Cantidad)*/
/*¿Qué es árbol?
  arbol = t(Raiz,Prioridad_raiz,SubA)
*/

/* /* Define un arbol */

/* Define un monticulo */
%monticulo(nil, 0).
%monticulo(H,Tamano) :- H = t(E, P, Sub). %¿Qué es E, P y sub? Elemento, num prioridad y el subArbol? */

/* Verifica si el monticulo es vacio */
monticulo_vacio(monticulo(nil,0)).

/* Combina dos monticulos */
combinar(nil, H, H).        %combinar(monticulo(nil,0),monticulo(H,X),monticulo(H,X)).
combinar(H, nil, H).        %combinar(monticulo(H,X),monticulo(nil,0),monticulo(H,X)).
combinar(L, R, H) :-        %combinar(monticulo(H,X),monticulo(R,Y),monticulo(H,X+Y)):-
  L = t(X,Px,SubL),
  R = t(Y,Py,SubR),
  (   Px @< Py
  ->  Q = t(X,Px,[R|SubL])
  ;   Q = t(Y,Py,[L|SubR])
  ).

/* Empareja una lista de monticulos */
emparejar([], nil).
emparejar([Q], Q) :- !.
emparejar([Q0,Q1|Qs], Q) :-
    combinar(Q0, Q1, Q2),
    emparejar(Qs, Q3),
    combinar(Q2, Q3, Q).

/* Añade un elemento al montículo */
anadir_elemento(monticulo(H0, M), Prioridad, Elemento, monticulo(H, N)) :-
  combinar(H0, t(E, P, []), H1),
  N is M+1.

/* Obtiene el elemento de mayor prioridad */
obtener_primero(monticulo(t(X,P,Sub),T), P, X, monticulo(Q,N)) :-
    emparejar(Sub,Q),
    N is T-1.

/* Convierte una lista a monticulo */
lista_a_monticulo(Xs,Q) :-
    monticulo_vacio(Vacio),
    lista_a_monticulo(Xs,Vacio,Q).

lista_a_monticulo([],Q,Q).
lista_a_monticulo([[P,X]|Xs],Q0,Q) :-
    anadir_elemento(Q0,P,X,Q1),
    lista_a_monticulo(Xs,Q1,Q).

/* Convierte un monticulo a una lista */
monticulo_a_lista(Q,L) :-
    a_lista(Q,L).
a_lista(monticulo(nil,0),[]) :- !.
a_lista(Q0,[P,X|Xs]) :-
    obtener_primero(Q0,P,X,Q),
    monticulo_a_lista(Q,Xs).

/*
