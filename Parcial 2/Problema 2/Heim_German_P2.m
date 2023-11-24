% Heim German
% Tema 2
% Problema 2
format long

% Inciso A
x=[0, 0.3, 0.6, 0.9 1.0, 1.5, 2.0];
f=@(x) exp(-x^2);
y=[];
for i=1:length(x)
    y(i)=f(x(i));
end

% Inciso B
% Para mayor precision primero usamos Simpson 3/8, luego trapecios y finalmente
% Simpson 1/3, debido a el espaciado de los puntos

Is3_8=3/8 * (x(4)-x(1))/3 *(y(1) + 3*y(2) + 3*y(3) + y(4));
I_trapecios = (x(5)-x(4))*(y(4)+y(5))/2;
Is1_3 = 1/3 * (x(7)-x(5))/2 * (y(5)+4*y(6)+y(7));

I_total = Is3_8 + I_trapecios + Is1_3;

funcion_error_evaluada = I_total * 2/sqrt(pi);
disp(['La funcion error evaluada en x=2 usando simpson y trapecios, da: ' num2str(funcion_error_evaluada)])

% Inciso C
coef_polcubico = polyfit(x, y, 3);
pol = @(x) coef_polcubico(4) + coef_polcubico(3).*x + coef_polcubico(2).*x.^2 + coef_polcubico(1).*x.^3;

% Inciso D
integral_regresion = integral(pol, 0, 2);
funcion_eval_regresion = integral_regresion * 2/sqrt(pi);
disp(['La funcion error evaluada en x=2 usando regresion, da: ' num2str(funcion_eval_regresion)])

% La integral calculada en el inciso B es probablemente mas exacta que la
% calculada en el inciso D, ya que al hacer regresion se esta asumiendo un
% mayor error, ya que se tiene el error del metodo de la integral y el
% error de la propia regresion. Esto no sucede en el caso del inciso B.