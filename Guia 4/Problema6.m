% German Heim
% Ej 5
clear all
close all
clc

f=@(x) sin(10*x)+cos(3*x);
hold on
grid on
fplot(f, [4, 5])

raiz_ci=newton_raphson(f, 4.25, (10.0e-6)*100, 1000); % Verbose output, 4.26359
% El *100 es para pasar pocentual, mi funcion utiliza porcentual

fzero(f, 4.25); %4.2290
fzero(f, 5); %4.7124