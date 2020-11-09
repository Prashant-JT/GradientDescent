% Representa en forma de superficie tridimensional y en forma de contorno el
% valor de la función de costo para los rangos [-10,10] y [-1,4]
% Debido a la forma en que se realiza el mallado es necesario trasponer la
% matriz antes de representarla para que los ejes no salgan girados

load('data.mat', '-ascii');
X = [ones(97,1) data(:, 1)];
y = data(:, 2);

valores_theta0 = linspace(-10, 10, 100);
valores_theta1 = linspace(-1, 4, 100);
valores_J = zeros(100,100);

for i=1:100
    for j=1:100
        thetas = [valores_theta0(i); valores_theta1(j)];
        valores_J(i,j) = (sum(((X*thetas) - y).^2)) / (2*97);
    end
end

figure(1)
subplot(1,2,1);
surf(valores_theta1, valores_theta0,valores_J');
xlabel("theta 1");
ylabel("theta 0");
zlabel("J(theta0, theta1)");
light;
lighting gouraud;
camlight left;
material metal;
shading interp;

subplot(1,2,2);
contour(valores_theta1, valores_theta0,valores_J');
colorbar;
grid on;