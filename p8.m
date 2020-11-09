% Modifica el programa para que prediga y muestre en la gráfica el beneficio
% que obtendrá la empresa en una ciudad para un determinado valor de
% población introducido por el usuario
% Con una población de 35.000 el beneficio debería ser en torno a 4.500€
% Con una población de 70.000 el beneficio debería ser en torno a 45.000€

load('data.mat', '-ascii');
poblacion = data(:, 1);
beneficio = data(:, 2);
tet0 = -3.63;
tet1 = 1.17;

scatter(poblacion, beneficio);
axis([0 30 -5 30]);
xlabel("Población (decenas de miles)");
ylabel("Beneficio (decenas de miles de euros)");
title("Modelo óptimo");

hold on
x = [0:1:30];
y = tet0 + tet1*x;
plot(x,y);
legend('Conjunto de datos','Hipótesis', 'Location', 'southeast');

while(true)
    hold on
    pob = input("Introduce la población: ");
    pobx = pob / 10000;
    
    % Si se introduce un 0, el programa acaba
    if pobx == 0
        return
    end
    
    % Si se introduce un valor negativo
    while pobx < 0
        pob = input("Valor incorrecto. Introduce la población: ");
    end
   
    poby = tet0 + tet1*pobx;
    plot(pobx,poby, 's', 'LineWidth',2, 'DisplayName', ['Población: ', int2str(pob)]);
    legend show
    axLims = [0 30 -5 30]; %limite de los ejes
    xlim(axLims(1:2)); 
    ylim(axLims(3:4)); 
    point = [pobx,poby];
    plot([point(1), point(1)], [axLims(3), point(2)], 'k--', 'HandleVisibility','off') %vertical 
    plot([axLims(1), point(1)], [point(2), point(2)], 'k--', 'HandleVisibility','off') %horizontal 
    set(gca,'YTick',-5:2:30,'XTick',0:1:30);
    hold off
end