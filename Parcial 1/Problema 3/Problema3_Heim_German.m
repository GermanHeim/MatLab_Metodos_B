% Heim German
% Tema 3
% Problema 3

a=-11.810;
b=3.8474;
c=2.4177;
d=0.2295;

P = @(x) a*x^3 + b*x^2 + c*x + d;
fplot(P, [0.20, 0.45])
% Se puede observar una funcion que presenta un maximo en, aproximadamente,
% x=0.39 e y=1.057

N=100;
x0=0.35;
x_1=0.3;
tol=0.1; % Porcentual
Foptimizar =@(x) 3*a*x^2 + b*2*x+ c; % Derivada de Pya que queremos el optimo
optimo = secante(Foptimizar, x0, x_1, tol, N);

% El optimo se encuentra en x=0.3915, y el mismo, viendo el grafico, es un
% maximo

