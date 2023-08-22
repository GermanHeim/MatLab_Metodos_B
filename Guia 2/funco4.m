function output = funco4(x)
%FUNCO4
output = sin(pi/4) + cos(pi/4) .* (x-pi/4) - sin(pi/4) .* (x-pi/4).^2 / factorial(2) - cos(pi/4).* (x-pi/4).^3 / factorial(3) + sin(pi/4) .* (x-pi/4).^4 / factorial(4);
end
