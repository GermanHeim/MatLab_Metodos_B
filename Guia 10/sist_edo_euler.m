function [x, y1, y2] = sist_edo_euler(F1, F2, val_1, val_2, h, a, b)
%SIST_EDO_EULER Resuelve un sist. de EDO de 2 variables por el metodo de Euler
%   a es el punto inicial, b el punto final, h el paso, val es el valor
%   de y en a, F es la funcion del ODE del tipo F = @(x, y)
i=1;
x=a;
y1=val_1;
y2=val_2;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    y1(i)=y1(i-1)+h*F1(x(i-1), y1(i-1), y2(i-1));
    y2(i)=y2(i-1)+h*F2(x(i-1), y1(i-1), y2(i-1));
end