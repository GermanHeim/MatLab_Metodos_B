% Ej 6
% Germán Heim
close all
clear all
format long
clc

T = [320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 320 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380 380];
D = [0.037813 0.86511 1.4235 2.1395 2.5994 3.1807 3.984 5.2682 7.1968 8.5524 9.7932 10.466 10.936 12.266 13.022 14.004 14.683 15.213 15.651 16.026 0.03176 0.68121 1.0638 1.4805 1.7033 1.9367 2.1814 2.4381 2.7075 2.99 3.5947 4.2488 4.9379 7.9963 9.7614 11.608 12.678 13.439 14.034 14.525];
V = [100 105 109 116 123 130 148 169 235 273 327 371 401 500 567 676 768 852 928 1002 117 121 124 128 131 133 137 140 145 150 162 174 188 278 355 467 552 624 695 761];

a = 30;
b = 5;
c = 2;
d = 1;

parametros_iniciales = [a, b, c, d];
mx=@(parametros_iniciales) sum(abs(V-parametros_iniciales(1)-parametros_iniciales(2).*T-parametros_iniciales(3).*D.^2-parametros_iniciales(4).*D.^4).^2);
parametros_finales = fminsearch(mx, parametros_iniciales);

hold on
grid on
scatter(D,V);

for i=1:length(T)
    y(i)=parametros_finales(1)+parametros_finales(2)*T(i)+parametros_finales(3)*D(i)^2+parametros_finales(4)*D(i)^4;
end

scatter(D,y)
legend('Datos experimentales', 'Modelo')
disp(['a: ', num2str(parametros_finales(1)), '. b: ', num2str(parametros_finales(2)), '. c: ', num2str(parametros_finales(3)), '. d: ', num2str(parametros_finales(4))])
