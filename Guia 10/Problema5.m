% Ej 5
% German Heim
clear all
close all
clc

F1=@(x, y1, y2) -0.5*y1;
F2=@(x, y1, y2) 4 - 3*y1 -0.1*y2;
val_1=4;
val_2=6;
h=0.5;
a=0;
b=5;

[val_x_euler, val_y1_euler, val_y2_euler] = sist_edo_euler(F1, F2, val_1, val_2, h, a, b);
[val_x_rk4, val_y1_rk4, val_y2_rk4] = sist_edo_rk4(F1, F2, val_1, val_2, h, a, b);