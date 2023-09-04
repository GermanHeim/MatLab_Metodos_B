function output = newton_raphson(f, x0, tol, N)
%NEWTON_RHAPSON Metodo de Newton-Raphson para encontrar raices
%   f es una funcion anonima de x, x0 un punto para centrar, tol la
%   tolerancia porcentual y N el numero maximo de iteraciones
format long
syms x

f_sym = sym(f);
f_derivada = matlabFunction(diff(f_sym, 1)); % Convertimos la simbolica a una anonima
iteracion=0;
xr=x0;
num_auxiliar = 10.0e-10;

while iteracion <= N
    xr_viejo=xr;
    xr=xr-(f(xr)/f_derivada(xr));
    error_aprox_relativo_porcentual = 100 * abs((xr_viejo - xr)/(xr + num_auxiliar));

    if error_aprox_relativo_porcentual < tol
        disp('Raiz encontrada dentro de la torelancia')
        break
    end
end
output=xr;

