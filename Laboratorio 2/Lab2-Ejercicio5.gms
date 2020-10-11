***      Luis Miguel Gomez Londono, Julian David Mendoza Ruiz         ***
*************************************************************************

Scalar DIST distancia /0/;

Sets
    i nodos / n1*n7 /
alias(j,i);

Parameter x(i) coord x
    /n1 20, n2 22, n3 9, n4 3, n5 21, n6 29, n7 14/

Parameter y(i) coord y
    /n1 6, n2 1, n3 2, n4 25, n5 10, n6 2, n7 12/

Parameter  c(i,j) costos

loop((i,j),

    DIST = sqrt(power(x(i)-x(j),2) + power(y(i)-y(j),2))
    if( DIST <= 20 and DIST > 0, c(i,j) = DIST
    else
    c(i,j) = 99999);
);

Variables
    s(i,j)         Determina si el vinculo entre los nodos i j se selecciona o no.
    z              Objective function ;
    
Binary Variable s;

Equations
objectiveFunction   Funcion Objetivo del modelo
nodoFuente(i)       Nodo Inicial
nodoDestino(j)      Nodo Final
nodoTransicion(i)   Nodo de transicion entre inicial y final.
;

objectiveFunction                               ..              z =e= sum((i,j), c(i,j) * s(i,j));
nodoFuente(i)$(ord(i) = 4)                      ..              sum((j), s(i,j)) =e= 1;
nodoDestino(j)$(ord(j) = 6)                     ..              sum((i), s(i,j)) =e= 1;
nodoTransicion(i)$(ord(i) <> 4 and ord(i) <> 6) ..              sum((j), s(i,j)) - sum((j), s(j,i)) =e= 0;

Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;

Display c;
Display s.l;
Display z.l;