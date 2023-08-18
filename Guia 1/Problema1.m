% German Heim
% Ej 1
close all
clear all
clc

A=[1 3; 4 7];
b=[3; 4];
rta_inciso_b=A*b;
disp(num2str(rta_inciso_b))

rank(A); % No singular (rank es 2 y es un 2x2 (2 variables))

rta_inciso_f=A\b; % o linsolve(A, b)

% Inciso G
g1 = A * A';
g2 = A^(-1); % inv(A)
g3 = A*A;