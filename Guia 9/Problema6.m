% Ej 6
% German Heim
close all
clear all
format long
clc

funcion = @(x) (3.*x.^5 - 2.*x.^3 + 3.*x-5)/(sqrt(x).^3);

int_matlab = integral(funcion, 1, 4, 'ArrayValued', true);
int_trap = trapecios([1, 4], [funcion(1), funcion(4)]);

intervalos=2;
h=(4-1)/intervalos;
x=[1 1+h 1+2*h];
y=[funcion(x(1)) funcion(x(2)) funcion(x(3))];

int_trap_2_intervalos = trapecios(x, y);

intervalos=4;
h=(4-1)/intervalos;
x=[1 1+h 1+2*h 1+3*h 1+4*h];
y=[funcion(x(1)) funcion(x(2)) funcion(x(3)) funcion(x(4)) funcion(x(5))];
int_trap_4_intervalos = trapecios(x, y);

hold on
grid on
fplot(funcion, [1, 4])

% El error abs disminuye a tomar mas intervalos. Al principio la integral
% es de un valor alto ya que el mismo comete mucho error de exceso, como se
% puede ver en el grafico, la funcion es similar a una exponencial. Esto
% disminuye a aumentar el numero de intervalos