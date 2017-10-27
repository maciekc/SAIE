function wsk = cel( par )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 
   P1 = par(1);
   D1 = par(2);
   P2 = par(3);
   D2 = par(4);
   P3 = par(5);
   I3 = par(6);
   
   opt = simset('SrcWorkspace','Current');
   sim('model',50,opt)
   
   wsk = 1000*J;
end
