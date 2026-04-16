#Conjuntos
set I; #Conjunto de Plantas
set J; #Clientes

#Parametros
param s{I}; #Capacidad de las Plantas i
param d{J}; #Demanda de cada Cliente j
param c{I,J}; #Costo de envir una unidad de producto j desde una determinada planta i

#Variables
var x{i in I, j in J} >=0; #Cantidad a enviar de cada producto j desde determinado origen i

#Funcion Objetivo
minimize Costo_total:
sum{i in I, j in J} x[i,j]*c[i,j];

#Restricciones
subject to Capacidad{i in I}:
sum{j in J} x[i,j] <= s[i];

subject to Demanda{j in J}:
sum{i in I} x[i,j] = d[j];

#Datos
data;
set I := P1 P2 P3;
set J := C1 C2 C3 C4;

param s:=
P1	120
P2	100
P3	80;

param d:=
C1	70
C2	60
C3	90
C4	80;

param c:
	C1	C2	C3	C4:=
P1	4	6	8	13
P2	5	11	9	7
P3	6	8	10	6;


