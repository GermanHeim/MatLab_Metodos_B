function output = resto(f,n,c)
%RESTO Devuelve funcion resto
% R_n = f'(n+1)(epsilon) * (x-c)^(n+1) / factorial(n+1)
% La funcion simbolica es con X mayuscula
syms X
output = diff(f, n+1) * (X-c)^(n+1) / factorial(n+1);
end

