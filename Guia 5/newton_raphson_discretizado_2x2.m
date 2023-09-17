function output = newton_raphson_discretizado_2x2(F, f1, f2, x0, tol, N)
%NEWTON_RAPHSON_DISCRETIZADO Metodo de Newton Rhapson Multivariable
%discretizado
% F es una matriz funcion handle
%  f1 es una funcion dependiente de x1 y x2, al igual que f2
%  x0 (vect) un vector de puntos iniciales, tol una tolerancia (int), 
% y N un numero maximo de iteraciones (int). Mirar Problema6.
iteracion = 0;
F_eval=[];
B=[];
deltax=[0; 0];

while iteracion <= N
    iteracion=iteracion+1;
    F_eval=F(x0);

    for i=1:length(x0)
        deltax(i)=max(0.01*abs(x0(i)), 1.0e-5);
    end

    df1dx1 = (f1([deltax(1)+x0(1), x0(2)])-f1([x0(1), x0(2)])) / deltax(1);
    df1dx2 = (f1([x0(1), deltax(2)+x0(2)])-f1([x0(1), x0(2)])) / deltax(2);
    df2dx1 = (f2([deltax(1)+x0(1), x0(2)])-f2([x0(1), x0(2)])) / deltax(1);
    df2dx2 = (f1([x0(1), deltax(2)+x0(2)])-f1([x0(1), x0(2)])) / deltax(2);

    J=[df1dx1, df1dx2; df2dx1 df2dx2];

    ro=linsolve(J, -F_eval);
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
