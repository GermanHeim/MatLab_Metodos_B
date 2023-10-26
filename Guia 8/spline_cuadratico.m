function output = spline_cuadratico(x, y)
%SPLINE_CUADRATICO Devuelve los valores de Y para un spline cuadratico
%   X e Y son vectores fila de misma longitud
output=[];
ec=[];
for i=1:length(x)-1
    %Ecuaciones
    %a1 b1 c1 a2 b2 c2
    ec=[x(i)^2, x(i), 1, x(i)^2, x(i), 1; ...
        x(1)^2, x(1), 1, x(length(x))^2, x(length(x)), 1
        2*x(i), 1, 0, -2*x(i+1), -1, 0;...

    ];

end

