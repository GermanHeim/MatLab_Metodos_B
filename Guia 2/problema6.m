% German Heim
% Ej 6
clear all
close all
clc

syms X
fa=X-1-0.5*sin(X);
taylor = taylor_polinomio(fa, 6, pi/3);
disp(taylor)

hold on
fplot(matlabFunction(taylor), [pi/4, pi], 'b')
fplot(@(x) (x-1-0.5*sin(x)), [pi/4, pi], 'r')