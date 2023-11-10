% Ej 3
% German Heim
clear all
close all
clc

% A es y
K=4*10.0e-6;
D=10.0e-6;
F1 = @(x, y, z) z;
F2 = @(x, y, z) K*y/D;

a=0;
b=4;
yi=0.1;
yf=0;
h=0.1;
error_abs=0.0001;
est_1=1;
est_2=0;

[val_x_shooting, val_y_shooting, val_z_shooting] = shooting_edo_rk4(a,b,h,yi,yf,F1,F2,error_abs,est_1,est_2);

hold on
grid on
plot(val_x_shooting, val_y_shooting)
xlim([0, 4])