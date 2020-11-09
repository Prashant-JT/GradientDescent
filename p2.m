% Carga el fichero de datos proporcionado
load('data.mat', '-ascii');

% La columna 1 muestra la población de una serie de ciudades (decenas de miles de personas)
% La columna 2 muestra los beneficios de una cadena de tiendas (decenas de miles de euros)
poblacion = data(:, 1);
beneficio = data(:, 2);

% Crea una figura en la que se muestre cada punto del conjunto de datos
scatter(poblacion, beneficio);
axis([0 30 -5 30]);
xlabel("Población (decenas de miles)");
ylabel("Beneficio (decenas de miles de euros)");
title("Conjunto de datos");