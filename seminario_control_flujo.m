%% Seminario de MATLAB: Control de flujo, operadores lógicos y funciones
% Mensaje clave:
% - En MATLAB todo son matrices/vectores.
% - El control de flujo decide y repite.
% - Las funciones encapsulan (tienen su propio workspace).

clear; clc;

%% 1) Operadores lógicos (AND, OR, NOT, XOR)
% Símbolos básicos (entre escalares lógicos / comparaciones):
%   &   : AND (Y lógico)         -> a & b   devuelve true si a y b son verdaderos
%   |   : OR  (O lógico)         -> a | b   devuelve true si al menos uno es verdadero
%   ~   : NOT (NO lógico)        -> ~a      invierte el valor lógico de a
%   xor : XOR (O exclusivo)      -> xor(a,b) true si exactamente uno es verdadero
%
% IMPORTANTE: operadores "de cortocircuito" para escalares:
%   &&  : AND con cortocircuito  -> evalúa la 2ª condición solo si la 1ª es true
%   ||  : OR  con cortocircuito  -> evalúa la 2ª condición solo si la 1ª es false
%
% Usar &&/|| cuando combinas condiciones escalares (no vectorizadas) en if/while:
% - Eficiencia: evita evaluar la 2ª parte si ya se sabe el resultado.
% - Seguridad: evita errores si la 2ª parte asume algo de la 1ª.

x = 5; y = 10; z = 5;

% Ejemplos:
a1 = (x > 3) & (y < 12);          % true
a2 = (x == z) & (y > 15);         % false (segunda es false)
a3 = (x == z) && (y > 15);        % igual que a2, pero con cortocircuito
a4 = (x == 5) | (y > 20);         % true (la primera es true)
a5 = ~(x == y);                   % true (5 ~= 10)

% %d indica que lo imprima en formato entero
fprintf("a1=%d, a2=%d, a3=%d, a4=%d, a5=%d\n", a1,a2,a3,a4,a5);

%% 2.1) if / elseif / else
% Estructura condicional clásica.

x = randi([-5,5]);  % entero aleatorio en [-5,5]
if x > 0
    disp("x es positivo");
elseif x == 0
    disp("x es cero");
else
    disp("x es negativo");
end

%% 2.2) Condiciones compuestas
% Combinar OR (||) y AND (&&) según reglas reales de un problema.

edad = 17;
acompagnado = true;

if edad >= 18 || (edad >= 16 && acompagnado)
    disp("Puedes entrar a la película.");
else
    disp("No puedes entrar.");
end

%% 2.3) switch
% Alternativa clara a múltiples if/elseif para igualdad con valores discretos.

op = 'b';

switch op
    case 'a'
        disp("Opción A");
    case {'b','B'}
        disp("Opción B");
    otherwise
        disp("Opción no válida");
end

%% Ejercicio A (5'): Clasificar una nota 0–10
% Pide una nota (0–10) y muestra:
%  >=9: "Sobresaliente"; >=7: "Notable"; >=5: "Aprobado"; si no: "Suspenso"
% --- Solución de ejemplo (con una nota fija, cambia 'nota' o usa input):

%% 3) Bucles: for vs while
% Diferencia clave:
% - for   : nº de iteraciones conocido a priori (recorrer rangos/colecciones)
% - while : iteraciones dependen de una condición (desconocido a priori)

%% 3.1) Bucle for: recorrer un rango conocido
% Ejemplo 1: cuadrados del 1 al 5
for i = 1:5
    cuadrado = i^2;
    disp(['El cuadrado de ', num2str(i), ' es ', num2str(cuadrado)]);
end

% Ejemplo 2: suma 1..10
suma = 0;
for k = 1:10
    suma = suma + k;
end
fprintf("Suma 1..10 = %d\n", suma);

%% 3.2) Bucle while: repetir hasta que cambie una condición
% Ejemplo 1: primer entero cuyo cuadrado es > 50
numero = 1;
while numero^2 <= 50
    numero = numero + 1;
end
disp(['El primer número cuyo cuadrado es mayor que 50 es: ', num2str(numero)]);

% Ejemplo 2: acumular hasta superar 20
n = 0; total = 0;
while total < 20
    n = n + 1;
    total = total + n;
