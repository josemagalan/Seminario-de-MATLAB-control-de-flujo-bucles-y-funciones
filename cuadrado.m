function y = cuadrado(x)
%CUADRADO Eleva al cuadrado el argumento x (elemento a elemento si es vector/matriz)
%   y = cuadrado(x) devuelve x.^2
%
%   Ejemplos:
%     cuadrado(3)         % 9
%     cuadrado([1 2 3])   % [1 4 9]

    % Validación ligera
    validateattributes(x, {'numeric'}, {'nonempty'});

    y = x.^2;
end
