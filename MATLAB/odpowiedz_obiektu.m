clear all
close all

% Rysowanie odpowiedzi obiektu dla ró¿nych wartoœci zadanych
% Model Simulinka - model2.slx
% dane.mat - parametry systemu po optymalizacji

load('dane')

for i=1:length(zad)
    r = zad(i);
    par = Parametry(i,:);

    P1 = par(1);
    D1 = par(2);
    P2 = par(3);
    D2 = par(4);
    P3 = par(5);
    I3 = par(6);
    Kr = par(7);
    P4 = par(8);

    sim('model2', 50)
    wsp(i) = J;
    figure(i)
    subplot(211)
    plot(y.Time, y.Data,'b')
    grid on
    hold on
    plot(y1.Time, y1.Data, 'g')
    xlabel('czas [s]')
    ylabel('y')
    legend('y + zak³ócenia','y')
    subplot(212)
    plot(z1.Time, z1.Data, 'b')
    grid on
    hold on
    plot(z2.Time, z2.Data, 'g')
    xlabel('czas [s]')
    ylabel('zak³ócenie')
    legend('z1','z2')
end
wsp