function R = Algebraic(nume, d)
	
	matrix = dlmread(nume, ' ', 1, 0);%citim matricea
  	[m n] = size(matrix);
  	t = m - 2;
  	matrice_adiacenta = zeros(t, t);%construim matricea de adiacenta
  
  	for i = 1 : m-2
    	for j = 3 : n
      		if(matrix(i,j) != 0)
        		matrice_adiacenta(i, matrix(i,j)) = 1;%construim adiacentele
       		endif
     	endfor
   endfor
	for i = 1 : t
  		matrice_adiacenta(i,i) = 0;%pt coloana principala s-a precizat sa consideram
                               	   %ca nu este importanta; punem 0
 	endfor
  	sum = zeros(t, 1);%in sum punem nr vecini pt fiecare indice i
  	for i = 1 : t 
    	for j = 1 : t
        	sum(i) = sum(i) + matrice_adiacenta(i,j);
     	endfor
  	endfor
  	Algebraic_Matrix = zeros(t, t);%construim matricea Algebraic necesara
  	for i = 1 : t
    	for j = 1 : t
      		if(matrice_adiacenta(j,i) != 0)
        		Algebraic_Matrix(i,j) = 1 / sum(j);
        		%daca alte linkuri contin link catre iteratia i, matricea Algebraic
        		%are in pozitia (i,j) 1 / numarul de linkuri continute de respectivele
        		%linkuri j
      		endif
    	endfor
  	endfor
 	a  = zeros(t, 1);
 	a(:) = 1; %vector coloana numai cu 1;
 	R = (PR_Inv(eye(t) - d * Algebraic_Matrix)) * (1 - d) / t * 1*a;
  	%aflarea lui R conform formulei din Resurse, inversa fiind calculata cubehelix
  	%functia PR_Inv ce foloseste GS modificat si SST
endfunction





	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	