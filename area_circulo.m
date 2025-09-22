function a = area_circulo(r)
    validateattributes(r, {'numeric'}, {'scalar','real','finite','nonnegative'});
    a = pi * r^2;
end