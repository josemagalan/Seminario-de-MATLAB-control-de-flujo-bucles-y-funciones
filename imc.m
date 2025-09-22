function [valor, categoria] = imc(peso, altura)
%IMC Calcula el índice de masa corporal y su categoría.
%   [valor, categoria] = imc(peso, altura)
%   peso   : kg (positivo)
%   altura : m  (positivo)
%
%   Categorías (OMS):
%     <18.5  -> "bajo peso"
%     <25    -> "normal"
%     <30    -> "sobrepeso"
%     >=30   -> "obesidad"

    validateattributes(peso,   {'numeric'}, {'scalar','real','finite','positive'});
    validateattributes(altura, {'numeric'}, {'scalar','real','finite','positive'});

    valor = peso / (altura^2);

    if valor < 18.5
        categoria = "bajo peso";
    elseif valor < 25
        categoria = "normal";
    elseif valor < 30
        categoria = "sobrepeso";
    else
        categoria = "obesidad";
    end
end
