% Heim German
% Tema 2
% Problema 3
format long

F1=@(x, y1, y2, y3) -0.1*x+2*y2;
F2=@(x, y1, y2, y3) 0.1*x-0.5*y1;
F3=@(x, y1, y2, y3) 0.1*x+y2;

h=1;
a=0;
b=5;

val_y1_inicial = 2;
val_y2_inicial = 2;
val_y3_inicial = 0;

[x, y1, y2, y3]=sist_edo_euler(a, b, h, F1, F2, F3, val_y1_inicial, val_y2_inicial, val_y3_inicial);

hold on
grid on

plot(x, y1, 'r')
plot(x, y2, 'r')
plot(x, y3, 'r')

% Inciso c
h=0.1;
[x_incisoc, y1_incisoc, y2_incisoc, y3_incisoc]=sist_edo_euler(a, 5, h, F1, F2, F3, val_y1_inicial, val_y2_inicial, val_y3_inicial);
% No me piden graficar, pero grafic� en el mismo grafico para comparar en
% el inciso

plot(x_incisoc, y1_incisoc)
plot(x_incisoc, y2_incisoc)
plot(x_incisoc, y3_incisoc)
legend('Curva y1', 'Curva y2', 'Curva y3', 'Curva y1, Inciso C', 'Curva y2, Inciso C', 'Curva y3, Inciso C')
% Numericamente, al tomar un paso mas peque�o, se hace una mejor estimacion
% de la funcion de actualizacion, por lo cual, en este caso, y viendo
% graficamente las curvas azules (h=0.1), se observa un mejor resultado


% CORRECCION: Bien resuelto. 100 ptos.
