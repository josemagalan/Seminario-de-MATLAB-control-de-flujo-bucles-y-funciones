sumaCuad = 0;
for ii = 1:numel(numeros)
    sumaCuad = sumaCuad + numeros(ii)^2;
end
fprintf("Suma de cuadrados = %d\n", sumaCuad);

% Nota: vectorizado sería sum(numeros.^2), pero aquí practicamos for.