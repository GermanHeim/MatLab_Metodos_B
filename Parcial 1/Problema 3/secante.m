function x0 = secante(F, x0, x_1, tol, N)
%SECANTE
% Heim German
% Tema 3
% Problema 3
%   F funcion que se va a buscar la raiz como anonima,
%   x0 es el punto inicial, x_1 es el punto a utilizar en la primer
%   iteracion para dif finitas, tol es la tolerancia, N es el numero max de
%   iteraciones

% usa error aproximado relativo porcentual
iteracion = 0;
x_viejo = x_1;

while iteracion <= N %% MTIB: es valido, aunque podia usar un for
    iteracion = iteracion + 1;
    x_iteracion = x0 - (F(x0)*(x_1-x0))/(F(x_1)-F(x0));
    x_1 = x0;
    x0=x_iteracion;

    if iteracion > 1
        %% MTIB: el error relativo era en X, no en F. Esta linea es peligrosa:
        %% si x0 es raiz --> error de division por cero
        error = abs((F(x0)-F(x_1))/(F(x0)))*100;
        if error < tol
            disp('Raiz encontrada dentro de la tolerancia')
            disp(x0)
            disp(['Se realizaron ', num2str(iteracion), ' iteraciones'])
            break
        end
    end
end
end

