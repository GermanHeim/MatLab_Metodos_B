function output = hacia_delante(f, c, h)
%HACIA_DELANTE Calcula diferenciacion hacia adeltante de una funcion
% Parametros: f, una funcion simbolica con X, c su centro, h su paso
% Derivada primera por dif. finitas hacia adelante de orden h
format long
syms X
output = (subs(f, c+h) - subs(f, c)) / h;
end