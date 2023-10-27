% Ej 3
% German Heim
close all
clear all
format long
clc

pol = @(x) 6 + x + 7.*x.^2 + x.^3 - x.^4;
raiz=fzero(pol, 1);
h=(raiz-0)/3;

for i=1:3
    x(i+1)=0+h*i;
end

I_simp_3_8 = 3/8 * h * (pol(x(1)) + 3*pol(x(2)) + 3*pol(x(3)) + pol(x(4)));

max_f4 = -24; % f'4 es cte e igual a -24
error_cota = -1/6840 * (x(4)-x(1))^5 * max_f4;

% Usando S1/3 y S3/4 combinados (5 intervalos)
h=(raiz-0)/5;
for i=1:5
    x(i+1)=0+h*i;
end

I_simp_1_3_comb = 1/3 * h * (pol(x(1))+4*pol(x(2))+pol(x(3)));
I_simp_3_8_comb = 3/8 * h * (pol(x(3)) + 3*pol(x(4)) + 3*pol(x(5)) + pol(x(6)));

I_total_comb = I_simp_1_3_comb + I_simp_3_8_comb;

error_1_3_cota = -1/90 * h^5 * max_f4;
error_3_8_cota = -3/80 * h^5 * max_f4;

errores=[abs(error_1_3_cota), abs(error_3_8_cota)];
cota_error=max(errores);