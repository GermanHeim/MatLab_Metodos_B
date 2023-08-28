function output = dif_centrada(f, c, h)
%DIF_CENTRADA Calcula diferenciacion centrada de una funcion
% Parametros: f, una funcion simbolica con X, c su centro, h su paso
format long
syms X
output = (subs(f, c+h) - subs(f, c-h)) / (2*h);
end