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
% r = 70;
tau = 1;
limit1 = 20;
limit3 = 40;
limit2 = 40;
% zad = [5 10 20 50 70];
zad = [20]

%%
% model do sumulacji - model2.slx
% ¯eby to dzia³a³o jak nale¿y to trzeba zmieniaæ ³adowane parametry, tj.
% dla n = 1 -> load('par_new_1.mat'), n=2 -> load('par_new_2.mat')
% n=3 -> load('par_new_3.mat');
% Nale¿y te¿ podmieniaæ bloczek obiektu w zale¿noœci od wartoœci
% wspó³czynnika n;
% Ka¿dy kolejny wiersz w tabeli Parametry odnosi siê do kolejnych wartoœæ
% zadanych wiêc trzeba zmieniaæ wartoœæ index inaczej ca³y czas bêdzie siê
% liczy³o dla tej samej wartoœci zadanej;
% Wykresy bêd¹ siê zapisywa³y do plików automatycznie, legenda: fig1_1_5 to
% pierwszy wykres, dla rzêdu 1 i wartoœci zadanej 5;
% W zmiennej res s¹ przechowywane posortowane dane, które póŸniej wystarczy
% tylko wrzucaæ do SAIE_nastawy.xml, czyli ctrl+c, ctrl+v

n=2;
load('temp_params.mat');
index = 1;
par = Parametry(index,:);

P3 = par(1);
I3 = par(2);
Kr = par(3);
r = zad(index);
sim('model2bezFeedforward.slx')
res(1)=P3;
res(2)=I3;
res(3)=Kr;
res(4)=J;
toFigure;