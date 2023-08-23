% Ej 4
% German Heim
close all
clear all
clc
syms X
f=exp(X);

Et = subs(f, 1) - subs(taylor_polinomio(f, 4, 0), 1);
disp(Et) % Error de truncado

% Consultar B

n=5;
while Et >= 10^(-6)
    Et = subs(f, 1) - subs(taylor_polinomio(f, n, 0), 1);
    n=n+1;
end

Et_str = sprintf('%s', rat(Et));  % Utiliza 'rat' para mostrar la fracción en forma de ratio
disp(['Se requieren ', num2str(n), ' terminos para que el error sea menor a 10^(-6). El error es de ', Et_str])

