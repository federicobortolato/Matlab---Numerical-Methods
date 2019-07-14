function [L,U] = lugauxx(A)
%[L;U] = lugauss(A)
D = size(A);

A
%i sono le righe
%j sono le colonne

L = ones(D(1),1);
L = diag(L);

for k = 1:D(1)-1
    
    for i = k+1:D(1)
        
        l = A(i,k)/A(k,k);
        L(i,k) = l;
        for j = k:D(2)
            A(i,j) = A(i,j) - l*A(k,j);
        end
    end
end

U = A;

U

L
end

