function output = broyden(F,J,x0, tol, N)
%BROYDEN Metodo resolutivo de Broyden, realiza la primer iteracion
%utilizando Newton-Raphson
%F=Matriz funcion handle de las funciones variable de X
%J=Matriz funcion handle del jacobiano variable de X
%x0=Matriz columna/fila con los valores iniciales
%tol=Toleracion en ... (int)
%N=numero maximo de iteraciones (int)

F_eval=[];
B_eval=[];

if size(x0, 2) ~= 1 % Vector columna
    x0=transpose(x0);
end

%Primer iteracion (NR)
F_eval = F(x0);
B_eval = J(x0);
ro = linsolve(B_eval, -F_eval);

x0_viejo = x0;
x0=ro+x0;
F_eval = F(x0);

iteracion = 1;
while iteracion <= N
    iteracion = iteracion + 1;
    B_eval=B_eval+(F(x0)-F(x0_viejo)-B_eval*ro)*transpose(ro)/(transpose(ro)*ro);
    ro=linsolve(B_eval, -F(x0));
    x0_viejo=x0;
    x0=x0+ro;

    F_eval = F(x0);
    if norm(F_eval)<=tol
        disp('Raices encontradas');
        disp(x0);
        disp(['Iteración: ', num2str(iteracion)])
        break
    end
end
output=x0;

