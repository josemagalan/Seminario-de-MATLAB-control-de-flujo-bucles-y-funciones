function app_estadisticas
%APP_ESTADISTICAS Pequeña app de consola para resumir valores numéricos.
%   Pide n, solicita n valores validados y muestra media, mediana, min, max, std.

    clear; clc;

    % Pedir entero positivo
    n = [];
    while isempty(n) || ~isscalar(n) || ~isfinite(n) || n<=0 || fix(n)~=n
        n = input('¿Cuántos valores quieres introducir? ');
    end

    % Recoger valores con validación
    valores = zeros(1,n);
    for i = 1:n
        x = [];
        while isempty(x) || ~isscalar(x) || ~isfinite(x)
            x = input(sprintf('Valor %d: ', i));
        end
        valores(i) = x;
    end

    % Calcular resumen con función
    [m, med, mn, mx, s] = resumen(valores);

    % Mostrar resultados
    fprintf("\nResumen:\n");
    fprintf("  Media   : %.4f\n", m);
    fprintf("  Mediana : %.4f\n", med);
    fprintf("  Mínimo  : %.4f\n", mn);
    fprintf("  Máximo  : %.4f\n", mx);
    fprintf("  DesvTip : %.4f\n", s);
end
