function output = taylor_polinomio(f, N, c)
%   TAYLOR
%   Dado una funcion f (dependiente de X) y un orden n, calcula el polinomio de taylor de
%   dicha funcion del dado orden centrada en c.
%   La funcion simbolica es con X mayuscula.
syms X
output = subs(f, c);
for n=1:N
    df=diff(f, n);
    output = output + subs(df, X, c) * (X-c)^n / factorial(n); 
end
end