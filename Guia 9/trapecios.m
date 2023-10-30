function output = trapecios(x, y)
%TRAPECIOS Calcula la integral haciendo trapecios
%   x e y son vectores de misma longitud
output=0;
for i=1:length(x)-1
    output = output + (x(i+1) - x(i)) * (y(i)+y(i+1))/2;
end
end

