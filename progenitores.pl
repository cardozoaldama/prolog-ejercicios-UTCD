es_progenitor(pilar, belen).
es_progenitor(tomas, belen).
es_progenitor(tomas, lucia).
es_progenitor(belen, ana).
es_progenitor(belen, pedro).
es_progenitor(belen, pablo).
es_progenitor(belen, mario).
es_progenitor(belen, marcos).
es_progenitor(pedro, jose).
es_progenitor(pedro, maria).

% Rules

madre(X, Y):- mujer(X), es_progenitor(X, Y).

mujer(belen).
mujer(ana).
mujer(lucia).
mujer(maria).
mujer(pilar).
hombre(tomas).
hombre(pedro).
hombre(pablo).
hombre(mario).
hombre(marcos).
hombre(jose).

% Rules

es_antepasado(X, Y) :- es_progenitor(X, Y).
es_antepasado(X, Y) :- es_progenitor(X, Z), es_antepasado(Z, Y).

/*Pepe es grande, la cabeza de Juan es grande, si X es mayor que Y, entonces X es grande, además: La cabeza de X es mayor que la de Y si X es el progenitor de Y.*/
grande(pepe).
grande(cabeza(juan)).

% Rules

grande(X) :- mayor(X, _Y).

mayor(cabeza(X), cabeza(Y)) :- es_progenitor(X, Y).

