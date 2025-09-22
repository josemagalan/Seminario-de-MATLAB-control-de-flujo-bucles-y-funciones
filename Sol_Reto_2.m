
n = [];
while isempty(n) || ~isscalar(n) || ~isfinite(n) || n<=0 || fix(n)~=n
n = input('n (entero positivo): ');
end
s = 0; k = 1;
while k <= n
     s = s + 1/k;
     k = k + 1;
 end
 fprintf("Suma armónica H_%d = %.6f\n", n, s);