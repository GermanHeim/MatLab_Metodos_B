function output = newton_rhapson_multivariable(F, x0, tol, N)
%NEWTON_RHAPSON_MULTIVARIABLE Metodo de Newton Rhapson Multivariable
%  F es un array de celda con funciones anonimas (cell array), x0 (vect) un vector de puntos
%  iniciales, tol una tolerancia (int), y N un numero maximo de iteraciones
%  (int)

syms x [1 length(F)] % Crea x1, x2, x3, etc.
J=[];
iteracion = 0;
F_eval=[];
J_eval=[];

while iteracion <= N
    iteracion=iteracion+1;
    x0 = num2cell(x0); % Convertimos x0 a un array de celdas para evaluar

    for i=1:length(F)
        % disp(i)
        F_eval(i)=F{i}(x0{:});
    end

    for i=1:length(F)
        for j=1:length(F)
            J{i, j}=diff(sym(F{i}), x(j), iteracion); % Jacobiano con las derivadas en array de celdas
            disp(J)
        end
    end

    % Ya tenemos J, necesitos evaluarlo

    ro = linsolve(J_eval, -F_eval);
    x0=ro+x0;

    % Criterio de convergencia va aca
        
end
output=J;

