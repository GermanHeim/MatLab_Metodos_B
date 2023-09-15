%German Heim
%Ej 6
clear all
close all
clc
format long

x0=[0; 0];

syms X1 X2
Fs=[(X1 - 1)^2 + (X2 - 1)^2 - 1; X1-X2];
 
F=matlabFunction(Fs);
F=@(X) F(X(1), X(2)); % Para poder reemplazar con un vector x0
F2=@(X1, X2) [(X1 - 1)^2 + (X2 - 1)^2 - 1; X1-X2];

newton_raphson_discretizado(F, F2, x0, 0.01, 2)