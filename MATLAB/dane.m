global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 

P1 = 2;
D1 = 0.5;

P2 = 3;
D2 = 0.5;
P3 = 10;
I3 = 2;

Kr = 3;
Kw1 = 2;

Tw2 = .1;
Kw2 = 3;
To = 2;
Ko = 2;

z1 = 0;
z2 = 0;
r = 3;
tau = 0;
limit1 = 20;
limit2 = 10;

X0 = [P1 D1 P2 D2 P3 I3];
A = -eye(6);
B = zeros(6,1);
options = optimoptions('fmincon','Display','iter','Algorithm','sqp','MaxIterations',100);
% options = optimoptions(@lsqnonlin,'Display','iter');
par = fmincon(@cel, X0, A, B,[],[],[],[],[],options)
% par = lsqnonlin(@cel, X0,[],[],options)
% nastawy po optymalizacji 
% par =
% 
%     0.5278    0.5000    3.0000    0.5000   19.3465         0
P1 = par(1);
D1 = par(2);
P2 = par(3);
D2 = par(4);
P3 = par(5);
I3 = par(6);

sim('model',20)