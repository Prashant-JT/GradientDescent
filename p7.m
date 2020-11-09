% Dibuja sobre la figura del conjunto de datos la l�nea que representa el
% modelo �ptimo y a�ade una leyenda para explicarla
load('data.mat', '-ascii');

poblacion = data(:, 1);
beneficio = data(:, 2);
scatter(poblacion, beneficio);
axis([0 30 -5 30]);
xlabel("Poblaci�n (decenas de miles)");
ylabel("Beneficio (decenas de miles de euros)");
title("Modelo �ptimo");

hold on
tet0 = -3.63;
tet1 = 1.17;
x = [0:1:30];
y = tet0 + tet1*x;
plot(x,y);
legend('Conjunto de datos','Hip�tesis', 'Location', 'southeast');
hold off