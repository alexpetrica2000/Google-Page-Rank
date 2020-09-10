function [R1 R2] = PageRank(nume, d, eps)
	
	fid = fopen(nume, "r"); %se deschide fisierul de intrare
  	string = nume;
  	string = strcat(string, '.out'); %se formeaza fisierul de iesire
  	fid2 = fopen(string, "w");
  	a = fscanf(fid, "%f", 1); %se citeste numarul de linkuri alese
  	fprintf(fid2, "%d\n\n", a);
  	R1 = Iterative(nume,d,eps); %Se formeaza vectorul de Pagerankuri Iterative
	for i = 1 : a
  		fprintf(fid2, "%f\n", R1(i));
	endfor
	fprintf(fid2, "\n");
  	R1 = Algebraic(nume, d); %Se actualizeaza R1 cu vectorul de PR din Algebraic
	for i = 1 : a
  		fprintf(fid2, "%f\n", R1(i));
  	endfor
 	fprintf(fid2, "\n");
 	matrix = dlmread(nume, ' ', 1, 0); %citim matricea pt a afla valorile val1 si val2
 	val1 = matrix(a + 1,1);
 	val2 = matrix(a + 2,1);
 	fclose(fid);

	R2 = zeros(a, 3); %se formeaza R2 pt cerinta 3
	for i = 1 : a
  		R2(i,3) = R1(i);
  		R2(i,1) = i;
  		R2(i,2) = i;
 	endfor
	for i = 1 : a-1 %se foloseste sortarea prin interschimbare; se schimba atat a 2a coloana cat si a 3a
  		for j = i+1 : a 
   			if(R2(i,3) < R2(j,3))
    			aux = R2(i,3);
			    aux2 = R2(i,2);
			    R2(i,3) = R2(j,3);
			    R2(j,3) = aux;
			    R2(i,2) = R2(j,2);
			    R2(j,2) = aux2;
    		endif
  		endfor
	endfor
	for i = 1 : a
  		R2(i,3) = Apartenenta(R2(i,3), val1, val2); %Se rezolva a 3a cerinta prin algoritmul Apartenenta
 	endfor
	for i = 1 : a %se afiseaza in formatul cerut
  		for j = 1 : 3
      		if( j == 3 )
        		fprintf(fid2, "%f ", R2(i,j));
      		else fprintf(fid2, "%d ", R2(i,j));
        	endif
    		if(j == 3)
     			fprintf(fid2, "\n");
   			endif
   		endfor
 	endfor
    fclose(fid2);
endfunction


	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 