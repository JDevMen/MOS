*************************************************************************
***    Minima cantidad de losas para conocer el material de cadad tubo***
***                                                                   ***
***      Autor: Julian David Mendoza, Luis Miguel Gomez               ***
*************************************************************************
$ontext
Suponga que conoce el mapa de la tubería de una sección de su casa, y
desea levantar la mínima cantidad de losas para conocer el tipo de
material del cual está hecho cada tubo.

Diseñe un modelo matemático GENÉRICO que permita que usted levante la
mínima cantidad de losas para conocer el material de cada tubo.

$offtext

Sets
   i losas / l1*l20 /
alias(i, j);

Variables
   p(i)     Indicamos si se levanta dicha losa o no.
   z        Objective function
;

Binary Variable p;

Equations
objectiveFunction       objectiveFunction
tubo1                   Minimo una loza para el tubo 1.
tubo2                   Minimo una loza para el tubo 2.
tubo3                   Minimo una loza para el tubo 3.
tubo4                   Minimo una loza para el tubo 4.
tubo5                   Minimo una loza para el tubo 5.
tubo6                   Minimo una loza para el tubo 6.
tubo7                   Minimo una loza para el tubo 7.
;

objectiveFunction       ..      z =e= sum((i), p(i));
tubo1                   ..      p("l1") + p("l5") =g= 1;
tubo2                   ..      p("l2") + p("l3") + p("l6") + p("l7") =g= 1;
tubo3                   ..      p("l5")+ p("l9") =g=1;
tubo4                   ..      p("l8")+ p("l12")+ p("l16")+ p("l20")+ p("l19") =g= 1;
tubo5                   ..      p("l9")+ p("l10")+ p("l13")+ p("l14") =g= 1;
tubo6                   ..      p("l10")+ p("l11")+ p("l14")+ p("l15") =g= 1;
tubo7                   ..      p("l13")+ p("l17") =g= 1;

Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;

Display p.l;
Display z.l;