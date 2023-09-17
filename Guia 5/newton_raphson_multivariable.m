function output = newton_raphson_multivariable(F, J, x0, tol, N)
%NEWTON_RHAPSON_MULTIVARIABLE Metodo de Newton Rhapson Multivariable
%  F es una matriz funcion handle de una variable X la igual que J, x0 (vect) un vector de puntos
%  iniciales, tol una tolerancia (int), y N un numero maximo de iteraciones
%  (int)
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

    x0=ro+x0;
    F_eval = F(x0);
    if norm(F_eval)<=tol
        disp('Raices encontradas');
        disp(x0);
        disp(['Iteración: ', num2str(iteracion)])
        return
    end
        
end
output=x0;

