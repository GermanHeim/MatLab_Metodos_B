% German Heim
% Ej 1
close all
clear all
clc

format long
syms X

h=0:0.05:0.2;
centro=0;
f=exp(X);

ycent=[];
ydelante=[];
yatras=[];
for i=1:length(h)
    ycent(i)=dif_centrada(f, centro, h(i));
    ydelante(i)=hacia_delante(f, centro, h(i));
    yatras(i)=hacia_atras(f, centro, h(i));
end

hold on
plot(ycent, h);
plot(ydelante, h);
plot(yatras, h);
legend('Centrada', 'Hacia adelante', 'Hacia atras')
ylabel('Paso h')
xlabel('f prima (0)')
grid on
