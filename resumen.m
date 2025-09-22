function [m, med, mn, mx, s] = resumen(x)
%RESUMEN Estadísticos básicos: media, mediana, mínimo, máximo y desviación típica.
%   [m, med, mn, mx, s] = resumen(x)

    validateattributes(x, {'numeric'}, {'nonempty'});

    x   = x(:);
    m   = mean(x);
    med = median(x);
    mn  = min(x);
    mx  = max(x);
    s   = std(x);
end
