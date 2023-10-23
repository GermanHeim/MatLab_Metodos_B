% Ej 3
% Germán Heim
close all
clear all
format long
clc

P=[418.2 367.0 337.8 330.6 321.7 288.0 281.4 201.0];
V=[0.8 1.8 3.2 3.8 6.0 9.0 9.2 11.0];

%Ordena P y V de menor a mayor en base a P
PV = [P', V'];
PV = sortrows(PV, -1, 'ascend');
P=PV(:,1)';
V=PV(:,2)';

%Inciso A
hold on
grid on
scatter(P, V);
coef = polyfit(P, V, length(P)-1);
valores_x = linspace(min(P), max(P));
valores_y = polyval(coef, valores_x);
plot(valores_x, valores_y);

%Inciso B
[x_spline_lineal, y_spline_lineal] = spline_lineal(P, V);
plot(linspace(P(1), P(length(P)), length(y_spline_lineal)), y_spline_lineal)
y_spline_cubico = interp1(P, V, min(P):max(P), 'spline');
plot(linspace(P(1), P(length(P)), length(y_spline_cubico)),y_spline_cubico)
legend('Datos', 'Coeficientes', 'Spline lineal', 'Spline cubico')

%Inciso C
disp('--- Aproximación del volumen según los métodos ---')
disp(['Coeficientes: ', num2str(polyval(coef, 250.00))])

dif_abs = abs(x_spline_lineal - 250); %Busca el numero mas cercano a 250
indice = find(dif_abs == min(dif_abs));
disp(['Spline lineal: ', num2str(y_spline_lineal(indice))])
disp(['Spline cubico: ', num2str(interp1(P,V,250,'spline'))])

% Descartaria el dato de coeficientes, ya que el mismo no parece tener un
% comportamiento real en ese intervalo, teniendo que hacer un pico para
% cumplir con el polinomio de interpolación. Los otros dos parecen ser
% valores reales