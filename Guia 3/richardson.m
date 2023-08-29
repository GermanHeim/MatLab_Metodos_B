function output = richardson(D_div_2, D)
%RICHARDSON Hace extrapolación de Richarson
% D_div_2 (D/2), y D son las derivadas que se calculan con centrales
% Devuelve orden h^4
output = 4/3 * D_div_2 - 1/3 * D;
end

