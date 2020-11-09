% Implementa una funci�n que multiplique dos matrices utilizando la 
% multiplicaci�n propia de Matlab y que mida el tiempo de ejecuci�n
% Implementa una funci�n que multiplique dos matrices utilizando el algoritmo 
% tradicional y que mida el tiempo de ejecuci�n

% Crea dos matrices aleatorias, multipl�calas usando ambas funciones y comprueba 
% que el resultado obtenido es el mismo 

% Dibuja una gr�fica en la que se compare el tiempo de ejecuci�n de ambas 
% funciones para matrices de tama�o creciente; el tiempo de ejecuci�n de 
% cada tama�o de matriz debe calcularse como el tiempo medio de diez 
% multiplicaciones para ese tama�o en concreto

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
title("Multiplicaci�n matricial MATLAB vs tradicional");
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
