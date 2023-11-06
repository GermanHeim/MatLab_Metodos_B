% Ej 9
% German Heim
clear all
close all
clc

% Transformamos la funcion usando z=dx/dt y despejamos
F1=@(t, z, x) -10*x + 2*z;
F2=@(t, z, x) z;

val_1 = 0; %z, dxdt
val_2 = 10; % x
h=0.02;
a=0;
b=0.2;

[val_t, val_z, val_x] = sist_edo_rk4(F1, F2, val_1, val_2, h, a, b);