*************************************************************************
***      Lab2-Ejercicio6                                              ***
***     Luis Miguel Gomez Londoño   201729597                         ***
***     Julian David Mendoza Ruiz   201730830                         ***  
*************************************************************************
Sets
d dias de la semana /Lunes, Martes , Miercoles, Jueves, Viernes, Sabado, Domingo/
alias(c,d);

Parameter r(d) requeridos por dia /Lunes 17 , Martes  13, Miercoles  15, Jueves  19, Viernes 14, Sabado  16, Domingo  11/;

table t (c,d) días que trabaja el empleado
            Lunes   Martes  Miercoles       Jueves  Viernes Sabado  Domingo
Lunes       1       1       1               1       1       0       0
Martes      0       1       1               1       1       1       0
Miercoles   0       0       1               1       1       1       1
Jueves      1       0       0               1       1       1       1
Viernes     1       1       0               0       1       1       1
Sabado      1       1       1               0       0       1       1
Domingo     1       1       1               1       0       0       1;

Positive Variable x(c);

Variable z;

Equations
funcOBjetivo        Función objetivo

resDia(d)           Restricción de trabajadores por día
;

funcObjetivo        ..  z   =e=  sum(d,x(d));

resDia(d)           ..  sum((c),t(c,d)*x(c)) =g= r(d);

Model model1 /all/ ;

option mip=CPLEX;
Solve model1 using mip minimizing z;
Display x.l;
Display z.l; 
