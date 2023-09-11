%German Heim
%Ej 2
clear all
close all
clc


f1=@(x1, x2) x2^2 -2*x2 + 1 -x1;
f2=@(x1, x2) sqrt(x1) + x2 -5;

% f1=@(x1, x2) (x1 - 1)^2 + (x2 - 1)^2;
% f2=@(x1, x2) x1 - x2;
F = {f1, f2}; % Array de celdas