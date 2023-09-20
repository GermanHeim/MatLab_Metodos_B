[x,y] = meshgrid(linspace(0,1,100));

rest1 = y - 2.*x <=0;
rest2 = x -2.*y - 5 <= 0;
rest3 = 2 -1/2 .* x - y <= 0;
rest4 = -3 -1/5 .* x + y <= 0;
rest5 = 0 <= x <= 6;
rest6 = 0 <= y <= 5;

x(~rest1) = NaN;
y(~rest1) = NaN;
x(~rest2) = NaN;
y(~rest2) = NaN;
% x(~rest3) = NaN;
% y(~rest3) = NaN;
x(~rest4) = NaN;
y(~rest4) = NaN;
x(~rest5) = NaN;
y(~rest5) = NaN;
x(~rest6) = NaN;
y(~rest6) = NaN;

f = x+y;
surf(x,y,f)