function [x, y, z] = shooting_edo_euler(a, b, h, yi, yf, F1, F2, error_shooting, est_inicial_1, est_inicial_2)
%SHOOTING_EDO_EULER Resuelve una EDO de cond. de borde por el metodo de Shooting con Euler
%   a es el punto inicial, b el punto final, h el paso, val es el yi
%   de y en a e yf es el valor de y en b, F1 y F2 son la funcion del ODE 
%   del tipo F = @(x, y, z), F1 suele ser z
i=0;
x_shooting=a;
y_shooting=yi;
z_shooting=est_inicial_1;

% Calculamos por shooting cual es el dz/dx que hace que y(b)=yf
while true
    i=i+1;
    if i==1
        j=1;
        while x_shooting(j) < b
            j=j+1;
            x_shooting(j)=x_shooting(j-1)+h;
            y_shooting(j)=y_shooting(j-1)+h*F1(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
            z_shooting(j)=z_shooting(j-1)+h*F2(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
        end
        cb_1=y_shooting(end);

        if abs(y_shooting(end)-yf) <= error_shooting
            disp('Valor de shooting encontrado')
            z_shooting = est_inicial_1;
            break
        end
    end

    if i==2
        z_shooting=est_inicial_2;
        x_shooting=a;
        j=1;
        while x_shooting(j) < b
            j=j+1;
            x_shooting(j)=x_shooting(j-1)+h;
            y_shooting(j)=y_shooting(j-1)+h*F1(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
            z_shooting(j)=z_shooting(j-1)+h*F2(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
        end
        cb_2=y_shooting(end);

        if abs(y_shooting(end)-yf) <= error_shooting
            disp('Valor de shooting encontrado')
            z_shooting = est_inicial_2;
            break
        end
    end

   % Secante
   ci_1 = est_inicial_2;
   ci_2 = est_inicial_1; 
   if i>=3
       while true
            ci = (yf - cb_1)*(ci_1 - ci_2)/(cb_2 - cb_1) + ci_2;
            ci_2 = ci_1;
            ci_1 = ci;
            z_shooting=ci;
            x_shooting=a;
            j=1;
            while x_shooting(j) < b
                j=j+1;
                x_shooting(j)=x_shooting(j-1)+h;
                y_shooting(j)=y_shooting(j-1)+h*F1(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
                z_shooting(j)=z_shooting(j-1)+h*F2(x_shooting(j-1), y_shooting(j-1), z_shooting(j-1));
            end
            cb_1 = cb_2;
            cb_2=y_shooting(end);
    
            if abs(y_shooting(end)-yf) <= error_shooting
                z_shooting = ci;
                disp('Valor de shooting encontrado')
                break
            end
            i=i+1;
       end
       break
   end
end

disp(['Valor: ', num2str(z_shooting)])

% Euler
i=1;
x=a;
y=yi;
z=z_shooting;
while x(i) < b
    i=i+1;
    x(i)=x(i-1)+h;
    y(i)=y(i-1)+h*F1(x(i-1), y(i-1), z(i-1));
    z(i)=z(i-1)+h*F2(x(i-1), y(i-1), z(i-1));
end