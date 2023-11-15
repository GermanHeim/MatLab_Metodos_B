% Ej 4
% German Heim
clear all
close all
clc

F1=@(x,y,z) z; 
F2=@(x,y,z) 4 - 1/8*z*y;

a=1;
b=3;
yi=17;
yf=14.3;
h=0.5;
error_abs=0.0001;
est_1=1;
est_2=10;

[val_x_shooting, val_y_shooting, val_z_shooting] = shooting_edo_punto_medio(a, b, h, yi, yf, F1, F2, error_abs, est_1, est_2);

hold on
grid on
plot(val_x_shooting, val_y_shooting)

ci_z=val_z_shooting(1);

% Inciso D
syms Y(t)
eq_mb = diff(Y, t, 2) == 4 - 1/8*diff(Y, t, 1)*Y;
dy_dt = diff(Y, t, 1);
condicion_1 = Y(1)==17;
condicion_2 = dy_dt(1) == ci_z; % Asumis que Shooting esta bien porque matlab no encuentra la solucion explicita
% condicion_2 = Y(3)==14.3;
solucion_matlab = dsolve(eq_mb, [condicion_1, condicion_2]);
ezplot(solucion_matlab, [0.5, 3])