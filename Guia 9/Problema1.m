% Ej 1
% German Heim
close all
clear all
format long
clc

pol = @(x) 6 + x + 7.*x.^2 + x.^3 - x.^4;

hold on
grid on
fplot(pol, [0, 3.5])
raiz=fzero(pol, 1);
raiz_2 = raiz/2;
h=raiz_2;

I_simp_1_3 = 1/3 * h * (pol(0) + 4*pol(raiz_2) + pol(raiz));
pol_sym = sym(pol);
f3_pol = matlabFunction(diff(pol_sym, 3));
f3_pol_abs = @(x) abs(x * (-2.4e1)+6);

error_aprox = -1/2880 * (raiz - 0)^5 * (f3_pol(raiz) - f3_pol(0))/(raiz-0);

% Dado que el polinomio es de orden 4, f4 es cte e igual a -24
error_cota = -1/2880 * (raiz - 0)^5 * (-24);

int = integral(pol, 0, raiz);
error_verdadero = abs(int-I_simp_1_3);

% El error de la cota y el error aproximado es el mismo ya que el polinomio
% es de orden 4 y por ende el f'4 es cte.
% Por lo tanto, el error verdadero es igual al valor aproximado y por ende
% el valor de la cota.

x=[0, raiz_2, raiz];
y=[pol(0), pol(raiz_2), pol(raiz)];

coef_interp = polyfit(x, y, length(x)-1);
pol_interp= @(x) coef_interp(1).*x.^2 + coef_interp(2).*x + coef_interp(3);
fplot(pol_interp, [0, raiz])

int_interp = integral(pol_interp, 0, raiz); % Es el mismo resultado que 
% simpsons 1/3 ya que esto es justamente lo que hace simpson 1/3, una
% parabola de interpolacion entre 3 puntos