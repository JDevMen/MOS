*************************************************************************
***      Lab2-Ejercicio4                                              ***
***     Luis Miguel Gomez Londoño   201729597                         ***
***     Julian David Mendoza Ruiz   201730830                         ***  
*************************************************************************
$Set n 6

Scalar a;

a= 15;

Sets
    i pueblos /p1*p%n%/
alias(j,i);

Table t(i,j) tiempos
         p1      p2      p3      p4      p5      p6
p1       0       10      20      30      30      20
p2       10      0       25      35      20      10
p3       20      25      0       15      30      20
p4       30      35      15      0       15      25
p5       30      20      30      15      0       14
p6       20      10      20      25      14      0;

Parameter ad(i,j) adyacencia entre dos pueblos;

loop((i,j),
    if(t(i,j) <=15,
    ad(i,j) = 1
    else
    ad(i,j) = 0
        );
    );

Binary Variable x(i)  poner una estación en el pueblo i;

Variable z              Funcion objetivo;

Equations
funcObjetivo        Funcion objetivo

adyacencia(i)       restricción de elegir solo aquellos costos que sean adyacentes

;

funcObjetivo        ..  z   =e= sum((i),x(i));

adyacencia(i)       ..  sum((j),x(j)*ad(i,j)) =g= 1;

Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;


Display z.l;
Display x.l;

Display i;
Display j;
Display t;
Display ad;

