function y = Apartenenta(x, val1, val2)
 
  %Conform cerintei, se afla y in functie de apartenenta lui x la unul
  %din cele 3 intervale
  %se asigura continuitatea functiei prin calcularea a si b
	if(x >= 0 && x < val1)
    	y = 0;
	endif
	if( x <= 1 && x > val2)
 		y = 1;
	endif
	if( x >= val1 && x <= val2)
 		a = 1 / (val2 - val1);
  		b = -a * val1;
  		y = a * x + b;
	endif
endfunction

	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
	