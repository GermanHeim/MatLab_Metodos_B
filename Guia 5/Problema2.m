%German Heim
%Ej 2
clear all
close all
clc
format long

x0=[0; 0];

syms X1 X2
Fs=[(X1 - 1)^2 + (X2 - 1)^2 - 1; X1-X2];
Js=jacobian(Fs);

F=matlabFunction(Fs);
J=matlabFunction(Js);
F=@(X) F(X(1), X(2)); % Para poder reemplazar con un vector x0
J=@(X) J(X(1), X(2));

hold on
f1 = ezplot((X1 - 1)^2 + (X2 - 1)^2 - 1, [-1 , 2.5]);
set(f1, 'Color', 'red')
f2 = ezplot(X1-X2, [-1 , 2.5]);
set(f2, 'Color', 'blue')

newton_raphson_multivariable(F, J, x0, 0.00001, 100)

% Al utilizar [1; 1] como x0 el J que es [2(x1−1),​ 2(x2−1); 1, −1] se
% convierte en singular (arriba es 0, 0). Es por esto que no se puede
% resolver linsolve(J, -F), es decir no sirven aquellos valores de x1=x2=1,
% ya que hacen que J sea singular