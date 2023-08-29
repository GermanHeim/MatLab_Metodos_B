% German Heim
% Ej 4
clear all
close all
clc
format long

x=[0, 0.625, 2, 3.375, 4];
t=0:0.5:2;

% Inciso A
% La mayor precision seria con extrapolación de Richardson (ya que tenemos h1 y h1/2)
% Tomamos h1 como h=1 y h_div_2=0.5
h1=1;
h_div_2=h1/2;
dif_centrada_h1=(x(5) - x(1))/(2*h1);
dif_centrada_h_div_2=(x(4) - x(2))/(2*h_div_2);
dif_richardson_1 =richardson(dif_centrada_h_div_2, dif_centrada_h1); % Es orden h^4

% Inciso B
% Se puede hacer dif hacia atras de 3 puntos (pero no se encuentra) en el PDF
% por lo que voy a usar dif centrales que tienen el mismo orden de error (h^2)
% Para calcular la SEGUNDA DERIVADA de f
dif_acel_atras_inciso_b = (x(5) - 2*x(4) + x(3)) / (h_div_2^2);

% Inciso C
syms X
f = -X^(3)+ 3*(X)^2;
f_der_vel_t1= subs(diff(f, 1), 1);
f_der_acel_t1_5=subs(diff(f, 2), 1.5);

error_rel_porc_richardson_1 = abs((dif_richardson_1 - f_der_vel_t1)/(f_der_vel_t1)) * 100;
error_rel_porc_acel_1_5 = abs((dif_acel_atras_inciso_b - f_der_acel_t1_5)/(f_der_acel_t1_5)) * 100;
disp(error_rel_porc_richardson_1)
disp(error_rel_porc_acel_1_5) % consultar: es normal que me de 0?