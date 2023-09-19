%German Heim
%Ejemplo Broyden
clear all
close all
clc
format long

x0=[0; 0];

syms X1 X2
Fs=[(X1 - 1)^2 + (X2 - 1)^2 - 1; X1-X2];

F=matlabFunction(Fs);
J=matlabFunction(jacobian(Fs));
F=@(X) F(X(1), X(2)); % Para poder reemplazar con un vector x0
J=@(X) J(X(1), X(2));

broyden(F, J, x0, 0.05, 50)
broyden_inv(F, J, x0, 0.05, 100)