% Reto 1) Año bisiesto (solución breve):
anio = 2024;  % o usa: anio = input('Introduce un año: ');
esBisiesto = (mod(anio,4)==0 && mod(anio,100)~=0) || (mod(anio,400)==0);
disp( ifelse(esBisiesto,"Es bisiesto","No es bisiesto") );