% Ej 6
% German Heim
clear all
close all
clc

K=10^(-3);
D_ab = 1.2*10^(-9);

% Y es C
F1=@(x,y,t) t;
F2=@(x,y,t) (K/D_ab) * y;

zi=0;
zf=10.0e-3;
Ci = 0.2;
Tf = 0;
error=0;
est_1 = -150;
est_2 = -200;
h=zf/100;

% Shooting manual
% Usando RK4
[val_x_iter1, val_y_iter1, val_z_iter1] = sist_edo_rk4(F1, F2, Ci, est_1, h, zi, zf);
[val_x_iter2, val_y_iter2, val_z_iter2] = sist_edo_rk4(F1, F2, Ci, est_2, h, zi, zf);
cb_1 = val_z_iter1(end); % Valor de Z final
cb_2 = val_z_iter2(end);

ci_secante = (Tf - cb_1)*((est_2 - est_1)/(cb_2 - cb_1)) + est_1;
[val_x_iter3, val_y_iter3, val_z_iter3] = sist_edo_rk4(F1, F2, Ci, ci_secante, h, zi, zf);

% Usando ODE45 (Mayor precision)
% F=@(x, y)[y(2); (K/D_ab) * y(1)];
% [val_x_iter1, val_y_iter1] = ode45(F, [zi, zf], [Ci, est_1])
% cb_1 = val_y_iter1(end, 2); % Valor de Z final
% 
% [val_x_iter2, val_y_iter2] = ode45(F, [zi, zf], [Ci, est_2])
% cb_2 = val_y_iter2(end, 2);
% 
% ci_secante = (Tf - cb_1)*((est_2 - est_1)/(cb_2 - cb_1)) + est_1;
% 
% [val_x_iter3, val_y_iter3] = ode45(F, [zi, zf], [Ci, ci_secante]);

hold on
grid on
plot(val_x_iter3, val_y_iter3)

f_analitica = @(x) 0.2 * (cosh(zf*sqrt((K/D_ab))*(1-x/zf)))/(cosh(zf*sqrt((K/D_ab))));
fplot(f_analitica, [0, zf])