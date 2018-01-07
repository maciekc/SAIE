clear all
close all

% Optymalizacja nastaw regulatorów w zale¿noœci od ró¿nych wartoœci
% zadanych.

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3

%Wartoœci pocz¹tkowe nastaw regulatorów
P1 = 0.01;
D1 = 0.5;

P2 = 1;
D2 = 0.5;
P3 = 1;
I3 = 0.01;

P4 = 1;

Kr = 1.3;

%Parametry obiektu
Kw1 = 10;

Tw2 = .1;
Kw2 = 5;
To = 1;
Ko = 10;

z1 = 0;
z2 = 0;
r = 10;
tau = 1;
limit1 = 20;
limit3 = 40;
limit2 = 40;

%Wartoœci zadane
zad = [5 10 20 50 70];
%%
%Konfiguracja metody optymalizacji

X0 = [P1 D1 P2 D2 P3 I3 Kr];
A = -eye(7);
B = zeros(7,1);
LB = [0 0 0 0 0 0 0];
UB = [1e5 1e5 1e5 1e5 1e5 1e5 1e5];

options = optimoptions('fmincon','Display','iter','MaxIterations',100);

Parametry = [];

%Optymalizacja

for i = 1:1
    f = inf;
    par = [];
    r = zad(i);
    [par f] = fmincon(@cel, X0, A, B,[],[],LB,UB,[],options)
    while (f > r*0.1)
        X0 = rand(1,7);
        [par f] = fmincon(@cel, X0, A, B,[],[],LB,UB,[],options)
    end

    Parametry(i,:) = par;
end
