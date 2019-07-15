function [sol_vett, iter, norm_scarti_vett,E] = sorx(A,b,x0,itmax,tol,omega)
% [sol_vett, iter, norm_scarti_vett,D,N] = sorx(A,b,x0,itmax,tol,omega)

D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);
M = omega*L + D;
N = (1-omega)*D -omega*U;
E = M\N;
xol = x0;
iter = 0;
s = 1;

%optimization trick :)

norm_scarti_vett = ones(itmax,1);


while s>tol && iter < itmax
    xne = E*xol + M\b;
    s = norm(xne - xol);
    
    iter = iter +1;
    norm_scarti_vett(iter) = s;
    xol = xne;
end
sol_vett = xne;

p = iter+1;


for o = iter+1:200
    
    norm_scarti_vett(p) = [];
    
end



end
