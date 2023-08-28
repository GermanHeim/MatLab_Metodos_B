% Ej 4
% German Heim
close all
clear all
clc
syms X
f=exp(X);

Et = subs(f, 1) - subs(taylor_polinomio(f, 3, 0), 1);
disp(Et) % Error de truncado

% Inciso B
limite_inf = subs(resto(f,3,0), 0);
limite_sup = subs(resto(f,3,0), 1);
if Et >= limite_inf && Et <= limite_sup
    disp('El error es superior al limite inferior y menor al limite superior')
    disp(['El limite inferior es: ', num2str(limite_inf)])
    disp(['El limite superior es: ', num2str(limite_sup)])
else
    disp('Hiciste algo mal')
end

n=5;
while Et >= 10^(-6)
    Et = subs(f, 1) - subs(taylor_polinomio(f, n, 0), 1);
    n=n+1;
end

Et_str = sprintf('%s', rat(Et));  % Utiliza 'rat' para mostrar la fracción en forma de ratio
disp(['Se requieren ', num2str(n), ' terminos para que el error sea menor a 10^(-6). El error es de ', Et_str])

