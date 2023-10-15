% Ej 1
% Germán Heim
close all
clear all
format long
clc

x = [1, 2, 2.5, 3.8, 5.6, 7.1, 8.4, 9.2, 10.5, 12.6, 15.2];
y = [0, 0.69, 0.91, 1.33, 1.72, 1.96, 2.12, 2.21, 2.35, 2.53, 2.72];
coeficientes = transpose(coeficientes_indeterminados(x, y));


%Inciso B
coeficientes_mb = polyfit(x,y,length(x)-1);
%Se observa una pequeña diferencia entre los valores, porque? Rango de la
%matriz es muy grande y hay inestabilidad?

hold on
grid on
scatter(x, y)
valores_x=linspace(min(x), max(x));
coeficientes = coeficientes(end:-1:1); % Rota los elementos hacia atras para usar polyval
y_coef_indet = polyval(coeficientes, valores_x);
y_coef_matlab = polyval(coeficientes_mb, valores_x);
plot(valores_x, y_coef_indet)
plot(valores_x, y_coef_matlab)


%Inciso C
polinomio_lagrange = matlabFunction(metodo_lagrange(x, y));
fplot(polinomio_lagrange, [min(x), max(x)])
polinomio_newton = matlabFunction(newton_dif_divididas(x,y));
fplot(polinomio_newton, [min(x), max(x)])
legend('Datos', 'Coeficientes indeterminados', 'Fit de MATLAB', 'Polinomio Lagrange', 'Polinomio Newton')


% Inciso D
disp('Estimaciones f(4.5):')
disp(['Coeficientes indeterminados = ', num2str(polyval(coeficientes, 4.5))])
disp(['Coeficientes MATLAB (Polyfit) = ', num2str(polyval(coeficientes_mb, 4.5))])
disp(['Lagrange = ', num2str(polinomio_lagrange(4.5))])
disp(['Newton = ', num2str(polinomio_newton(4.5))])
disp('----------------------------------')
disp('Estimaciones f(14.5):')
disp(['Coeficientes indeterminados = ', num2str(polyval(coeficientes, 14.5))])
disp(['Coeficientes MATLAB (Polyfit) = ', num2str(polyval(coeficientes_mb, 14.5))])
disp(['Lagrange = ', num2str(polinomio_lagrange(14.5))])
disp(['Newton = ', num2str(polinomio_newton(14.5))])

% La primer estimación pareceria seguir una tendencia correcta, sin embargo
% en la segunda estimación, los polinomios de interpolación parecerian
% desviarse de la tendencia de los valores experimentales