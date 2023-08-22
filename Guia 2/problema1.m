% Germán Heim
% Ej 1
close all
clear all
clc

% Generando vectores
x=0:0.01:pi/2;
y0 = funco0(x);
y1 = funco1(x);
y2 = funco2(x);
y3 = funco3(x);
y4 = funco4(x);

hold on
plot(x, y0, 'r');
plot(x, y1, 'b');
plot(x, y2, 'g');
plot(x, y3,'y');
plot(x, y4);
plot(pi/4,sqrt(2)/2, 'x') % Punto en comun
