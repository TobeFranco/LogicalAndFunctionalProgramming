/*Ejercicio 1: Brujas*/
witch(X):-burns(X),female(X).
burns(X) :- wooden(X).
wooden(X) :- floats(X).
floats(X) :- sameweight(duck, X).

female(girl).
sameweight(duck,girl).

/*  Ejercicio 2: Cancion Estupida */
cancionestupida(0):-nl,write('Gomo ya no gueda shev vezza, -hic- be boy a doddmig...').
cancionestupida(N):-N>1,nl,write(' botellas de cerveza en el suelo'),nl,
                    write(N),write(' botellas de cerveza'),nl,
                    write('La gojo y be la bhebo'),nl,
                    A is N-1, cancionestupida(A).

/*  Diagnostico  de enfermedades */ 
enfermo_de(manuel, gripe).
tiene_sintoma(alicia, cansancio).
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
elimina(vitaminas, cansancio).
elimina(aspirinas, fiebre).
elimina(jarabe, tos).
recetar_a(X,Y):-enfermo_de(Y,A),alivia(X,A).
alivia(X,Y):-elimina(X,A),sintoma_de(A,Y).

enfermo_de(X,Y):-tiene_sintoma(X,Z),sintoma_de(Z,Y).

/*  Planificador de gastos  */
transporte(roma,20000).
transporte(londres,25000).
transporte(tunez,15000).

alojamiento(hotel,roma,25000). 
alojamiento(hotel,londres,15000). 
alojamiento(hotel,tunez,10000). 
alojamiento(hostal,roma,15000). 
alojamiento(hostal,londres,10000). 
alojamiento(hostal,tunez,8000). 
alojamiento(camping,roma,10000). 
alojamiento(camping,londres,5000). 
alojamiento(camping,tunez,5000). 

viaje(W,X,Y,Z):-transporte(W,A),alojamiento(Y,W,C),B is C*X,Z is A+B.

/*  Arbol genealogico  */
padre(enrique7,enrique8).
padre(enrique7,arturo).
padre(enrique7,margarita).
padre(enrique8,catalina).
padre(enrique8,ana).
padre(enrique8,juana).

madre(catalina,maria).
madre(ana,isabel).
madre(juana,eduardo).

progenitor(X,Y):-padre(X,Y);madre(X,Y).

hombre(enrique7).
hombre(enrique8).
hombre(arturo).
hombre(eduardo).

mujer(margarita).
mujer(catalina).
mujer(maria).
mujer(ana).
mujer(isabel).
mujer(juana).

hermano(X,Y):-hombre(X),
            progenitor(A,X),progenitor(B,Y),
            A=B.

hermana(X,Y):-mujer(X),
            progenitor(A,X),progenitor(B,Y),
            A=B.

abuelo(X,Y):-hombre(X),progenitor(A,Y),progenitor(X,A).
abuela(X,Y):-mujer(X),progenitor(A,Y),progenitor(X,A).