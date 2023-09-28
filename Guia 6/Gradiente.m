syms x y
F = 10*x^2 + 5*x*y + 10*(y-3)^2;
lambda = 0.1;
VF = inline([diff(F, x); diff(F, y)]); % Gradiente
X = [1, 1]; % Valores iniciales
N = 100; % Numero maximo de iteracines

for i=1:N
    X=X-lambda*VF(X(1), X(2));
end