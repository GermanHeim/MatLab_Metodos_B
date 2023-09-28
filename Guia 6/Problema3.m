% Ej 3
% German Heim
close all
clear all
clc
format long

syms X
F = 3 + 6*(X) + 5*(X)^2 + 3*(X)^3 + 4*(X)^4;

hold on
grid on
fplot(F, [-2, 2])
% Se observa que el minimo se encuentra aproximadamente en X=-0.5


Fprima = matlabFunction(diff(F, 1));
Fprimasegunda = matlabFunction(diff(F, 2));
x0 = -0.5;
tol = 10e-5 / 100;
N=100;
optimo = newton_optimo(Fprima, Fprimasegunda, x0, tol, N, "min");
plot(optimo,subs(F, optimo),'r*');

optimo_matlab = fminsearch(matlabFunction(F), 0);
disp(['Segun Matlab, el optimo es ', num2str(optimo_matlab)]);
