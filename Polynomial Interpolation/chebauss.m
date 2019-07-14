function [nodvett] = chebauss(a,b,n)
%{

funzione di chebyshev-gauss

vuole inizio fine e numero nodi
        a      b         n

%}
nodvett = [];
n = n-1;
for k = 0:1:n
    parametro = cos((2*k + 1)/(2*n+2)*pi);
    punto = (a+b)/2 + (b-a)/2*parametro;
    
    nodvett(k+1) = punto;
    
end
return
end

