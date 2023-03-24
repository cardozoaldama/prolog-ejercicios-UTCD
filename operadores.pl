/*El cuadrado*/

cuadrado(X, Resul) :- Resul is X*X.

/*El promedio*/
promedio(X, Y, Prom) :- Prom is (X + Y)/2.

% Factorial

factorial(0, 1).
factorial(Numero, Resul) :- Num is Numero - 1, factorial(Num, Resul2), Resul is Numero * Resul2.

% El máximo de dos números

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y >= X.