/*% all clauses for matrimonio/1*/
matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).
matrimonio(X, Y) :- matrimonio(Y, X).
hijo(antonio, juan).
hijo(antonio, rodrigo).
hijo(antonio, marta).
hijo(ana, juan).
hijo(ana, rodrigo).
hijo(ana, marta).
hijo(luis, carmen).
hijo(isabel, carmen).
hijo(juan, ricardo).
hijo(carmen, ricardo).
hijo(rodrigo, alicia).
hijo(isabel, alicia).