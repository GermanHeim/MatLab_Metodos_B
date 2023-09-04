function output = secante(f, x0, x_menos1, tol, N)
%SECANTE Aproxima una raiz con el metodo de la secante
%   f funcion anonima, x0 y x_menos1 dos puntos iniciales, tol es la
%   tolerancia y N el numero maximo de iteraciones
format long
valor_verdadero = fzero(f, x0); % Ya que pide error verdadero

raiz=x0;
raiz_vieja_2 = x_menos1;
iteracion=0;
while iteracion <= N
    iteracion = iteracion + 1;

    if iteracion > 1 % Solo puede ser en el segundo loop
        raiz_vieja_2 = raiz_vieja; % Usada como x i-2
    end
    
    raiz_vieja = raiz; % Usada para el error
    raiz = raiz - f(raiz) * (raiz - x_menos1) / (f(raiz) - f(raiz_vieja_2));

    error = abs((raiz - valor_verdadero) / valor_verdadero);
    if error < tol
        disp('Raiz encontrada dentro de la torelancia')
        break
    end
end
output=raiz;

