% Muestra sobre la representación en forma de superficie tridimensional y la
% representacion en forma de contorno la evolución de la función de costo a
% medida que itera el algoritmo de descenso según el gradiente

load('data.mat', '-ascii');
dim = size(data);
X = [ones(dim(1),1) data(:, 1)];
y = data(:, 2);

valores_theta0 = linspace(-10, 10, 100);
valores_theta1 = linspace(-1, 4, 100);
valores_J = zeros(100,100);
x = [0:1:30];
y1 = x';

for i=1:100
    for j=1:100
        thetas = [valores_theta0(i); valores_theta1(j)];
        valores_J(i,j) = (sum(((X*thetas) - y).^2)) / (2*dim(1));
    end
end

figure(1)
s1 = subplot(1,2,1);
surf(valores_theta1, valores_theta0,valores_J');
xlabel("theta 1");
ylabel("theta 0");
zlabel("J(theta0, theta1)");
light;
lighting gouraud;
camlight left;
material metal;
shading interp;

s2 = subplot(1,2,2);
contour(valores_theta1, valores_theta0, valores_J');
colorbar;
grid on;

% Descenso del gradiente
a = -10;
b = 10;
ran_y = (b-a).*rand(1,1) + a;
a = -1;
b = 4;
ran_x = (b-a).*rand(1,1) + a;

% Empieza por un numero aleatorio
tet = [ran_y; ran_x];
alpha = 0.01;

x_ant = tet(2);
y_ant = tet(1);
z_ant = interp2(valores_theta1, valores_theta0, valores_J', tet(2), tet(1));

j = 0;
for i=1:1500
    tet = tet - (alpha/dim(1)) .* (X'*((X*tet) - y));
    j = j + 1;
    
    if j == 50
        % Superficie
        z = interp2(valores_theta1, valores_theta0, valores_J', tet(2), tet(1));
        
        x_p = [tet(2), x_ant];
        y_p = [tet(1), y_ant];
        z_p = [z, z_ant];
        
        hold(s1, 'on');
        plot3(s1, x_p, y_p, z_p, 'kx-', 'LineWidth', 2);
        pause(1);
        hold(s1, 'off');
        
        x_ant = tet(2);
        y_ant = tet(1);
        z_ant = z;
        
        % Contorno
        hold(s2, 'on');
        plot(s2, x_p, y_p, 'kx-')
        hold(s2, 'off');
        
        j = 0;
    end
    
end
