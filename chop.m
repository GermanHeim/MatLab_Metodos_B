function X = chop(Xin,n)
% CHOP(X,n) redondea los elementos X con n cifras significativas
X = abs(Xin) + (Xin==0);
[nx,mx] = size(X);
exponent = 1.*((10*ones(nx,mx)).^(floor(log10(X))-n+1));
X = round(X./exponent).*exponent;
X = sign(Xin).*X.*(Xin~=0);
end