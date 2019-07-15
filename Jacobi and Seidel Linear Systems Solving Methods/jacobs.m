function [sol_vett, iter, norm_scarti_vett,D,N] = jacobs(A,b,x0,itmax,tol)
% [sol_vett, iter, norm_scarti_vett,D,N] = jacobs(A,b,x0,itmax,tol)

D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);
N = -(U+L);

xol = x0;
iter = 0;
s = 1;

%optimization trick :)

norm_scarti_vett = ones(itmax,1);


while s>tol && iter < itmax
    xne = D\N*xol + D\b;
    s = norm(xne - xol);
    
    iter = iter +1;
    norm_scarti_vett(iter) = s;
    xol = xne;
end
sol_vett = xne;

p = iter+1;


for o = iter+1:itmax
    
    norm_scarti_vett(p) = [];
    
end

    

end
