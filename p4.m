% Implementa el cálculo de la función de costo de forma matricial
% Comprueba que el resultado para teta0=0 y teta1=0 es 32’07
% Comprueba que el resultado para teta0=-1 y teta1=2 es 54’24
% Obtén el tiempo de ejecución de este código ejecutándolo 5 veces para
% ambos casos y calculando la media
load('data.mat', '-ascii');
poblacion = data(:, 1);
beneficio = data(:, 2);
dim = size(data);

tiempoMatrical = [0 0];
tiempoTotal = 0;
J = 0;
X = [(ones(dim(1),1)) poblacion];
y = beneficio;
tet = [0; 0];

tic
for k=1:5
    J = 0;
    J = sum(((X*tet)-y).^2);
    J = J / (2*dim(1));
end
t = toc;
J
tiempoMatricial(1) = t / 5;

J = 0;
tet = [-1; 2];
tic
for m=1:5
    J = 0;
    J = sum(((X*tet)-y).^2);
    J = J / (2*dim(1));
end
t = toc;
J
tiempoMatricial(2) = t / 5;
tiempoTotal = tiempoMatricial(1) + tiempoMatricial(2) / 2