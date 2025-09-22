%% Material de apoyo (Cheat-sheet ampliado)

% ─────────────────────────────────────────────────────────────────────────────
% 1) Condicionales
% ─────────────────────────────────────────────────────────────────────────────
% if / elseif / else
% Estructura: ejecuta el primer bloque cuya condición sea verdadera.

% Sintaxis:
% if cond1
%     ...  % bloque 1
% elseif cond2
%     ...  % bloque 2
% else
%     ...  % bloque por defecto
% end

% Ejemplo:
x = 3;
if x > 5
    disp("Mayor que 5");
elseif x == 5
    disp("Igual a 5");
else
    disp("Menor que 5");
end

% switch / case / otherwise
% Para igualdad con valores discretos; más legible que múltiples elseif.

% Sintaxis:
% switch expr
%   case v1
%       ...
%   case {v2a, v2b}
%       ...
%   otherwise
%       ...
% end

op = 'B';
switch op
    case 'A'
        disp("Opción A");
    case {'b','B'}
        disp("Opción B");
    otherwise
        disp("No reconocida");
end

% Operadores lógicos (escalares)
%  &&  AND con cortocircuito   (evalúa 2ª parte solo si la 1ª es true)
%  ||  OR  con cortocircuito   (evalúa 2ª parte solo si la 1ª es false)
%  ~   NOT
%  & y | son versiones elemento-a-elemento para arrays lógicos.

a = 2; b = 10;
if (a > 1) && (b < 5)   % la segunda no se evalúa si (a > 1) es false
    disp("Se cumplen ambas");
end


% ─────────────────────────────────────────────────────────────────────────────
% 2) Bucles
% ─────────────────────────────────────────────────────────────────────────────
% for: nº de iteraciones conocido (recorrer rangos/colecciones).
% while: repetir mientras la condición sea verdadera (nº desconocido).
% ─────────────────────────────────────────────────────────────────────────────
% break y continue en bucles
% ─────────────────────────────────────────────────────────────────────────────
% break    : interrumpe la ejecución del bucle actual y salta al final de él.
% continue : salta directamente a la siguiente iteración del bucle,
%            omitiendo el resto de instrucciones de la actual.



% for
for i = 1:4
    fprintf("i=%d\n", i);
end

% while
k = 1; s = 0;
while s < 10
    s = s + k;
    k = k + 1;
end
fprintf("s=%d, k=%d\n", s, k);

% Control de flujo en bucles:
%  break    -> sale del bucle actual
%  continue -> salta a la siguiente iteración

for n = 1:6
    if mod(n,2)==0, continue; end   % imprime solo impares
    if n > 5, break; end
    fprintf("n impar = %d\n", n);
end


% ─────────────────────────────────────────────────────────────────────────────
% 3) Funciones (encapsulación)
% ─────────────────────────────────────────────────────────────────────────────
% - Tienen su propio workspace.
% - El archivo debe llamarse igual que la función principal: nombre.m
%
% Plantilla mínima con ayuda (aparece con "help nombre"):

% function [out1,out2] = nombre(in1,in2)
% %NOMBRE Descripción breve en una línea.
% %   [out1,out2] = NOMBRE(in1,in2) amplia la descripción…
% %
% %   Ejemplos:
% %     [a,b] = nombre(1,2)
%
%     % Validación ligera de entradas (opcional):
%     % validateattributes(in1, {'double'}, {'scalar','real'});
%
%     out1 = ...;
%     out2 = ...;
% end

% Ejemplo rápido de función local (R2016b+), al final del script:
% function y = cuadrado_local(x)
%     y = x.^2;
% end


% ─────────────────────────────────────────────────────────────────────────────
% 4) Entrada y salida por consola
% ─────────────────────────────────────────────────────────────────────────────
% Input del usuario (bloquea hasta recibir entrada):
%   x = input('Mensaje: ')              % número (evalúa expresión)
%   s = input('Mensaje: ','s')          % cadena literal

% Salida formateada con fprintf:
%   \n  -> salto de línea
%   %d  -> entero
%   %f  -> float (por defecto 6 decimales)
%   %.3f-> float con 3 decimales
%   %s  -> cadena
%
% Ejemplos:
fprintf("pi con default = %f\n", pi);
fprintf("pi con 3 dec   = %.3f\n", pi);
nombre = "Ana";
fprintf("Hola, %s\n", nombre);

% Conversión número ↔ cadena:
%   num2str(3.14159)   -> "3.14159"
%   str2double("2.5")  -> 2.5 (double) o NaN si no válido


% ─────────────────────────────────────────────────────────────────────────────
% 5) Vectores, matrices y vectorización (atajos útiles)
% ─────────────────────────────────────────────────────────────────────────────
v = 1:5;          % [1 2 3 4 5]
w = linspace(0,1,6);  % 6 puntos de 0 a 1
A = [1 2; 3 4];

% Operaciones elemento-a-elemento: usar el punto (.) antes del operador:
v2 = v.^2;        % cuadrado de cada elemento
p  = v .* (2*v);  % producto elemento a elemento
q  = v ./ (v+1);  % división elemento a elemento

% Indexación lógica:
x = -3:3;
positivos = x(x>0);   % extrae [1 2 3]

% Preasignación (rendimiento):
n = 1000;
acc = zeros(1,n);     % mejor que crecer dinámicamente dentro del bucle
for i = 1:n
    acc(i) = i^2;
end


% ─────────────────────────────────────────────────────────────────────────────
% 6) Validación y errores amigables
% ─────────────────────────────────────────────────────────────────────────────
% validateattributes(variable, clases, requisitos)
%  - Útil en funciones para fallos tempranos y mensajes claros.

r = 5;
validateattributes(r, {'numeric'}, {'scalar','real','finite','nonnegative'});

% Mensajes de error/aviso personalizados:
% error("El radio debe ser no negativo.");
% warning("Esto puede tardar unos segundos...");


% ─────────────────────────────────────────────────────────────────────────────
% 7) Consejos rápidos
% ─────────────────────────────────────────────────────────────────────────────
% • Secciones con %% para ejecutar por bloques (Ctrl+Enter).
% • Usa && y || para condiciones escalares; & y | para arrays lógicos.
% • Una función por archivo; el nombre del archivo = nombre de la función.
% • Añade bloque de help en la cabecera (help muestra la primera parte).
% • Prefiere vectorización cuando sea simple (p.ej., sum(v.^2) vs bucle).
% • Preasigna memoria en bucles largos (zeros, ones, NaN).
% • Usa rng(0) para resultados reproducibles con aleatoriedad (rand, randi).
% • Mantén el directorio con tus .m en el path (addpath/genpath si hace falta).
% • Guarda variables clave con save('datos.mat','var1','var2') y carga con load.
