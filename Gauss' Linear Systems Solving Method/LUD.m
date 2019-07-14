
A = [4 -2 -1 0;-2 4 1 0.5;-1 1 4 1;0 0.5 1 4]

B = [];
for k = 1:4
    
    for j = 1:k
        for i = 1:k
            B(i,j) = A(i,j);
        end
    end
    I = det(B);
    if I == 0
        x = sprintf('ERRORE: MINORE PRINCIPALE K-ESIMO UGUALE A ZERO! K = %d', k);
        error(x); 
    else
        y = sprintf('OK MINORE PRINCIPALE K-ESIMO DIVERSO DA ZERO! K = %d', k);
        disp(y)
       
    end
    B = [];
end

[L,U,P] = lu(A);

X = ones(4,1);
BB = A*X


y = U*X;
bb = P\L*y