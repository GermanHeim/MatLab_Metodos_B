function output = cosaprox(x, k)
% Aproxima el coseno usando un polinomio de Taylor centrado en x=0
% dado un x (donde se quiere aproximar) y un k (numero de terminos (2*k)+1, 
% los k impares se saltean ya que la derivada da 0)
% Ej, para x=1 y k=4 se tiene:
% 1 -1/2! + 1/4! - 1/6! + 1/8!, 2k+1 terminos, los impares dan 0
    output = 0;
    for n = 0:k
        termino = (-1)^n * x^(2*n) / factorial(2*n);
        output = output + termino;
    end
end
