% Ej 4
% German Heim
close all
clear all
clc
syms X
f=exp(X);

Et = subs(f, 1) - subs(taylor_polinomio(f, 4, 0), 1);
disp(Et)
