function B = PR_Inv(A)
  
	[Q R] = Gram_Schmidt(A);
	[n n] = size(A);
	C = eye(n);
	%Se vor calcula N iteratii, pt fiecare vector xi, pentru a asigura 
	%o buna stabilitate numerica
	for i = 1:n
		B(:,i) = SST(R, Q'*C(:,i));
  	endfor

endfunction
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 