%German Heim
%Ej 2
clear all
close all
clc
format long

syms X1 X2
Fs=[1.38 * X1 + 2.58 * X2 - 0.1; 4.03 * X1 - 5.12 * X2 - 2.3];
Js=jacobian(Fs); %ctes

F=matlabFunction(Fs);
F=@(X) F(X(1), X(2));
% J=@(X) J(X(1), X(2)); J ES CTE

hold on
f1 = ezplot(1.38*X1 + 2.58*X2 - 0.1, [-2 , 2]);
set(f1, 'Color', 'red')
f2 = ezplot(4.03*X1 - 5.12*X2 - 2.3, [-2 , 2]);
set(f2, 'Color', 'blue')

newton_raphson_multivariable_ejercicio_4(F, Js, [0, 0], 1.0e-7, 100)
newton_raphson_multivariable_ejercicio_4(F, Js, [10, 10], 1.0e-7, 100)
newton_raphson_multivariable_ejercicio_4(F, Js, [-10, -10], 1.0e-7, 100)
newton_raphson_multivariable_ejercicio_4(F, Js, [100, 100], 1.0e-7, 100)
newton_raphson_multivariable_ejercicio_4(F, Js, [-100, -100], 1.0e-7, 100)

% 2 para cualquier x0
% En el caso de un sistema lineal, el Jacobiano es constante y no cambia a
% medida que se realizan iteraciones
% por lo que el metodo converge directamente a la solucion