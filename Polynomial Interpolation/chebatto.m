function [nodvett] = chebatto(a,b,n);
%{

funzione di chebyshev-lobatto

vuole inizio fine e numero nodi
        a      b         n

%}
nodvett = [];
n = n-1;
for k = 0:1:n
    parametro = cos(k.*pi./n);
    punto = (a+b)/2 + (b-a)/2*parametro;
    
    
    nodvett(k+1) = punto;
    
end
return
end
