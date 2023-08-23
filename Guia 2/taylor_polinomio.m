function output = taylor_polinomio(f, N, c)
%   TAYLOR
%   Dado una funcion f (dependiente de X) y un orden n, calcula el polinomio de taylor de
%   dicha funcion del dado orden centrada en c
syms X
output = sym(0);
for n=0:N
    df=diff(f, n);
    output = output + subs(df, X, c) * (X-c)^n / factorial(n); 
end
end