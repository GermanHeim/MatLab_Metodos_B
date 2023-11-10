% Ej 1
% German Heim
clear all
close all
clc

F1 = @(x, y, z) z;
F2 = @(x, y, z) 2*z-y-3;

%Sabemos que y(0) = -3, y(2) = 1, x e [0, 2]
a=0;
b=2;
y_i = -3;
y_f = 1;
h = 0.5;
error_abs = 0.0005;
est_1 = 1;
est_2 = -1;

[x_shooting_euler, y_shooting_euler, z_shooting_euler] = shooting_edo_euler(a, b, h, y_i, y_f, F1, F2, error_abs, est_1, est_2);
[x_shooting_heun, y_shooting_heun, z_shooting_heun] = shooting_edo_heun(a, b, h, y_i, y_f, F1, F2, error_abs, est_1, est_2);

% Inciso B
A=[1 0 0 0 0;...
   -6 7 -2 0 0;...
   0 -6 7 -2 0;...
   0 0 -6 7 -2;...
   0 0 0 0 1];
B=transpose([-3 3 3 3 1]);

y_dif_finitas = linsolve(A, B);