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

% Raiz_b=broyden(F, J, x0, 1.0e-7, 100);
Raiz_binv=broyden_inv(F, J, x0, 0.05, 10);
% disp(Raiz_b)
disp(Raiz_binv)