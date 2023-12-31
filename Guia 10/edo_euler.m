function [x, y] = edo_euler(a, b, h, val, F)
%EDO_EULER Resuelve una EDO por el metodo de Euler
%   a es el punto inicial, b el punto final, h el paso, val es el valor
%   de y en a, F es la funcion del ODE del tipo F = @(x, y)
i=1;
x=a;
y=val;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    y(i)=y(i-1)+h*F(x(i-1), y(i-1));
end