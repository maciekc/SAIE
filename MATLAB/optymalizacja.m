clear all
close all

% Optymalizacja nastaw regulator�w w zale�no�ci od r�nych warto�ci
% zadanych.

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3

P1 = 0.1;
D1 = 0.5;

P2 = 1;
D2 = 0.5;
P3 = 0.2;
I3 = 0.1;

P4 = 1;

Kr = 0.1;
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
%%

X0 = [P1 D1 P2 D2 P3 I3 Kr P4];
% X0 = [P1 D1 P2 D2 P3 I3];
% load('mozebyc.mat');
% X0 = par;
A = -eye(8);
A(1,1) = 1;
A(1,5) = -1;
B = zeros(8,1);
LB = [0 0 0.1 0 0.1 0 0.01 0.1];
UB = [1 100 100 10 10 10 10 10];


options = optimoptions('fmincon','Display','iter','MaxIterations',100);
% options = optimoptions('fmincon','Display','iter','MaxIterations',30);

zad = [5 10 20 50 70];

for i = 1:1
    i
    r = zad(i);
    par = fmincon(@cel, X0, A, B,[],[],LB,UB,[],options)
%     par = fmincon(@cel_P, X0, A, B,[],[],LB,UB,[],options)
%     par = lsqnonlin(@cel, X0,LB,UB,options)
    Parametry(i,:) = par;
end

%%

index = 1;
par = Parametry(index,:);
r = zad(index);

P1 = par(1);
D1 = par(2);
P2 = par(3);
D2 = par(4);
P3 = par(5);
I3 = par(6);
Kr = par(7);
P4 = par(8);


sim('model2',50)
