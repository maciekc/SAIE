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
   P4 = par(8);
   
   opt = simset('SrcWorkspace','Current');
   sim('model2',30,opt)
   
   wsk = 1000*J;
end
