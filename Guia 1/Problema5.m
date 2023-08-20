% German Heim
% Ej 5
clear all
close all
format long
clc

x=0:0.1:3.2;
y=func5(x);
y_273=func5(2.73); % y cuando x=2.73, 0.011917000000000
disp(y_273)
plot(x, y)

% Papel 2 digitos despues de la coma: 0.02
% Papel 5 digitos despues de la coma: -0.51808
papel_2 = 0.02;
papel_5 = -0.51808;

error_rel_2 = 100*abs((papel_2 - y_273)/y_273);
error_rel_5 = 100*abs((papel_5 - y_273)/y_273);

disp(error_rel_2 + error_rel_5)

% Plot de las dos funciones
hold on
plot(x, y, 'b')
f = @(x) ((x-5).*x+6).*x+0.55;
fplot(f,[0, 3.2], 'r')
hold off

disp(f(2.73)) % 0.011917000000001
disp(y_273) % 0.011917000000000

% Ambas funciones son esencialmente equivalentes en términos de cálculo
% pero las diferencias pueden surgir debido a cómo se realizan las operaciones 
% y cómo se manejan los errores de redondeo en cada caso.
% yb(x) esta escrita de manera factorizada y utiliza redondeo y ajustos de
% punto flotante.
% Es por esto que y(x), el polinomio directo, es mejor representación.
% Aunque es minimo y por eso se tiene que utilizar format long