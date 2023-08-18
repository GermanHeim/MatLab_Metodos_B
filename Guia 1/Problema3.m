% German Heim
% Ej 2
close all
clear all
clc

t=[0:2:20]';
if length(t) == 11
    disp('T tiene 11 elementos')
else
    disp('T NO tiene 11 elementos')
end

g=9.81;
m=68.1;
cd=0.25;

v=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
plot(t,v);
title('t vs v');
xlabel('tiempo');
ylabel('velocidad');
grid;