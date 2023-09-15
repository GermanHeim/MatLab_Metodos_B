function output = newton_raphson_discretizado(F, F2, x0, tol, N)
%NEWTON_RAPHSON_DISCRETIZADO Metodo de Newton Rhapson Multivariable
%discretizado
%  F una matriz function handle de (X), F una matriz function handle de (X1 X2),
%  x0 (vect) un vector de puntos iniciales, tol una tolerancia (int), 
% y N un numero maximo de iteraciones (int)
iteracion = 0;
F_eval=[];
B=[];

while iteracion <= N
    F_eval=F(x0);
    deltax=max(0.01*norm(x0), 1.0e-5);

for i = 1:length(F)
    % Agrega deltax a x0 para evaluar
    x_delta = x0;
    x_delta(i) = x0(i) + deltax;
    disp(x_delta)
    
    % Calcula F perturbado por deltax
    F_deltax = F2(x_delta(1), x_delta(2));
    disp(F_deltax)
    
    % Calcula jacobiano
    B(:, i) = (F_deltax - F(x0(1), x0(2))) / deltax;
    disp(B)
end

end

