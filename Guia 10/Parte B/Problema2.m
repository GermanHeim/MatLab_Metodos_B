% Ej 1
% German Heim
clear all
close all
clc

% x es r, u es y,
F1 = @(x, y, z) z;
F2 = @(x, y, z) -2/x * z;

r1=2;
r2=4;
v1=100;
v2=0;
h=0.5; % Necesitamos cuando r=3

est_1=20;
est_2=50;
error_abs = 0.005;

[val_x_shooting, val_y_shooting, val_z_shooting] = shooting_edo_rk4(r1, r2, h, 100, 0, F1, F2, error_abs, est_1, est_2);
estimacion_r_3 = val_y_shooting(3);

valor_real = -110+440/3;