function [Q R] = Gram_Schmidt(A)
  	
  	%Algoritmul Gram_Schmidt modificat
  	[m n]=size(A);
	Q = A;
	R = zeros(m, n);
	for k = 1 : n
    	R(k,k) = norm(Q(1 : m, k));
		Q(1 : m, k) = Q(1 : m, k) / R(k, k);
		for j = k + 1 : n
			R(k, j) = Q(1 : m, k)' * Q(1 : m, j);
			Q(1 : m, j) = Q(1 : m, j) - Q(1 : m, k) * R(k, j);
	   	endfor
	endfor
endfunction