*************************************************************************
***      Lab2-Ejercicio1                                              ***
***     Luis Miguel Gomez Londoño   201729597                         ***
***     Julian David Mendoza Ruiz   201730830                         ***  
*************************************************************************
$Set m 3
$Set n 2
$Set pn 2
Sets
    o origen  /o1*o%m%/
    d destino /d1*d%n%/
    
*tipos de procesos, p1 kernel y p2 usuario
    p procesos /p1*p%pn%/
    ;


Table c(o,d) costos
         d1       d2
o1       300      500
o2       200      300
o3       600      300;

Table po(p,o) procesos de origen
         o1      o2      o3
p1       60      80      50
p2       80      50      50;

Table pd (p,d) procesos de destino
         d1      d2
p1       100     90
p2       60      120;

Variables
x(o,d,p)
z;

Equations

funcObjetivo            Funcion objetivo
resFilas(o,p)           Cantidad de procesos ofertados por o
ResColumnas(d,p)        Cantidad de procesos recibidos por d
CantidadPos(o,d,p)      La cantidad de procesos x(o.d.p) siempre debe ser positiva
;

funcObjetivo            ..  z   =e= sum((o,d,p),c(o,d)*x(o,d,p));
resFilas(o,p)           ..  sum((d),x(o,d,p)) =l= po(p,o);
resColumnas(d,p)        ..  sum((o),x(o,d,p)) =e= pd(p,d);
CantidadPos(o,d,p)      ..  x(o,d,p) =g= 0;

Model model1 /all/;

option mip = CPLEX
Solve model1 using mip miniming z;


   
Display o;
Display d;
Display c;
$Ontext 
Display p;
Display po;
Display pd;
$Offtext
Display x.l;
Display z.l;
