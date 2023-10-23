% Ej 4
% Germán Heim
close all
clear all
format long
clc

T = [200 250 300 350 400];
Elong = [7.5 8.6 8.7 10.0 11.3];

elong_375_lineal = interp1([T(4) T(5)], [Elong(4) Elong(5)], 375, 'linear');
coef_indet = coeficientes_indeterminados(T, Elong);

polinomio_indet = @(x) coef_indet(1) + coef_indet(2)*x + coef_indet(3)*x^2 + coef_indet(4)*x^3 + coef_indet(5)*x^4;

hold on
grid on
scatter(T,Elong);
fplot(polinomio_indet, [200, 400])
vals_x = linspace(200,400);
vals_y = interp1(T, Elong, vals_x, 'linear');
plot(vals_x, vals_y);
legend('Datos', 'Coeficientes indeterminados', 'Spline lineal')