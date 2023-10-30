% Ej 4
% German Heim
close all
clear all
format long
clc

pol = @(x) 6 + x + 7.*x.^2 + x.^3 - x.^4;
raiz=fzero(pol, 1);
n=6;
h=(raiz-0)/n;

for i=1:n
    x(i+1)=0+h*i;
end

primer_suma = 0;
segunda_suma = 0;
tercer_suma = 0;

for i=2:3:n-1
    primer_suma = primer_suma + pol(x(i));
end

for j=3:3:n
    segunda_suma = segunda_suma + pol(x(j));
end

for k=4:3:n-2
    tercer_suma = tercer_suma + pol(x(k));
end


I_simp_3_8_comp = 3/8 * (x(7)-x(1))/n * (pol(x(1)) + 3*primer_suma + 3*segunda_suma + 2*tercer_suma + pol(x(7)));

error_aprox = -1/80 * (raiz - 0)^5/n^4 * (-24); %f'4 es cte e igual a -24
error_cota = -1/80 * (raiz - 0)^5/n^4 * (-24); % va a ser igual ya que el peor y unico epsilon es -24

valor_verdadero = integral(pol, 0, raiz);
error_verdadero = valor_verdadero-I_simp_3_8_comp; % es el mismo a error aprox
% ya que es un polinomio de orden 4, por lo que f'4 es cte