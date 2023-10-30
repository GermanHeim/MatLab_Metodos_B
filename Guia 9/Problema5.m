% Ej 5
% German Heim
close all
clear all
format long
clc
X
V=[0.6 1.8 3.2 3.8 6.0 9.0 9.2 11.0];
P=[418.2 367.0 337.8 330.6 321.7 288.0 281.4 201.0];

coef_interp = polyfit(V, P, length(P)-1);
pol_interp = @(x) coef_interp(8) + coef_interp(7).*x + coef_interp(6).*x.^2 + coef_interp(5).*x.^3 + coef_interp(4).*x.^4 + coef_interp(3).*x.^5 + coef_interp(2).*x.^6 +coef_interp(1).*x.^7;

hold on
grid on
scatter(V,P)
fplot(pol_interp, [min(V), max(V)])
legend('Datos', 'Pol. de Interpolacion')

int_interp = integral(pol_interp, min(V), max(V));
int_trap = trapecios(V, P);
int_trap_matlab = trapz(V,P); %Son iguales

%Yo recomendaria utilizar la integral del polinomio de interpolación ya que
%pareceria tener un compartamiento normal durante todo el dominio (segun el grafico), 
%mientras que trapecios tendria un comportamiento lineal de punto a punto 
%lo que puede llegar a no ser realista