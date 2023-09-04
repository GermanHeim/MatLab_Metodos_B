function output = convergencia_punto_fijo(f, x0)
%CONVERGENCIA_PUNTO_FIJO Dada una FUNCION DE PUNTO FIJO, devuelve si la
%mimsa diverge o no
%   f es una funcion simbolica de X, x0 el punto de centro del metodo del
%   punto fijo
syms X
f_prima = diff(f, 1);
if abs(subs(f_prima, x0)) < 1
    output=true;
elseif abs(subs(f_prima, x0)) > 1
    output=false;
else
    error('No se puede determinar la convergencia de esa funcion en ese punto')
end

