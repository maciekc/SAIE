clear all
close all

% Optymalizacja nastaw regulatorów w zale¿noœci od ró¿nych wartoœci
% zadanych.


global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3

%%
%Pocz¹tkowe dane do optymalizacji
P1 = 0.01;
D1 = 0.5;
P2 = 1;
D2 = 0.5;
P3 = 1;
I3 = 0.01;
P4 = 1;
Kr = 1.3;

%%
%Dane obiektu

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
zad = [5 10 20 50 70];

%%
% model do sumulacji - model2.slx
%nale¿y podmieniaæ bloczek obiektu w zale¿noœci od wartoœci wspó³czynnika n
% W plikach n1_param_v2, n2_param_v2 i n3_param_v2 sa parametry regulatorów
% dla odpowiednio n = 1,2 i 3.
% kolejnoœæ parametrów
% wiersze w tabeli Parametry odnosi siê do kolejnych wartoœæ zadanych
% index = 5;
% par = Parametry(index,:);
% 
% P1 = par(1);
% D1 = par(2);
% P2 = par(3);
% D2 = par(4);
% P3 = par(5);
% I3 = par(6);
% Kr = par(7);
