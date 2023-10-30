% Ej 8
% German Heim
close all
clear all
format long
clc

x=[10 17 24 29 34 41 48 52 56 60];
y=[-104 -265.61 -400.46 -400.61 -240.7 420.55 1856.5 3155.54 4892.34 7146];

i_1_3 = 1/3 * (x(3)-x(1))/2 * (y(1) + 4*y(2) + y(3));
i_3_5 = 1/3 * (x(5)-x(3))/2 * (y(3) + 4*y(4) + y(5));
i_5_7 = 1/3 * (x(7)-x(5))/2 * (y(5) + 4*y(6) + y(7));
i_7_10 = 3/8 * (x(10)-x(7))/3 * (y(7) + 3*y(8) + 3*y(9) + y(10));

integral_aprox = i_1_3 + i_3_5 + i_5_7 + i_7_10;

pol = @(x) 0.001.*x.^4 - 0.01 .* x.^3 - x.^2 - x + 6;
integral_verdadera = integral(pol, x(1), x(10));

error_verdadero = integral_verdadera - integral_aprox;

hold on
grid on
scatter(x, y)
fplot(pol, [min(x), max(x)])