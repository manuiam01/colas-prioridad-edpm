/* IMPLEMENTACIÓN DE COLAS DE PRIORIDAD USANDO MONTÍCULOS BINARIOS
El presente código es parte del informe 3 para el curso de Estructura de datos y programación metódica (2018-1)

> TENORIO QUIROZ Bruno Gustavo     20145679
> ROJAS MAYHUA   Rubí Estefanía    20161215
> SOSA PEZO      Carlos Alberto    20161310

*/


/* Crea un montículo vacío */
monticulo_vacio(monticulo(nil,0)).

/* Combina dos monticulos */
combinar(nil, H, H).
combinar(H, nil, H).
combinar(L, R, H) :-
  L = t(X,Px,SubL),
  R = t(Y,Py,SubR),
  (   Px @< Py
  ->  Q = t(X,Px,[R|SubL])
  ;   Q = t(Y,Py,[L|SubR])
  ).

/*

/* Añade un elemento al montículo */
anadir_elemento(H0, Elemento, Prioridad, H) :-
