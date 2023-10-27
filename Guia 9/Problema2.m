% Ej 2
% German Heim
close all
clear all
format long
clc

n=4;
pol = @(x) 6 + x + 7.*x.^2 + x.^3 - x.^4;
raiz=fzero(pol, 1);

h=(raiz-0)/n;
x=0;

for i=1:n % X de intervalos
    x(i+1)=0+h*i;
end

suma_impar = 0;
suma_par = 0;

for j=2:n-1
     if mod(j+1,2) == 0
         suma_par = suma_par + pol(x(j));
     end
end

for i=2:n
     if mod(i+1,2) ~= 0
         suma_impar = suma_impar + pol(x(i));
     end
end

I_simp_1_3_compuesto = 1/3 * h * (pol(x(1)) + 4*suma_impar + 2*suma_par + pol(raiz));

pol_sym = sym(pol);
f3_pol = matlabFunction(diff(pol_sym, 3));
error_aprox = -1/180 * (pol(x(n+1)) - pol(x(1))) * h^4 * (f3_pol(x(n+1))-f3_pol(x(1))) / (x(n+1)-x(1));

%f'4 es cte e igual a -24 en todo x
error_cota = -1/180 * (pol(x(n+1)) - pol(x(1))) * h^4 * (-24);

int = integral(pol, 0, raiz);
error_verdadero = int - I_simp_1_3_compuesto; % Menor al problema A, 
% mayor precision ya que se usa simpson compuesto