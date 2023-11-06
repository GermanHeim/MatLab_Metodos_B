% Ej 2
% German Heim
clear all
close all
clc

F=@(x, y) -2*x^3 + 12*x^2 -20*x + 8.5;
a=0;
val=1;
h=0.5;
b=1.5;

[val_x_euler, val_y_euler]= edo_euler(a, b, h, val, F);
[val_x_heun, val_y_heun]= edo_heun(a, b, h, val, F);
[val_x_medio, val_y_medio]= edo_punto_medio(a, b, h, val, F);
[val_x_rk4ord, val_y_rk4ord]= edo_rk4ord(a, b, h, val, F);

f_analitica = @(x) -0.5*x^4 + 4*x^3 - 10*x^2 + 17/2 * x + 1;
val_y_reales = [f_analitica(0) f_analitica(0.5) f_analitica(1) f_analitica(1.5)];

[val_x_ode45, val_y_ode45]= ode45(F, [0 0.5 1 1.5], val);

hold on
grid on
fplot(f_analitica, [0, 1.5])
scatter(val_x_euler, val_y_euler)
scatter(val_x_heun, val_y_heun)
scatter(val_x_medio, val_y_medio)
scatter(val_x_rk4ord, val_y_rk4ord)
scatter(val_x_ode45, val_y_ode45)
legend('Sol. Analitica', 'Euler', 'Heun', 'Punto Medio', 'RK Orden 4', 'RKF 4/5')