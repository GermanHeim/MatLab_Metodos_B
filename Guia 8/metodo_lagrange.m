function polinomio = metodo_lagrange(x, y)
%METODO_LAGRANGE Metodo de Lagrange para
%hallar polinomio de interpolación
% x es un vector de la misma longitud que y
% Devuelve el polinomio de manera simbolica
    
syms X;  % Variable simbólica para el polinomio resultante
polinomio = 0;
    
for i = 1:length(x)
    termino = y(i);
    for j=1:length(x)
        if j ~= i
            termino = termino * (X - x(j)) / (x(i) - x(j));
        end
    end
    polinomio = polinomio + termino;
end
    
% Simplifica el polinomio resultante
polinomio = simplify(polinomio);
end
