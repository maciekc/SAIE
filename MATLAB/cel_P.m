function wsk = cel_P( par )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   

global Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3
   P1 = par(1);
   D1 = par(2);
   P2 = par(3);
   D2 = par(4);
   Kr = par(5);
   P4 = par(6);
   
   opt = simset('SrcWorkspace','Current');
   sim('model2',30,opt)
   
   wsk = 1000*J;
end
