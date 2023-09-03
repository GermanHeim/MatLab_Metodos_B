% German Heim
% Ej 3
close all
clear all 
clc

%Inciso B
%Parametros
xl = 12;
xu = 16;
tol = 0.5;
N = 10000;
f = @(c) ((667.38/c)*(1-exp(-0.146843*c))-40);
raiz_f = falsa_posicion(f, xl, xu, tol, N); % xr = 14.7942, 3 iteraciones, 
% 0,0845 error aproximado y relativo porcentual

% Se puede observar que, en este caso, el metodo de regula falsi converge
% en un menor numero de iteraciones, debido a que toma en cuenta
% información de la funcion, asumiendo que la raiz se encuentra mas cerca
% del valor de xl o xu que se encuentre mas proximo a 0

%Inciso C
f_inc_c = @(x) x^10 - 1;
xl_c = 0.5;
xu_c = 1.7;
raiz_c_falsa = falsa_posicion(f_inc_c, xl_c, xu_c, tol, N); % 60 iteraciones
raiz_c_bisec = biseccion(f_inc_c, xl_c, xu_c, tol, N); % 8 iteraciones

%Esto se debe a que, en la funcion x^10 - 1, la raiz no se encuentra
%cercana al punto mas proximo a cero, y se comporta de manera inesperada
%como se puede observar en el siguiente grafico:
fplot(f_inc_c, [xl_c, xu_c]);
