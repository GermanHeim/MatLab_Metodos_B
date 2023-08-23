% Ej 2
% German Heim
clear all
close all
clc

Va=cosaprox(2*pi, 8);
Vv=cos(2*pi);

error_rel = abs((Va-Vv) / Vv);
error_rel_porcentual = error_rel * 100;

disp(['El error relativo es ', num2str(error_rel), ' y el error porcentual es: ', ...
    num2str(error_rel_porcentual),'%'])

n=20;
for i=0:5:n % NO es necesario que los valores de n se incrementen 1 a 1. En este caso se incrementan de 5 en 5
    disp(['El n es ', num2str(i), ', la aproximación en dicho n es de ', num2str(cosaprox(2*pi, i)), ', y la resta de la aproximacion con el valor verdadero da: ', num2str(cosaprox(2*pi, i) - cos(2*pi))])
end

% Cual es el n necesario para aproximar el cos(2*pi) con un error abs menor
% a 0.1

k=2; % Suponemos que empieza en 2 por que en 0 (o 1), cosaprox es 1 y el error es 0
error_abs=abs(cos(2*pi) - cosaprox(2*pi, k)); 

while error_abs >= 0.1
    k=k+1;
    aprox=cosaprox(2*pi, k);
    error_abs=abs(cos(2*pi) - aprox);
end

disp(['La cantidad de terminos necesarios para que la aprox. tenga un error abs menor a 0.1 es de ', num2str(k)])

hold on
x=0:0.01:3*pi;
y1=cos(x);
for i=1:length(x)
    y2(i)=cosaprox(x(i), k);
end
grid on
plot(x, y1, 'b')
plot(x, y2, 'r')
ylim([-1.05, 5])
xlabel('X')
ylabel('Y')
legend('Coseno', 'Aproximación')

