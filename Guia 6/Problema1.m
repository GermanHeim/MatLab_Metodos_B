% Ej 1
% German Heim
close all
clear all
clc
format long

syms X
F=-1.5*(X)^6 - 2*(X)^4 + 12*(X);
Fprima = matlabFunction(diff(F, 1));
Fprimasegunda = matlabFunction(diff(F, 2));
x0 = 2;
tol = 0;
N=3;

optimo = newton_optimo(Fprima, Fprimasegunda, x0, tol, N, "max");
hold on
grid on
fplot(F, [-2, 2])
plot(optimo,subs(F, optimo),'r*')