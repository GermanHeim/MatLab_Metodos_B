% German Heim
% Ej 4
close all
clear all
clc

f=@(x) exp(-x)-x; % No necesitamos pasar la funcion despejada, por mi funcion es god y la despeja
x0=0;
tol=1.5;
N=1000;

punto_fijo(f, x0, tol, N) % Verbose output