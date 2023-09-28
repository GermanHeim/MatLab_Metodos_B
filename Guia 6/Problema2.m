% Ej 2
% German Heim
close all
clear all
clc
format long

syms X
F = -(X)^4 - 2*(X)^3 - 8*(X)^2 - 5*(X);
Fprima = matlabFunction(diff(F, 1));
Fprimasegunda = matlabFunction(diff(F, 2));
x0 = -1;
tol = 10e-5 / 100;
N=100;

optimo = newton_optimo(Fprima, Fprimasegunda, x0, tol, N, "max");
hold on
grid on
fplot(F, [-2, 2]);
plot(optimo,subs(F, optimo),'r*');

valor_verdadero = -0.3472504665;
error_verdadero = abs (optimo - valor_verdadero);
disp(['El error verdadero es de ', num2str(error_verdadero)]);