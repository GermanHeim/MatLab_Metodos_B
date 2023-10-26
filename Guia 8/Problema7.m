% Ej 7
% German Heim
close all
clear all
format long
clc

A=[2.56 1.6 1 0 0 0 0 0 0 0 0 0; ...
    4 2 1 0 0 0 0 0 0 0 0 0; ...
    0 0 0 4 2 1 0 0 0 0 0 0;...
    0 0 0 6.25 2.5 1 0 0 0 0 0 0;...
    0 0 0 0 0 0 6.25 2.5 1 0 0 0;...
    0 0 0 0 0 0 10.24 3.2 1 0 0 0;...
    0 0 0 0 0 0 0 0 0 10.24 3.2 1; ...
    0 0 0 0 0 0 0 0 0 16 4 1;...
    1 0 0 0 0 0 0 0 0 0 0 0;... %Natural
    2*2 1 0 -2*2 -1 0 0 0 0 0 0 0;...
    0 0 0 2*2.5 1 0 -2*2.5 -1 0 0 0 0;...
    0 0 0 0 0 0 2*3.2 1 0 -2*3.2 -1 0];

B=transpose([2 8 8 14 14 15 15 8 0 0 0 0]);
coeficientes = linsolve(A, B);

x=linspace(1.6, 4, 1000);
for i=1:length(x)
    if x(i)<2 && x(i)>1.6
        val_y(i)=coeficientes(1)*x(i)^2 + coeficientes(2)*x(i) + coeficientes(3);
    elseif x(i)<=2.5 && x(i)>2
        val_y(i)=coeficientes(4)*x(i)^2 + coeficientes(5)*x(i) + coeficientes(6);
    elseif x(i)<=3.2 && x(i)>2.5
        val_y(i)=coeficientes(7)*x(i)^2 + coeficientes(8)*x(i) + coeficientes(9);
    elseif x(i)<=4 && x(i)>3.2
        val_y(i)=coeficientes(10)*x(i)^2 + coeficientes(11)*x(i) + coeficientes(12);
    end
end

hold on
grid on
scatter([1.6 2 2.5 3.2 4], [2 8 14 15 8])
plot(x, val_y)
legend('Datos', 'Spline cuadratico')

disp(['Prediccion para x=3.4, y=', num2str(coeficientes(10)*3.4^2 + coeficientes(11)*3.4 + coeficientes(12))])
disp(['Prediccion para x=2.2, y=', num2str(coeficientes(4)*2.2^2 + coeficientes(5)*2.2 + coeficientes(6))])