function output = hacia_atras(f, c, h)
%HACIA_ATRAS Calcula diferenciacion hacia atras de una funcion
% Parametros: f, una funcion simbolica con X, c su centro, h su paso
% Derivada primera por dif. finitas hacia atras de orden h
format long
syms X
output = (subs(f, c) - subs(f, c-h)) / h;
end