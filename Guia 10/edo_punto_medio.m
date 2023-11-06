function [x, y] = edo_punto_medio(a, b, h, val, F)
%EDO_PUNTO_MEDIO Resuelve una EDO por el metodo del punto medio
%   a es el punto inicial, b el punto final, h el paso, val es el valor
%   de y en a, F es la funcion del ODE del tipo F = @(x, y)
i=1;
x=a;
y=val;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    xm=x(i-1)+h/2;
    ym=y(i-1)+ h/2*F(x(i-1), y(i-1));
    y(i)=y(i-1)+h*F(xm, ym);
end