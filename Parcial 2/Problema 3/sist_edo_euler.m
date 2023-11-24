function [x, y1, y2, y3] = sist_edo_euler(a, b, h, F1, F2, F3, y1, y2, y3)
%SIST_EDO_EULER Resuelve el sistema de edo de Euler presentado en la
%consigna
% German Heim
% Tema 2
% Problema 3
% a y b son los valores iniciales y finales de x respectivamente, h es el
% paso, F1, F2, F3, F4 son las EDO, y1... son los valores iniciales

x=a;
i=1;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    y1(i)=y1(i-1)+h*F1(x(i-1), y1(i-1), y2(i-1), y3(i-1));
    y2(i)=y2(i-1)+h*F2(x(i-1), y1(i-1), y2(i-1), y3(i-1));
    y3(i)=y3(i-1)+h*F3(x(i-1), y1(i-1), y2(i-1), y3(i-1));
end

