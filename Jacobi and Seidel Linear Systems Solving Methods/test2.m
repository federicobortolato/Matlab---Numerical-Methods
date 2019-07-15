
A  = zeros(9);

for x= 1: (length(diag(A)))
    A(x,x) = 4;
end

for x = 1:(length(diag(A,3)))
    A(x,x+3) = -1;
    A(x+3,x) = -1;
end

k=3;
for x  = 0:2
    
    A(1+k*x,2+k*x)= -1;
    A(2+k*x,1+k*x)= -1;
    A(2+k*x,3+k*x)= -1;
    A(3+k*x,2+k*x)= -1;
end

b = ones(9,1);
x0 = zeros(9,1);
tol = 1e-9;
itmax = 200;

[sol,iter,svett,M,N] = jacobs(A,b,x0,itmax,tol);
E = M\N;
ei = eig(E);
rho = max(abs(ei));

Rv = -log10(rho)

p = -log10(tol);
iterss = p/Rv ;
iterss = round(iterss)
iter
