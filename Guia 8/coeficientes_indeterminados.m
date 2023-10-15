function output = coeficientes_indeterminados(x, y)
%COEFICIENTES_INDETERMINADOS Metodo de coeficientes indeterminados para
%hallar polinomio de interpolación
% x es un vector de la misma longitud que y
% Devuelve los coeficientes

A=zeros(length(x));
for i=1:length(x)
    for j=1:length(x)
        A(i, j)=x(i)^j;
    end
end

if size(y, 1) == 1
    y=transpose(y);
end

A=[ones(length(x), 1), A]; %Agrega los coeficientes de a0
A(:,end) = [];
output = linsolve(A, y);
end