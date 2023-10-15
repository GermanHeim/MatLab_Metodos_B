% Heim German
% Tema 3
% Problema 1

T=[0, 10, 20, 30, 40];
C=[10, 3.68, 1.35, 0.50, 0.18];

%T = 0, dif finita hacia adelante usando 3 puntos, ya que no se da una
%formula que utilice mas puntos, o(h2)
dcdtt_0 = (-C(3)+4*C(2)-3*C(1))/(2*10); % h=10

%  T = 10, se pueden hacer dif finitas hacia adelante de dos puntos o dif
%  finitas centrales de 2 puntos, ambas tienen o(h2), uso centrales
dcdtt_10 = (C(3)-C(1))/(2*10);

% T = 20, dif finitas centrales usando cuatro puntos, o(h4)
dcdtt_20 = (-C(5)+8*C(4)-8*C(2)+C(1))/(12*10);

% T = 30, dif finitas centrales de 2 puntos, o(h2)
dcdtt_30 = (C(5)-C(3))/(2*10);

% T = 40, dif finitas hacia atras de 3 puntos, o(h2)
dcdtt_40 = (3*C(5)-4*C(4)+C(3))/(2*10);

% Inciso C
F=@(t) 10*exp(-0.1*t)-5;
xl=5;
xu=10;
N=100;
tol=1*exp(-3);   % CORRECCION: Mal definido. Se pedia 0.001

raiz = biseccion(F, xl, xu, tol, N);

% CORRECCION:
% Muy bien resuelto. El unico error se puede considerar un malentendido de enunciado, no se descuenta.
% 100 ptos.
