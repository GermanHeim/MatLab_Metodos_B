% Ej 3
% German Heim
close all
clear all
clc

n=1;
error_rel_porc = 100 * abs((cosaprox(pi/3, n) - cos(pi/3))  / cos(pi/3));
dif_rel_porc = 100 * abs((cosaprox(pi/3, n) - cosaprox(pi/3, n-1)) / (cosaprox(pi/3, n-1)));

while error_rel_porc >= 1 || dif_rel_porc >= 1
    n=n+1;
    error_rel_porc = 100 * abs((cosaprox(pi/3, n) - cos(pi/3))  / cos(pi/3));
    dif_rel_porc = 100 * abs((cosaprox(pi/3, n) - cosaprox(pi/3, n-1)) / (cosaprox(pi/3, n-1)));
end

% Aca la aproximación del coseno es igual para un n y un n+1 si n es impar
% Esto es debido a que la derivada se hace 0.
% Es por eso que la dif rel porc es 0 en varios casos.
disp(['Se necesitan ', num2str(n), ' terminos para que se cumplan las condiciones'])


% CONSULTAR