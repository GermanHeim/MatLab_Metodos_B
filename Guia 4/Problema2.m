% German Heim
% Ej 2
close all
clear all 
clc

%Parametros
xl = 12;
xu = 16;
tol = 0.5;
N = 10000;
f = @(c) ((667.38/c)*(1-exp(-0.146843*c))-40);
raiz_f = biseccion(f, xl, xu, tol, N); % xr = 14.8125, 5 iteraciones, 
% 0,4219 error aproximado y relativo porcentual
raiz_f_zero = fzero(f, 14); %(12+16)/2