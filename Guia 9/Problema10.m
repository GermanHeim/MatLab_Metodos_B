% Ej 10
% German Heim
close all
clear all
format long
clc

func = @(x) (2.*x + 3./x).^2;
integral_verdadera = integral(func, 1, 2);

% Trapecios
x=[1 2];
y=[func(1) func(2)];
int_trap_h1=trapecios(x, y);

x=[1 1.5 2];
y=[func(1) func(1.5) func(2)];
int_trap_h0_5=trapecios(x, y);

% Cuadratura de Gauss
c0 = 1;
c1 = c0;
x0 = -0.577350269;
x1 = -x0;

func_transformada = @(X) (2*(3/2 + 1/2 .* X + 3/(3/2 + 1/2 .* X)))^2 * 1/2;
% x=3/2 + 1/2*Xd ,dx = 1/2 dXd
int_gauss_2ptos = c0*func_transformada(x0) + c1*func_transformada(x1);

c0=0.5555556;
c1=0.8888889;
c2=c0;
x0=-0.774596669;
x1=0;
x2=-x0;
int_gauss_3ptos = c0*func_transformada(x0)+c1*func_transformada(x1)+c2*func_transformada(x2);