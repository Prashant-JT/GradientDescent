% Implementa el algoritmo de descenso según el gradiente de forma matricial
% Aplica 1.500 iteraciones con un valor alpha = 0’01
% Comprueba que el resultado es tet0=-3’63 y tet1=1’17
load('data.mat', '-ascii');
poblacion = data(:, 1);
beneficio = data(:, 2);
dim = size(data);

tet = [0; 0];
alpha = 0.01;
tiempoTotal = 0;
X = [(ones(dim(1),1)) poblacion];
y = beneficio;

tic
for k=1:10
    tet = [0; 0];
    for i=1:1500
        tet = tet - (alpha/dim(1)) .* (X'*((X*tet) - y));
    end
end
t = toc;
tet
tiempoTotal = t / 10