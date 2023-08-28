% German Heim
% Ej 2
close all
clear all
clc

format long
syms X

%Inciso A
centro=1;
h=0.1;
f=exp(X);
f_der_cent = dif_centrada(f, centro, h);
f_der_del = hacia_delante(f, centro, h);
f_der_atras = hacia_atras(f, centro, h);

f_der_real = subs(f, centro); % Omitimos derivar ya que la derivada de e^t es e^t

error_rel_cent=abs((f_der_cent - f_der_real)/(f_der_real));
error_rel_del=abs((f_der_del - f_der_real)/(f_der_real));
error_rel_atras=abs((f_der_atras - f_der_real)/(f_der_real));

% Inciso B
% La formula de derivadas hacia adelante de orden h^2 se encuentra en el
% powerpoint
f_der_del_ord_hcuadrado=(-subs(f, centro+2*h) + 4*subs(f, centro+h) - 3*subs(f, centro))/(2*h);
error_rel_del_ord_hcuadrado=abs((f_der_del_ord_hcuadrado - f_der_real)/(f_der_real));