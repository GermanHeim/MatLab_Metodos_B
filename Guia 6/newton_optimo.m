function output = newton_optimo(fprima, fprimasegunda, x0, tol, N, tipo)
%NEWTON_OPTIMO Busca un optimo (maximo o minimo) usando el metodo de Newton
% fprima = F prima, function handle
% fprimasegunda = F prima segunda, function handle
% x0 =  Valor incial para el metodo de NR
% tol = Tolreancia del metodo de NR, int
% N = Numero maximo de iteraciones del metodo de NR, int
% tipo = max o min

% NR
iteracion=0;
xr=x0;
num_auxiliar = 10.0e-10;

while iteracion <= N
    iteracion = iteracion + 1;
    xr_viejo=xr;
    xr=xr-(fprima(xr)/fprimasegunda(xr));
    error_aprox_relativo_porcentual = 100 * abs((xr_viejo - xr)/(xr + num_auxiliar));

    if error_aprox_relativo_porcentual < tol
        disp('Optimo encontrado dentro de la torelancia')
        break
    end
end

if fprimasegunda(xr) > 0 && tipo == "min"
    disp('Minimo encontrado')
    disp(['X = ', num2str(xr)])
elseif fprimasegunda(xr) < 0 && tipo == "max"
    disp('Maximo encontrado')
    disp(['X = ', num2str(xr)])
else
    disp('Se encontro un optimo, pero no del tipo buscado')
end

output=xr;
end

