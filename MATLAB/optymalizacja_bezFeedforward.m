clear all
close all

% Optymalizacja nastaw regulator�w w zale�no�ci od r�nych warto�ci
% zadanych.

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3

P3 = 1;
I3 = 0.01;
P4 = 1;

Kr = 1.3;
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
zad = [0];
%%

%Z P4
% X0 = [P1 D1 P2 D2 P3 I3 Kr P4];
% A = -eye(8);
% B = zeros(8,1);
% LB = [0 0 0 0 0 0 0 0];
% UB = [10 10 10 10 100 100 100 100];

X0 = [P3 I3 Kr];
A = -eye(3);
% A(1,1) = 10;
% A(1,5) = -1;
B = zeros(3,1);
LB = [0 0 0];
% UB = [100 100 100 100 100 100 100];
% UB = [10 10 2 10 100 100 100];
UB = [1e5 1e5 1e5];

options = optimoptions('fmincon','Display','iter','MaxIterations',100);
% options = optimoptions(@lsqnonlin,'Algorithm','sqp','Display','iter','MaxIterations',30);

zad = [20];

Parametry = [];
for i = 1:1
    f = inf;
    par = [];
    r = zad(i);
    while (f > 1*0.2*1e5)
    i
    % UB(1) = r*limit2/r;
    [par f] = fmincon(@cel_bezFeedforward, X0, A, B,[],[],LB,UB,[],options)
        if (f > 1*0.2*1e5)
            X0 = rand(1,3);
        end
%     par = fmincon(@cel_P, X0, A, B,[],[],LB,UB,[],options)
%     par = lsqnonlin(@cel, X0,LB,UB,options)
    end

    Parametry(i,:) = par;
end

%%

% index = 2;
% par = Parametry(index,:);
% r = zad(index);
% 
% P1 = par(1);
% D1 = par(2);
% P2 = par(3);
% D2 = par(4);
% P3 = par(5);
% I3 = par(6);
% Kr = par(7);
% % P4 = par(8);
% 
% sim('model2',50)
save('temp_params.mat', 'Parametry');