clc; clear; close all;

% Definición de la función y su derivada
f = @(x) exp(-x) - x;
df = @(x) -exp(-x) - 1;

tol = 1e-6;
x0 = 0;
max_iter = 100;

%% Método de Punto Fijo
g = @(x) exp(-x);  % Función de iteración para el método de punto fijo
x_old = x0;
for i = 1:max_iter
    x_new = g(x_old);
    if abs(x_new - x_old) < tol
        fprintf('Método de Punto Fijo: Raíz encontrada en x = %.6f en %d iteraciones\n', x_new, i);
        break;
    end
    x_old = x_new;
end
if i == max_iter
    fprintf('Método de Punto Fijo: No se alcanzó la tolerancia en %d iteraciones\n', max_iter);
end

%% Método de Newton-Raphson
x_old = x0;
for i = 1:max_iter
    x_new = x_old - f(x_old) / df(x_old);
    if abs(x_new - x_old) < tol
        fprintf('Método de Newton-Raphson: Raíz encontrada en x = %.6f en %d iteraciones\n', x_new, i);
        break;
    end
    x_old = x_new;
end
if i == max_iter
    fprintf('Método de Newton-Raphson: No se alcanzó la tolerancia en %d iteraciones\n', max_iter);
end
