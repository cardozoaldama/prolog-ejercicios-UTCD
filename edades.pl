/* 

Belén es una niña de cinco años que está aprendiendo los números y después de escuchar a su primo llamar anciana a su hermana quiere saber a qué edad una persona es bebé, niño, adolecente, adulto, y anciano. Su madre le explicó que una persona es:
    Bebé desde que nace hasta que tiene dos años inclusive.
    Baby (0 - 2)
    Niño desde los tres hasta los nueve años inclusive.
    Child (3 - 9)
    Adolecente desde los diez hasta los veinte años inclusive.
    Teenager (10 - 20)
    Adulto desde los veintiuno hasta los sesenta y nueve inclusive.
    Adult (21 - 69)
    Anciano desde los setenta años en adelante.
    Old Adult (70 - 70+)
En base a esto la mamá le pide que le responda en qué categoría se encuentra cada uno de sus familiares teniendo en cuenta el siguiente árbol.
    Pilar: 87 años.
    Tomás: 95 años.
    Óscar: 57 años.
    Marcelo: 61 años.
    Amalia: 58 años.
    Ana: 37 años.
    Andrea: 44 años.
    Martín: 37 años.
    Esteban: 17 años.
    Sara: 22 años.
    Belén: 5 años.

*/

progenitor(pilar, amalia).
progenitor(pilar, ana).
progenitor(pilar, oscar).
progenitor(tomas, oscar).
progenitor(tomas, ana).
progenitor(tomas, amalia).
progenitor(amalia, martin).
progenitor(amalia, esteban).
progenitor(marcelo, martin).
progenitor(marcelo, esteban).
progenitor(oscar, sara).
progenitor(oscar, belen).
progenitor(andrea, sara).
progenitor(andrea, belen).

edad(pilar, 87).
edad(tomas, 95).
edad(oscar, 57).
edad(marcelo, 61).
edad(amalia, 58).
edad(ana, 37).
edad(andrea, 44).
edad(martin, 37).
edad(esteban, 17).
edad(sara, 22).
edad(belen, 5).

/*Belén es bebé. Belén es niña. Esteban es adolecente. Tomás tiene 95 años.Cuántos años tiene Pilar. Quiénes tienen 5 años.*/

bebe(X) :- edad(X, Y), Y =< 2.
nino(X) :- edad(X, N), N >= 3, N =< 9.
adolecente(X) :- edad(X, A), A >= 10, A =< 20.
adulto(X) :- edad(X, D), D >= 21, D =< 69.
anciano(X) :- edad(X, I), I >= 70.

persona_mayor(X, Y) :- edad(X, A), edad(Y, B), A > B.
persona_menor(X, Y) :- edad(X, A), edad(Y, B), A < B.
persona_misma_edad(X, Y) :- edad(X, A), edad(Y, B), A = B.

/******************************************/

/*
Definir parentesco existente en la Familia de Belén, según el árbol genealógico se debe cargar como hecho las relaciones de Padre y de esposo, luego crear las reglas para hermano, hijo, tío, sobrino, primo, abuelo, nieto, y cuñado.
*/

/*Ejecutar los siguientes objetivos:*/
/*
    ¿Quiénes son hermanos de Amalia?
    ¿Quiénes son hermanos de Sara?
    ¿Quién es el padre de Esteban?
    ¿Quién es el padre de Andrea?
    ¿Quiénes son hijos de Marcelo?
    ¿Quién es el padre de Tomas?
    ¿Amalia es la tía de Belén?
    ¿De quién es tío Oscar?
    ¿Oscar es cuñado de Amalia?
    ¿Andrea es cuñado de Amalia?
    Listar primos
    Ana es abuela de Esteban
*/

% Definición de hechos

% Hombres
hombre(tomas).
hombre(marcelo).
hombre(oscar).
hombre(martin).
hombre(esteban).

% Mujeres
mujer(pilar).
mujer(amalia).
mujer(ana).
mujer(sara).
mujer(belen).

% Tomas y Pilar como padres
padre_de(tomas, amalia).
padre_de(tomas, ana).
padre_de(tomas, oscar).
madre_de(pilar, amalia).
madre_de(pilar, ana).
madre_de(pilar, oscar).

% Parejas
pareja_de(tomas, pilar).
pareja_de(amalia, marcelo).
pareja_de(oscar, andrea).

% Definición de padres
padres_de(marcelo, esteban).
padres_de(marcelo, martin).
padres_de(oscar, sara).
padres_de(oscar, belen).

% Definición de madres
madres_de(amalia, esteban).
madres_de(amalia, martin).
madres_de(andrea, sara).
madres_de(andrea, belen).

% Definición de hermanos
hermano_de(amalia, ana).
hermano_de(amalia, oscar).
hermano_de(oscar, amalia).
hermano_de(oscar, ana).
hermano_de(ana, amalia).
hermano_de(ana, oscar).

% DECLARACIÓN DE REGLAS

% Hermano: Dos personas son hermanas si tienen los mismos padres.
hermano_de(X,Y) :- padres_de(Z,X), padres_de(Z,Y), X \== Y.
hermano_de(X,Y) :- madres_de(Z,X), madres_de(Z,Y), X \== Y.

% Hijo: Una persona es hijo de otra si esa persona es el hijo varón o la hija mujer de esa otra persona.
hijo_de(X,Y) :- padres_de(Y,X) ; madres_de(Y,X).
hijo_de(X,Y) :- padre_de(Y,X) ; madre_de(Y, X).

% Tío: Una persona es tío de otra si esa persona es el hermano de uno de los padres de la otra.
tio_de(X,Y) :- hermano_de(X,Z), padres_de(Z,Y).
tio_de(X,Y) :- hermano_de(X,Z), madres_de(Z,Y).

% Sobrino: Una persona es sobrino de otra si esa persona es hijo de un hermano o hermana de esa otra persona.
sobrino_de(X, Y) :- tio_de(Y, X).
/* sobrino_de(X,Y) :- hijo_de(X,Z), hermano_de(Z,Y).
sobrino_de(X,Y) :- hijo_de(X,Z), hermano_de(Z,Y).*/

% Primo: Una persona es primo de otra si esa persona es hijo de un tío o tía de la otra.
primo_de(X,_Y) :- hijo_de(X,L), hijo_de(X,N), hermano_de(L, N), L \== N.

% Abuelo: Una persona es abuelo de otra si esa persona es el padre o madre de uno de los padres de la otra.
abuelo_de(X,Y) :- padres_de(X,Z), padres_de(Z,Y).
abuelo_de(X,Y) :- padres_de(X,Z), madres_de(Z,Y).
abuelo_de(X,Y) :- madres_de(X,Z), padres_de(Z,Y).
abuelo_de(X,Y) :- madres_de(X,Z), madres_de(Z,Y).

% Nieto: Una persona es nieto de otra si esa persona es hijo de uno de los hijos de esa otra persona.
nieto_de(X,Y) :- hijo_de(Z,Y), hijo_de(X,Z).
nieto_de(X,Y) :- hijo_de(Z,Y), hijo_de(X,Z).

% Cuñado: Una persona es cuñado de otra si esa persona está casada con el hermano o hermana de la otra.
cunado_de(X,Y) :- pareja_de(X,Z), hermano_de(Z,Y), hombre(X).
cunado_de(X,Y) :- pareja_de(X,Z), hermano_de(Z,Y), hombre(X).
cunado_de(X,Y) :- pareja_de(Z,X), hermano_de(Z,Y), hombre(X).
cunado_de(X,Y) :- pareja_de(Z,X), hermano_de(Z,Y), hombre(X).