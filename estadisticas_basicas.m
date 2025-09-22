function [m, s, mn, mx] = estadisticas_basicas(x)
%ESTADISTICAS_BASICAS Media, desviación típica, mínimo y máximo.
%   [m, s, mn, mx] = estadisticas_basicas(x)
%   x puede ser vector o matriz (opera por todos los elementos).

    validateattributes(x, {'numeric'}, {'nonempty'});

    x = x(:);                % vectorizar
    m  = mean(x);
    s  = std(x);
    mn = min(x);
    mx = max(x);
end
