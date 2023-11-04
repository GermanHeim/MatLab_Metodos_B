F=@(x, y) x * y;
a=0;
val=1;
h=0.1;
b=0.6;

[val_x_euler, val_y_euler]= edo_euler(a, b, h, val, F);
[val_x_heun, val_y_heun]= edo_heun(a, b, h, val, F);
[val_x_medio, val_y_medio]= edo_punto_medio(a, b, h, val, F);
