function R = Iterative(nume, d, eps)
 matrix = dlmread(nume, ' ', 1, 0);
  [m n] = size(matrix);
  t = m-2;
  matrice_adiacenta = zeros(t,t);
  for i = 1:m-2
    for j = 3:n
      if(matrix(i,j) != 0)
        matrice_adiacenta(i,matrix(i,j)) = 1;
       endif
     endfor
   endfor
for i = 1 : t
  matrice_adiacenta(i,i) = 0;
 endfor
 %matrice_adiacenta
  r = zeros(t,1);
  for i = 1:t
    r(i) = 1/t;
  endfor
  r_nou = zeros(t,1);
  aux = r;
  sum = zeros(t,1);
  for i = 1:t 
    sum(i) = matrix(i,2);
  endfor
  while(norm(r_nou-r) > eps)
        r = aux;
 r_nou = (1-d)/n+d*(matrice_adiacenta'*(r./sum));
      aux = r_nou;
 endwhile
 r
 r_nou
  endfunction;
  