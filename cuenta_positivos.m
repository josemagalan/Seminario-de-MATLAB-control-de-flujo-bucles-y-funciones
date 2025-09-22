function n = cuenta_positivos(x)
    validateattributes(x, {'numeric'}, {'vector'});
    n = sum(x > 0);
end