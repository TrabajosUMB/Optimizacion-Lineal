#Conjuntos
set I; #Conjunto de Productos
set J; #Recursos o Procesos

#Parametros
param u{I}; #Utilidad de cada Producto
param a{J,I}; #Tiempo requeriso en el recurso j para el producto i, donde j son las filas y i son las columnas
param b{J}; #Recursos disponibles para cada recurso j

#Variables
var x{i in I} >=0; #Cantidada a Producir cada producto i

#Funcion Objetivo
maximize Utilidad_Total:
sum{i in I} x[i]*u[i];

#Restricciones
subject to Capacida{j in J}:
sum{i in I} a [j,i]*x[i] <= b[j];

#Datos
data;
set I := Kit_Basico Kit_Avanzado;
set J := Ensamble Pruebas Empaque;

param u:=
Kit_Basico	50
Kit_Avanzado	70;

param b:=
Ensamble	240
Pruebas	180
Empaque	150;

param a:
	Kit_Basico	Kit_Avanzado :=
Ensamble	4	6
Pruebas	3	3
Empaque	2	5;
