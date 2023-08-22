function output = funco2(x)
%FUNCO2
output = sin(pi/4) + cos(pi/4) .* (x-pi/4) - sin(pi/4) .* (x-pi/4).^2 / factorial(2);
end

