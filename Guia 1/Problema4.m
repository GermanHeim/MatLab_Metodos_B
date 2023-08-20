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
disp(suma1) % 1.59

for i=n:-1:1
    suma2=chop(suma2+1/i^2, 3);
end
disp(suma2) % 1.64

% Sumando de n=1 a 10000, se suman primero los numeros mas pequeños, lo que
% hace que el redondeo sea mayor a cuando se suman primero los grandes y
% luego los pequeños (usando computación limitada como 3 cifras
% significativas).