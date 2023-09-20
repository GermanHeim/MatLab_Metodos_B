function [B] = JacobianoD(F,X0)
% F es un funcion anonima de @(X) y X0 el valor inicial como vector columna
n=length(X0);
B=zeros(n,n);
Fp=F(X0);

for i=1:n
    for j=1:n
       delta(1:n,1)=0;
       delta(j)=max(0.001.*abs(X0(j)),1.0e-5);
       Fd=F(X0+delta);
       B(i,j)=(Fd(i)-Fp(i))/delta(j);
    end
end