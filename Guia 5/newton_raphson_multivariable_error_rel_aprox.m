function output = newton_raphson_multivariable_error_rel_aprox(F, J, x0, tol, N)
%NEWTON_RHAPSON_MULTIVARIABLE Metodo de Newton Rhapson Multivariable
%  F es una matriz funcion handle de una variable X la igual que J, x0 (vect) un vector de puntos
%  iniciales, tol una tolerancia (int), y N un numero maximo de iteraciones
%  (int), utiliza error relativo aprox

num_aux = 1.0e-10;
F_eval=[];
J_eval=[];
iteracion = 0;

if size(x0, 2) ~= 1 % Vector columna
    x0=transpose(x0);
end

while iteracion <= N
    iteracion=iteracion+1;
    F_eval = F(x0);
    J_eval = J(x0);
    ro = linsolve(J_eval, -F_eval);

    x0_viejo=x0;
    x0=ro+x0;
    
    if iteracion >= 2
        error_rel_aprox = norm(x0 - x0_viejo) / (norm(x0)+num_aux);
        if error_rel_aprox<=tol
            disp('Raices encontradas');
            disp(x0);
            disp(['Iteración: ', num2str(iteracion)])
            return
        end
    end
        
end
output=x0;

