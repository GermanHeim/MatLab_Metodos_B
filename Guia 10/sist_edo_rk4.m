function [x, y1, y2] = sist_edo_rk4(F1, F2, val_1, val_2, h, a, b)
%SIST_EDO_RK4 Resuelve un sist. de EDO de 2 variables por el metodo de
%Runge-Kutta de 4to orden
%   a es el punto inicial, b el punto final, h el paso, val es el valor
%   de y en a, F es la funcion del ODE del tipo F = @(x, y)
i=1;
x=a;
y1=val_1;
y2=val_2;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    k1_1=F1(x(i-1), y1(i-1), y2(i-1));
    k1_2=F2(x(i-1), y1(i-1), y2(i-1));
    k2_1=F1(x(i-1)+1/2*h, y1(i-1)+1/2*k1_1*h, y2(i-1)+1/2*k1_2*h);
    k2_2=F2(x(i-1)+1/2*h, y1(i-1)+1/2*k1_1*h, y2(i-1)+1/2*k1_2*h);
    k3_1=F1(x(i-1)+1/2*h, y1(i-1)+1/2*k2_1*h, y2(i-1)+1/2*k2_2*h);
    k3_2=F2(x(i-1)+1/2*h, y1(i-1)+1/2*k2_1*h, y2(i-1)+1/2*k2_2*h);
    k4_1=F1(x(i-1)+h, y1(i-1)+k3_1*h, y2(i-1)+k3_2*h);
    k4_2=F1(x(i-1)+h, y1(i-1)+k3_1*h, y2(i-1)+k3_2*h);

    y1(i)=y1(i-1) + h/6 * (k1_1 + 2*k2_1 + 2*k3_1 + k4_1);
    y2(i)=y2(i-1) + h/6 * (k1_2 + 2*k2_2 + 2*k3_2 + k4_2);
end