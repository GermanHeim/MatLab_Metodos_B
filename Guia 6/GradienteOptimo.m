Max = 0; % -1 para minimo, 0 para maximo
syms x y z
f = 10*x^2 + 5*x*y + 10*(y-3)^2;
grad = gradient(f); % Vector gradiente de la función

X0 = [1,1]; % Punto inicial columna
Tolerancia = 0.01;
MaxIter = 100; % Número de iteraciones máximas
bk = 5; % Límite superior para la búsqueda unidimensional


iter = 1;
do = true;

while do
    x = x0(1);
    y = x0(2);
    Fgrad= [subs(grad(1)), subs(grad(2))]; % Evaluación de el vector gradiente en el punto inicial
    if Max==-1
       Fgrad = -Fgrad; % Si se debe minimizar, entonces se evalua el gradiente negativo 
    end
    if norm(Fgrad) == 0
        do = false;
    else
        g1 = x0(1) + Fgrad(1)*z;
        g2 = x0(2) + Fgrad(2)*z;
        x = g1; 
        y = g2;
        f_sub = subs(f);
        alpha = solve(diff(f_sub), z);
        S = transpose(x0) + (alpha*Fgrad);
        x0 = S;
    end
    iter = iter + 1;
end
x = double(x0(1));
y = double(x0(2));
z = double(subs(f));
disp('Solución:');
disp(['Punto Optimo encontrado en ', num2str(iter), ' Iteraciones:']); 
disp(['X = ', num2str(x)]);
disp(['Y = ', num2str(y)]);
disp(['Valor de la función F.O en el punto: Z = ', num2str(z)]);