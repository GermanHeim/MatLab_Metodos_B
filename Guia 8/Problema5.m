% Ej 5
% Germán Heim
close all
clear all
format long
clc

T=[278 288 303 318 333 343 353];
V=[3.63136E-09 3.04217E-09 2.38436E-09 1.91224E-09 1.5644E-09 1.38183E-09 1.22917E-09];

pol_lagrange = matlabFunction(metodo_lagrange(T, V));

V_50 = pol_lagrange(50+273.15);
V_75 = pol_lagrange(75+273.15);