% Ej 8
% German Heim
clear all
close all
clc

r=0.1;
a=0.01;
b=0.001;
m=0.05;

F1=@(x, P, C) r*P-a*P*C; %Presas
F2=@(x, P, C) b*P*C - m*C; %Cazadores
val_1 = 50;
val_2 = 15;
t0=0;
tf=200;
h=1;

[val_x_euler_h1, val_P_euler_h1, val_C_euler_h1] = sist_edo_euler(F1, F2, val_1, val_2, h, t0, tf);

h=0.01;
[val_x_euler_h001, val_P_euler_h001, val_C_euler_h001] = sist_edo_euler(F1, F2, val_1, val_2, h, t0, tf);

hold on
grid on
scatter(val_x_euler_h1, val_C_euler_h1)
scatter(val_x_euler_h1, val_P_euler_h1)
scatter(val_x_euler_h001, val_C_euler_h001)
scatter(val_x_euler_h001, val_P_euler_h001)
ec_ODE=@(x, y) [r.*y(1)-a.*y(1).*y(2); b.*y(1).*y(2) - m.*y(2)];
[t, p] = ode45(ec_ODE, [0, 200], [50, 15]);
scatter(t, p(:,1))
scatter(t, p(:,2))
legend('Cant. de cazadores, h=1', 'Cant. de presas, h=1', 'Cant. de cazadores, h=0.01', 'Cant. de presas, h=0.01', 'Cant. de presas, ODE45', 'Cant. de cazadores, ODE45')

% function ec_dif = ec_ODE(~, x)
%     r=0.1;
%     a=0.01;
%     b=0.001;
%     m=0.05;
%     ec_dif = [r.*x(1)-a.*x(1).*x(2); b.*x(1).*x(2) - m.*x(2)];
% end