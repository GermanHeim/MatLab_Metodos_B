%German Heim
%Ej 3
clear all
close all
clc
format long

Fs=@(X) [(X(1) - 1)^2 + (X(2) - 1)^2 - 1; X(1)-X(2)];
fsolve(Fs, [0; 0])