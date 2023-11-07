function [x, y] = edo_rk4ord(a, b, h, val, F)
%EDO_RK4ORD Resuelve una EDO por el metodo de Runge-Kutta de 4to orden
%   a es el punto inicial, b el punto final, h el paso, val es el valor
%   de y en a, F es la funcion del ODE del tipo F = @(x, y)
i=1;
x=a;
y=val;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    k1 = F(x(i-1), y(i-1));
    k2 = F(x(i-1) + 1/2*h, y(i-1) + 1/2*k1*h);
    k3 = F(x(i-1) + 1/2*h, y(i-1) + 1/2*k2*h);
    k4 = F(x(i-1) + h, y(i-1) + k3*h);
    y(i)=y(i-1) + h/6*(k1+2*k2+2*k3+k4);
end

