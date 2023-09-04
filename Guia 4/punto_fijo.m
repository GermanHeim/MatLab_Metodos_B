function output = punto_fijo(f, x0, tol, N)
%PUNTO_FIJO utiliza el metodo del punto fijo para aproximar una raiz
%   f es una funcion anonima, x0 el punto centrado, N el numero max de
%   iteraciones, tol la toleracion en procentaje
g = @(x) f(x) + x; % Calcula la funcion a la cual se le suma x
iteracion=0;
raiz=g(x0);
num_auxiliar = 1.0e-10;

while iteracion <= N
    iteracion = iteracion + 1;
    raiz_vieja=raiz;
    raiz=g(raiz);
    error_aprox_relativo_porcentual = 100 * abs((raiz_vieja - raiz)/(raiz+num_auxiliar));

    disp(['Iteracion N° ', num2str(iteracion)])
    disp(['Aprox. actual de la raiz: ', num2str(raiz)]);
    disp(['Error aproximado relativo porcentual: ', num2str(error_aprox_relativo_porcentual), '%'])

    if error_aprox_relativo_porcentual < tol
        disp('Raiz encontrada dentro de la torelancia')
        break
    end
    disp(' ')
end
output=raiz;
end

