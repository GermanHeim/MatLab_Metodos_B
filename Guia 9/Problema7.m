% Ej 7
% German Heim
close all
clear all
format long
clc

x=[1 2 2.8 3.5 4 5];
y=[0.5 2 1 2 3 1];

x_mod = [2 2.8 3.5 4 5];
y_mod = [2 1 2 3 1];

int_trapecios_1_int = trapecios([x(2), x(6)], [y(2), y(6)]);
int_trapecios_5_int = trapecios(x_mod, y_mod);

valor_verdadero = 7.0477;
error_1_int = abs(valor_verdadero-int_trapecios_1_int)/valor_verdadero;
error_5_int = abs(valor_verdadero-int_trapecios_5_int)/valor_verdadero;