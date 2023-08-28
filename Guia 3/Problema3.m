% German Heim
% Ej 3
close all
clear all
clc

format long
syms X

f=log(X); % MATLAB usa log como logaritmo de base e (ln)
centro=20;
h=2;

f_der_adel_ord_h = hacia_delante(f, centro, h);
f_der_atras_ord_h = hacia_atras(f, centro, h);
f_der_adel_ord_h2 = (-subs(f, centro+2*h) + 4*subs(f, centro+h) - 3*subs(f, centro))/(2*h);
f_der_atras_ord_h2 = (3*subs(f, centro) - 4*subs(f, centro-h) + subs(f, centro-2*h))/(2*h);
f_der_central_ord_h2 = dif_centrada(f, centro, h);
f_der_central_ord_h4 = (-subs(f, centro+2*h) + 8*subs(f, centro+h) - 8*subs(f, centro-h) + subs(f, centro-2*h))/(12*h);
f_der_real = subs(f, centro); % Omitimos derivar ya que la derivada de e^t es e^t

error_rel_cent_ord_h2=abs((f_der_central_ord_h2 - f_der_real)/(f_der_real));
error_rel_cent_ord_h4=abs((f_der_central_ord_h4 - f_der_real)/(f_der_real));
error_rel_del_ord_h=abs((f_der_adel_ord_h - f_der_real)/(f_der_real));
error_rel_del_ord_h2=abs((f_der_adel_ord_h2 - f_der_real)/(f_der_real));
error_rel_atras_ord_h=abs((f_der_atras_ord_h - f_der_real)/(f_der_real));
error_rel_atras_ord_h2=abs((f_der_atras_ord_h2 - f_der_real)/(f_der_real));