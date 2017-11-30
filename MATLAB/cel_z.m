function wsk = cel_z( par )
% Funkcja optymalizuj¹ca nastawy regulatora 
   

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3 P1 D1 P4 I3 P3
   
   P2 = par(1);
   D2 = par(2);
   
   
   opt = simset('SrcWorkspace','Current');
   sim('model2',30,opt)
   
   wsk = 1000*J;
end
