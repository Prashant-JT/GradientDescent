% Implementa una función que multiplique dos matrices utilizando la 
% multiplicación propia de Matlab y que mida el tiempo de ejecución
% Implementa una función que multiplique dos matrices utilizando el algoritmo 
% tradicional y que mida el tiempo de ejecución

% Crea dos matrices aleatorias, multiplícalas usando ambas funciones y comprueba 
% que el resultado obtenido es el mismo 

% Dibuja una gráfica en la que se compare el tiempo de ejecución de ambas 
% funciones para matrices de tamaño creciente; el tiempo de ejecución de 
% cada tamaño de matriz debe calcularse como el tiempo medio de diez 
% multiplicaciones para ese tamaño en concreto

x = [2, 4, 8, 16, 32, 64, 128, 256, 512];
matlabTime = zeros(1,9);
functionTime = zeros(1,9);

for i=1:9
    M = rand(x(i), x(i));
    N = rand(x(i), x(i));
    
    tic;
    for j=1:10
        MporN(M,N);
    end
    t1 = toc;
    matlabTime(i) = t1 / 10;
    
    tic;
    for k=1:10
        MiMporN(M,N);
    end
    t2 = toc;
    functionTime(i) = t2 / 10;
    
end

plot(x, matlabTime, '-', x, functionTime, '-');
title("Multiplicación matricial MATLAB vs tradicional");
legend('MATLAB','Tradicional');
xlabel("Dimensiones de la matriz cuadrada");
ylabel("Tiempo en segundos");
grid on;

function MporN(M,N)
    R = M*N;
end

function MiMporN(M,N)
    dim = size(M);
    C = zeros(dim(1), dim(2));
    for i=1:dim(1)
        for j=1:dim(1)
            for k=1:dim(1)
                C(i,j) = C(i,j) + (M(i,k) * N(k,j));
            end
        end
    end
end
