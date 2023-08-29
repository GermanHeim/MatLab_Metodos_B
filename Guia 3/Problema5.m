% German Heim
% Ej 5
close all
clear all
clc

x=0:0.1:0.4;
T=[15, 10, 5, 3, 1];
Q_x0 = 40;

% Inciso A
% Dado que Q_xi= -k*dt/dx |x=xi
% Necesitamos calcular dt/dx en x=0 para obtener k despejando

% Podemos calcular f' hacia adelante usando 4 puntos, en el PDF aparece
% hasta 2 puntos con orden h^2 asi que usamos eso
% (-f(x i+2) + 4f(xi+1)-3 *f(xi)) / (2h)

h=0.1;
dtdx_x_0 = (-T(3) + 4*T(2) - 3*T(1))/(2*h);

% k = -(Q_xi / dt/dx |x=x1)
k = -(Q_x0 / dtdx_x_0);

% Inciso B
% Para calcular dtdx en x=0.2 podemos hacer extrapolación de Richardson
dtdx_x_0_2 = richardson((T(4) - T(2))/(2*0.1), (T(5) - T(1))/(2*0.2)); % Orden h^4
Q_x_0_2 = -k*dtdx_x_0_2;

% Inciso C
Q_x_verdadero = 30;
error_rel_porcentual = abs((Q_x_0_2 - Q_x_verdadero)/(Q_x_verdadero))*100;