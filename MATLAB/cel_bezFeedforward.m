function wsk = cel_bezFeedforward( par )
% Funkcja optymalizuj¹ca nastawy regulatora 
   

global Kr Kw1 Tw2 Kw2 To Ko z1 z2 r tau limit1 limit2 limit3
   P3 = par(1);
   I3 = par(2);
   Kr = par(3);
%    P4 = par(8);  
   
   opt = simset('SrcWorkspace','Current');
   sim('model2bezFeedforward',50,opt)
   
   wsk = 1000*J;
end
