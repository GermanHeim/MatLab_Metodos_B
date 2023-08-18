% German Heim
% Ej 4
clear all
close all
clc

n=10000;
suma1=0;
suma2=0;

for i=1:n
    suma1 = chop(suma1+1/i^2, 3);
end
disp(suma1)

for i=n:-1:1
    suma2=chop(suma2+1/i^2, 3);
end
disp(suma2)