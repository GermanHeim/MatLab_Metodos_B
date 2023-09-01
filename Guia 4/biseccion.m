function output = biseccion(f, xl, xu, tol, N)
%BISECCION Calcula una raiz por el metodo de la Biseccion
% f es una función anónima, los puntos iniciales (xl y xu), la tolerancia tol y el
% número máximo de iteraciones (N). La función debe arrojar como resultado (parámetro
% de salida) el valor de la raíz obtenido en la última iteración (xk),
% El criterio de convergencia es el de error relativo aproximado porcentual

iteraciones_realizadas = 0;
xr = xu;
num_aux = 1.0e-10;

while iteraciones_realizadas <= N
    disp(['Numero de iteracion: ', num2str(iteraciones_realizadas)]);
    disp([xl, xu])
    xr_viejo = xr;
    xr = (xl+xu)/2;
    iteraciones_realizadas = iteraciones_realizadas + 1;
    if f(xr) ~= 0
        error = 100 * abs((xr-xr_viejo)/(xr+num_aux));
        disp(error)
    else
        output=xr;
        break
    end
    test = f(xl)*f(xr);
    if test < 0
        xu=xr;
    elseif test > 0
        xl=xr;
    else
        error=0;
    end
    if error <= tol
        break
    end
end
output=xr;
disp(output);

