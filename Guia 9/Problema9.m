% Ej 9
% German Heim
close all
clear all
format long
clc

x=[0 0.75 1.5 2 2.5 3];
y=[2 2.8 2.45 2.2 2.75 2.5];

int_s1_3 = 1/3 * (x(3)-x(1))/2 * (y(1) - 4*y(2) + y(3));
int_s3_8 = 3/8 * (x(6) - x(3))/3 * (y(3) + 3*y(4) + 3*y(5) + y(6));

int_total = int_s1_3 + int_s3_8;

f_prima_3 = @(x) -30.6795 * x + 89.979 * x;

error_s1_3 = -1/90 * ((x(3)-x(1))/2)^5 * (f_prima_3(x(3))-f_prima_3(x(1)))/(x(3)-x(1));
error_s3_8 = -3/80 * ((x(6)-x(3))/3)^5 * (f_prima_3(x(6))-f_prima_3(x(3)))/(x(6)-x(3));

error_aprox_tot = error_s1_3 + error_s3_8;

f_prima_4 = @(x) -61.359*x + 89.979;
hold on
grid on
fplot(f_prima_4, [min(x), max(x)]) % Graficamente, el peor valor se encuentra en x=3

error_cota_s1_3 = -1/90 * ((x(3)-x(1))/2)^5 * f_prima_4(3);
error_cota_s3_8 = -3/80 * ((x(6)-x(3))/3)^5 * f_prima_4(3);

error_cota = max(abs(error_cota_s1_3), abs(error_cota_s3_8));