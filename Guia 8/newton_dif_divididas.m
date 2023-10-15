function polinomio = newton_dif_divididas(x, y)
%NEWTON_DIF_DIVIDIDAS Metodo de Newton por diferencias divididas para
%hallar polinomio de interpolación
% x es un vector de la misma longitud que y
% Devuelve el polinomio de manera simbolica

polinomio = zeros(1, length(x));
f = zeros(length(x), length(x));
f(:, 1) = y;

% Calcular las diferencias divididas como si fuera una tabla
for j=2:length(x)
    for i=1:length(x)-j+1
        f(i, j) = (f(i+1, j-1) - f(i, j-1)) / (x(i+j-1) - x(i));
    end
end

% Construir el polinomio interpolación
for j=1:length(x)
    polinomio(j) = f(1, j);
end

% Crear el polinomio interpolante como una función simbolica
syms X;
interpolacion = polinomio(1);
for j=2:length(x)
    interpolacion = interpolacion + polinomio(j) * prod(X - x(1:j-1));
end

% Devolver el polinomio interpolante
polinomio = interpolacion;
end
