function [output_x, output_y] = spline_lineal(x, y)
%SPLINE_LINEAL Devuelve los valores de X e Y para un spline lineal
%   X e Y son vectores fila de misma longitud
output_y=[];
output_x = [];
for i=1:length(x)-1
    pendiente = (y(i+1)-y(i))/(x(i+1)-x(i));
    segmento_x = linspace(x(i), x(i+1), 10000);
    segmento_y = pendiente .* (segmento_x - x(i)) + y(i);
    output_x = [output_x, segmento_x];
    output_y = [output_y, segmento_y];
end
end

