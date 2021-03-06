clear all
close all

% Rysowanie odpowiedzi obiektu dla różnych wartości zadanych
% Model Simulinka - model2.slx
% dane.mat - parametry systemu po optymalizacji bez z1
% dane2.mat - parametry systemu z zakłóceniem z1 1
% dane3.mat - paramtery systemy z zakłóceniem z1 2

%dane6 - do recznej optymalizacji 

load('dane2')

%%

for i=1:1%length(zad)
    r = zad(i);
    par = Parametry(i,:);

    P1 = par(1);
    D1 = par(2);
    P2 = par(3);
    D2 = par(4);
    P3 = par(5);
    I3 = par(6);
    Kr = par(7);
%     P4 = par(8);

    sim('model2_2016a', 50)
    wsp(i) = J;
    figure(i)
    subplot(211)
    plot(y.Time, y.Data,'b')
    grid on
    hold on
    plot(y1.Time, y1.Data, 'g')
    xlabel('czas [s]')
    ylabel('y')
    legend('y + zakłócenia','y')
    subplot(212)
    plot(z1.Time, z1.Data, 'b')
    grid on
    hold on
    plot(z2.Time, z2.Data, 'g')
    xlabel('czas [s]')
    ylabel('zakłócenie')
    legend('z1','z2')
end
wsp