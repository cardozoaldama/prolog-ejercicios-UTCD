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

bebe(X) :- edad(X, Y), Y =< 2.
nino(X) :- edad(X, N), N >= 3, N =< 9.
adolecente(X) :- edad(X, A), A >= 10, A =< 20.
adulto(X) :- edad(X, D), D >= 21, D =< 69.
anciano(X) :- edad(X, I), I >= 70.

persona_mayor(X, Y) :- edad(X, A), edad(Y, B), A > B.
persona_menor(X, Y) :- edad(X, A), edad(Y, B), A < B.
persona_misma_edad(X, Y) :- edad(X, A), edad(Y, B), A = B.


/*Definir parentesco existente en la Familia de Belén, según el árbol genealógico se debe cargar como hecho las relaciones de Padre y de esposo, luego crear las reglas para hermano, hijo tío, sobrino, primo, abuelo, nieto, y cuñado.*/
/*Ejecutar los siguientes objetivos:*/
/*
    ¿Quiénes son hermanos de Amalia?
    ¿Quénes son hermanos de Sara?
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

/*Belén es bebé. Belén es niña. Esteban es adolecente. Tomás tiene 95 años.Cuántos años tiene Pilar. Quiénes tienen 5 años.*/

/*
Definir parentesco existente en la Familia de Belén, según el árbol genealógico se debe cargar como hecho las relaciones de Padre y de esposo, luego crear las reglas para hermano, hijo tío, sobrino, primo, abuelo, nieto, y cuñado.
*/

% Definición de hechos
padre_de(tomas, amalia).
padre_de(tomas, ana).
padre_de(tomas, oscar).
madre_de(pilar, amalia).
madre_de(pilar, ana).
madre_de(pilar, oscar).

pareja_de(tomas, pilar).
pareja_de(amalia, marcelo).
pareja_de(oscar, andrea).

% Padres e hijos directos.

padres_de(pilar, amalia).
padres_de(pilar, ana).
padres_de(pilar, oscar).
padres_de(tomas, amalia).
padres_de(tomas, ana).
padres_de(tomas, oscar).
padres_de(amalia, martin).
padres_de(amalia, esteban).
padres_de(oscar, sara).
padres_de(oscar, belen).

hijo_de(X,Y) :- padres_de(Y,X).
hermano_de(X,Y) :- padres_de(Z,X), padres_de(Z,Y), X\==Y.
tio_de(X,Y) :- hermano_de(X,Z), padres_de(Z,Y).
sobrino_de(X,Y) :- tio_de(Y,X).
primo_de(X,Y) :- padres_de(Z,X), padres_de(W,Y), hermano_de(Z,W).
abuelo_de(X,Y) :- padres_de(X,Z), padres_de(Z,Y).
nieto_de(X,Y) :- abuelo_de(Y,X).
cunado_de(X,Y) :- (padres_de(Z,Y), hermano_de(X,Z)) ; (padres_de(Z,X), hermano_de(Y,Z)).