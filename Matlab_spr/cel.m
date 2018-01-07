function wsk = cel( par )
% Funkcja optymalizuj¹ca nastawy regulatora 
   

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3
   P1 = par(1);
   D1 = par(2);
   P2 = par(3);
   D2 = par(4);
   P3 = par(5);
   I3 = par(6);
   Kr = par(7);
   
   opt = simset('SrcWorkspace','Current');
   sim('model',50,opt)
   
   wsk = J;
end
