% Implementa el cálculo de la función de costo de forma iterativa
% Comprueba que el resultado para teta0=0 y teta1=0 es 32’07
% Comprueba que el resultado para teta0=-1 y teta1=2 es 54’24
% Obtén el tiempo de ejecución de este código ejecutándolo 5 veces para
% ambos casos y calculando la media
load('data.mat', '-ascii');
poblacion = data(:, 1);
beneficio = data(:, 2);
dim = size(data);

tiempoIterativo = [0 0];
tiempoTotal = 0;
j = 0;
t0 = 0;
t1 = 0;
tic
for k=1:5
    j = 0;
    for i=1:dim(1)
        j = j + ((t0 + t1*poblacion(i)) - beneficio(i))^2;
    end
    j = j/(2*dim(1));
end
j
t = toc;
tiempoIterativo(1) = t / 5;

t0 = -1;
t1 = 2;
j = 0;
tic
for k=1:5
    j = 0;
    for i=1:dim(1)
        j = j + ((t0 + t1*poblacion(i)) - beneficio(i))^2;
    end
    j = j/(2*dim(1));
end
j
t = toc;
tiempoIterativo(2) = t / 5;
tiempoTotal = tiempoIterativo(1) + tiempoIterativo(2) / 2
