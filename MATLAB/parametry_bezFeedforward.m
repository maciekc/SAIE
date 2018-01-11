clear all
close all

% Optymalizacja nastaw regulator�w w zale�no�ci od r�nych warto�ci
% zadanych.


global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3

%%
%Pocz�tkowe dane do optymalizacji
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
% �eby to dzia�a�o jak nale�y to trzeba zmienia� �adowane parametry, tj.
% dla n = 1 -> load('par_new_1.mat'), n=2 -> load('par_new_2.mat')
% n=3 -> load('par_new_3.mat');
% Nale�y te� podmienia� bloczek obiektu w zale�no�ci od warto�ci
% wsp�czynnika n;
% Ka�dy kolejny wiersz w tabeli Parametry odnosi si� do kolejnych warto��
% zadanych wi�c trzeba zmienia� warto�� index inaczej ca�y czas b�dzie si�
% liczy�o dla tej samej warto�ci zadanej;
% Wykresy b�d� si� zapisywa�y do plik�w automatycznie, legenda: fig1_1_5 to
% pierwszy wykres, dla rz�du 1 i warto�ci zadanej 5;
% W zmiennej res s� przechowywane posortowane dane, kt�re p�niej wystarczy
% tylko wrzuca� do SAIE_nastawy.xml, czyli ctrl+c, ctrl+v

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