% Ej 2
% Germán Heim
close all
clear all
format long
clc

x = [1, 2, 3, 4, 5, 6];
y = [3, 6, 19, 99, 291, 444];
coeficientes = transpose(coeficientes_indeterminados(x, y));
newton = matlabFunction(newton_dif_divididas(x, y));
lagrange_pol = matlabFunction(metodo_lagrange(x,y));
coef_matlab = polyfit(x,y,length(x)-1);

% Inciso B
coeficientes = coeficientes(end:-1:1); % Rota los elementos hacia atras para usar polyval
disp('Estimaciones f(4):')
disp(['Coeficientes indeterminados = ', num2str(polyval(coeficientes, 4))])
disp(['Coeficientes MATLAB (Polyfit) = ', num2str(polyval(coef_matlab, 4))])
disp(['Lagrange = ', num2str(lagrange_pol(4))])
disp(['Newton = ', num2str(newton(4))])
disp('----------------------------------')

% Inciso C
% Si, es un polinomio de orden 5 que se describe como:
% y=125 - 302.63*x + 275.5*x^2 - 115.83*x^3 + 22.5*x^4 -1.53*x^5