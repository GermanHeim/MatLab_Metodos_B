function xr = biseccion(F, xl, xu, tol, N)
%BISECCION
% Heim German
% Tema 3
% Problema 1
%   F funcion anonima a encontrar raiz, xl y xu son los iniciales del
%   rango, tol la toleracion y N numero max de iteraciones
iteracion=0;
xr=xu; %Utilizado en la primer iteracion
while iteracion <= N
    iteracion = iteracion + 1;
    xr_viejo = xr;
    xr=(xl+xu)/2;
    test=F(xl)*F(xr);

    if test < 0
        xu=xr;
    elseif test > 0
        xl=xr;
    else
        disp('Raiz exacta encontrada')
        disp(xr)
        break
    end

    if iteracion > 1
        error = abs(xr - xr_viejo);
        if error < tol
            disp('Raiz encontrada dentro de la tolerancia')
            disp(xr)
            disp(['Se realizaron ', num2str(iteracion), ' iteraciones'])
            break
        end
    end

    disp(['Iteracion ', num2str(iteracion)])
    disp(['La raiz en esta iteracion es de x=', num2str(xr)])
    disp(['Evaulando esta raiz, se obtiene y=', num2str(F(xr))])
    disp(' ')
end
