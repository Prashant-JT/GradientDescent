% Implementa el algoritmo de descenso según el gradiente de forma iterativa
% Aplica 1.500 iteraciones con un valor ? = 0’01
% Comprueba que el resultado es tet0=-3’63 y tet1=1’17
load('data.mat', '-ascii');
poblacion = data(:, 1);
beneficio = data(:, 2);
dim = size(data);

tet0 = 0;
tet1 = 0;
alpha = 0.01;
tiempoTotal = 0;

tic
for j=1:10
    tet0 = 0;
    tet1 = 0;
    for i=1:1500
        sum0 = 0;
        sum1 = 0;
        for i=1:dim(1)
            sum0 = sum0 + ((tet0 + tet1*poblacion(i)) - beneficio(i));
            sum1 = sum1 + poblacion(i)*((tet0 + tet1*poblacion(i)) - beneficio(i));
        end
        tet0 = tet0 - (alpha/dim(1))*sum0;
        tet1 = tet1 - (alpha/dim(1))*sum1;
    end
end
t = toc;
tet0
tet1
tiempoTotal = t / 10