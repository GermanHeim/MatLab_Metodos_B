% German Heim
% Ej 5
clear all
close all
clc

x=0:0.1:3.2;
y=func5(x);
y_273=func5(2.73); % y cuando x=2.73
plot(x, y)
disp(y_273)