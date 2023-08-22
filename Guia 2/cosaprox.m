function output = cosaprox(x, k)
% Aproxima el coseno usando un polinomio de Taylor centrado en x=0
% dado un x (donde se quiere aproximar) y un k (orden del polinomio)
output=1;
signo=1;
for j=1:k
    if mod(j, 2) == 0 % Verificando que sea par
        output=output+(-1)^(signo) * x^(j) /factorial(j); 
        signo=signo+1;
    end
end
end
