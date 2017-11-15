function wsk = cel_PD2( par )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3
   P1 = 0.0302;
   D1 = 38.2416;
   
   P3 = 6.716697500934715e-06;
   I3 = 0.0358;
   Kr = 0.3949;

   P2 = par(1);
   D2 = par(2);
   
   opt = simset('SrcWorkspace','Current');
   sim('model',50,opt)
   
   wsk = 1000*J;
end