end
fprintf("n=%d, total=%d\n", n, total);

%% Ejercicio B (for): suma de los cuadrados de un vector
% Objetivo: con un for, calcular la suma de cuadrados de 'numeros'.
numeros = [2, 5, 1, 8, 3];


%% 4) Funciones: script vs función, entradas/salidas
% - Script: se ejecuta en el workspace actual (no tiene firma de función).
% - Función: tiene su propio workspace. Archivo con el mismo nombre que la función.

clear cuadrado
% 4.2) Uso de la función 'cuadrado' (archivo cuadrado.m en el path)
r = cuadrado(3);        % 9
fprintf("cuadrado(3) = %d\n", r);

% 4.3) Función con múltiples salidas (estadisticas_basicas.m)
data = randn(1,1000);
[media, sigma, minimo, maximo] = estadisticas_basicas(data);
fprintf("media=%.3f, sigma=%.3f, min=%.3f, max=%.3f\n", media, sigma, minimo, maximo);

% Ejercicio C: IMC (ver imc.m). Ejemplo de uso:
% Crea una función imc(peso, altura) que devuelva IMC y la categoría (texto: "bajo peso", "normal", "sobrepeso", "obesidad") según el valor. 
[v, c] = imc(70, 1.75);
fprintf("IMC=%.2f, categoría=%s\n", v, c);

%% 5) Entrada de usuario, validación y mini-proyecto
% 5.1) input + validación + fprintf
% (Descomenta estas líneas para pedir entrada real)

n = [];
while isempty(n) || ~isscalar(n) || ~isfinite(n) || n<=0 || fix(n)~=n
    n = input('Introduce un entero positivo: ');
end
fprintf("Has introducido n=%d\n", n);

% 5.2) Menú simple (ejemplo)
disp("Menú:");
disp(" 1) Celsius a Fahrenheit");
disp(" 2) Fahrenheit a Celsius");
% opc = input('Elige 1 o 2: ');  % descomenta para uso interactivo

%% 5.3) Mini-proyecto: Calculadora de estadísticas (ver app_estadisticas.m y resumen.m)
% - Pide cuántos valores introducir, los lee con validación y muestra:
%   media, mediana, mínimo, máximo y desviación típica.
% - El cálculo está encapsulado en la función 'resumen'.

% Ejecuta el script dedicado:
% app_estadisticas    % <- (descomenta si el archivo está en el path)

%% 6) Retos finales
% Pide al usuario un año y di si es bisiesto 
% (regla: divisible por 4 y no por 100, salvo que sea divisible por 400).


% Reto 2) Serie armónica 1 + 1/2 + ... + 1/n (validar n y usar while)
% Calcula la suma de la serie 1 + 1/2 + 1/3 + ... + 1/n 
% con while pidiendo n al usuario y valida la entrada.


% Reto 3) Conversión de temperaturas
% Crea una función celsius_a_fahrenheit(c) que convierta grados Celsius a Fahrenheit.
% Fórmula: F = (9/5)*C + 32.
% Prueba la función con c = 20.

% Reto 4) Área de un círculo
% Crea una función area_circulo(r) que calcule el área de un círculo de radio r.
% Fórmula: A = pi * r^2.
% Añade validación para que r sea >= 0.
% Prueba con r = 5.

% Reto 5) Contar positivos
% Crea una función cuenta_positivos(x) que devuelva el número de elementos
% positivos dentro de un vector x.
% Prueba con v = [-3, 4, 0, 7, -1].

%% Material de apoyo (cheat-sheet breve)
% if cond, ... elseif cond, ... else, ... end
% switch expr, case v, ... otherwise ... end
% for i = 1:N, ... end
% while cond, ... end
% break, continue
% function [out1,out2] = nombre(in1,in2)
%   % ayuda
%   out1 = ...; out2 = ...;
% end
% Entrada usuario:  x = input('Mensaje: ')
% Salida formateada: fprintf("pi=%.3f\n", pi)

% Buenas prácticas:
% - Una función por archivo (archivo = nombre de la función).
% - Comentarios claros y bloque de help en cabecera.
% - Validar entradas (nargin, validateattributes).
% - Preferir vectorización cuando sea fácil.

