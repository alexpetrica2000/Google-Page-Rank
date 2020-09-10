function R = Iterative(nume, d, eps)
 
 	matrix = dlmread(nume, ' ', 1, 0); %citim matricea
  	[m n] = size(matrix);
  	t = m - 2; 
  	matrice_adiacenta = zeros(t, t); %construim matricea de adiacenta
  	for i = 1 : m-2
    	for j = 3 : n
      		if(matrix(i,j) != 0)
        		matrice_adiacenta(i,matrix(i,j)) = 1; %construim adiacentele
       		endif
     	endfor
   	endfor
	for i = 1 : t
  		matrice_adiacenta(i,i) = 0; %pt coloana principala s-a precizat sa consideram
                               %ca nu este importanta; punem 0
 	endfor
  	r = zeros(t, 1); %construim vectorul de Pagerank initial
  	for i = 1 : t
    	r(i) = 1 / t; %prima iteratie(sau iteratia 0, se distribuie egal)
  	endfor
  	r_nou = zeros(t, 1); %construim celelalte iteratii in acesta
  	aux = r; 
  	sum = zeros(t, 1); %in sum punem nr vecini pt fiecare indice i, adica nr de linkuri 
  	for i = 1 : t 
    	for j = 1 : t
        	sum(i) = sum(i) + matrice_adiacenta(i,j);
     	endfor
  	endfor
  	while(norm(r_nou - r) > eps) %conditia de oprire 
        r = aux;
    	for i = 1 : t
       		r_nou(i) = (1 - d) / t; %construim noul vector de Pagerankuri
       		for j = 1 : t 
         		if (matrice_adiacenta(j,i) != 0) %daca alte linkuri contin link catre
                                          %linkul corespunzator iteratiei i
            		r_nou(i) = r_nou(i) + d * r(j) / sum(j);
           		endif
          	endfor
      	endfor
      	aux = r_nou; %avem nevoie de acest aux pt terminarea while-ului
                   %si inlocuirea la fiecare iteratie a vectorului vechi
 	endwhile
	R = r; %intoarcem rezultatul corect
endfunction;
  
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 