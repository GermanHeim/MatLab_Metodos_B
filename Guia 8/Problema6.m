% Ej 6
% Germán Heim
close all
clear all
format long
clc

x=[0.1 1 2 4 5 7];
y=[0.1 3.6 4.8 6 6.3 6.8];

pol_newton = newton_dif_divididas(x,y);
pol_lagrange = metodo_lagrange(x,y);
coef_indet = coeficientes_indeterminados(x,y);
pol_coef = @(x) coef_indet(1) + coef_indet(2)*x + coef_indet(3)*x^2 + coef_indet(4)*x^3 + coef_indet(5)*x^4 + coef_indet(6)*x^5;

hold on
grid on
scatter(x,y)
fplot(matlabFunction(pol_newton), [min(x), max(x)])
fplot(matlabFunction(pol_lagrange), [min(x), max(x)])
fplot(pol_coef, [min(x), max(x)])

funcion = @(x) 1.591 * log(x) + 3.716;
fplot(funcion, [min(x) max(x)])
legend('Datos', 'Newton', 'Lagrange', 'Coeficientes', 'Funcion')

% Los polinomios de interpolación son bastante similares a la funcion real,
% exceptuando para x>5 donde la interpolación toma valores con una
% diferencia bastante pronunciada respecto a los demas valores

valor_verdadero = funcion(6);
valor_interpolacion = pol_coef(6);
error_rel_porc = abs((valor_verdadero-valor_interpolacion)/valor_verdadero)*100;