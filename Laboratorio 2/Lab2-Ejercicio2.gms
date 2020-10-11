*************************************************************************
***      Lab2-Ejercicio2                                              ***
***     Luis Miguel Gomez Londoño   201729597                         ***
***     Julian David Mendoza Ruiz   201730830                         ***  
*************************************************************************
$Set n 7

Scalar habilidad;
habilidad = 2;

Scalar titulares;
titulares = 5; 

Sets

    j jugadores /j1*j%n%/
    r rol /ataque,centro, defensa/
    h habilidad /control, disparo, rebote, defensa/
    ;
Parameters
    min(r) minimo de jugadores de cada rol
    /ataque 2,centro 1, defensa 4 /
;
    
Table p(j,r) jugadores y sus roles
         ataque       centro      defensa
j1       1            0           0
j2       0            1           0
j3       1            0           1
j4       0            1           1
j5       1            0           1
j6       0            1           1
j7       1            0           1;

Table c (j,h) Capacidades de cada jugador
         control disparo rebote  defensa
j1       3       3       1       3
j2       2       1       3       2
j3       2       3       2       2
j4       1       3       3       1
j5       3       3       3       3
j6       3       1       2       3
j7       3       2       2       1
;

Binary Variable x(j)   elegir o no a un jugador;
variable z               funcion objetivo;


Equations

funcObjetivo    funcion objetivo
resTitulares    Restricción de cuantos jugadores titulares deben haber
resDefensa      Restricción de cuantos jugadores defensivos deben haber
resCentro       Restricción de cuantos jugadores de centro deben haber
resAtaque       Restricción de cuantos jugadores de ataque deben haber
resPromedio(h)  Restricción del promedio que deben haber por cada habilidad
resTitular      Restricción de ciertos jugadores deben ser titulares
;

funcObjetivo    ..  z   =e= sum((j),c(j,"defensa")*x(j));
resTitulares    ..  sum((j),x(j)) =e= titulares;
resDefensa      ..  sum((j),p(j,"defensa")*x(j)) =g= min("defensa");
resCentro       ..  sum((j),p(j,"centro")*x(j)) =g= min("centro");
resAtaque       ..  sum((j),p(j,"ataque")*x(j)) =g= min("ataque");
resPromedio(h)  ..  (sum((j),c(j,h)*x(j)))/titulares =g= habilidad;
resTitular      ..  x('j2')+x('j3') =e= 1;


Model model1 /all/;

option mip=CPLEX;
Solve model1 using mip maximizing z;

Display x.l;
Display z.l;
Display resDefensa.l;
Display resCentro.l;
Display resAtaque.l;
Display resPromedio.l;



