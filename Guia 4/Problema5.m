% German Heim
% Ej 5
clear all
close all
clc

syms X
f1= -(5*exp(X)+3)^(1/3);
f2=-3/5 * log(X+3);
f3= -(-5*exp(X)+3)/(X^2);
f4= X-0.07*(X^3+5*exp(X)+3);

funciones=[f1, f2, f3, f4];
for i=1:length(funciones)
    if convergencia_punto_fijo(funciones(i), -1.5) == true
        disp(['La funcion N° ', num2str(i), ' converge'])
    elseif convergencia_punto_fijo(funciones(i), -1.5) == false
        disp(['La funcion N° ', num2str(i), ' converge'])
    end
end

% Cuestionable si esto es lo que quiere, o si quieren que pruebe todos los
% x en el rango en vez de solo -1.5