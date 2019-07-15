A = zeros(5);
for x= 1: (length(diag(A)))
    A(x,x) = 2;
end

for x = 1:(length(diag(A,1)))
    A(x,x+1) = -1;
    A(x+1,x) = -1;
end

xv = ones(5,1);
b = A*xv;
omega = 1.4;
tol = 1e-10;
itmax = 200;
x0 = zeros(5,1);

[solj,itj,svj,d,n] =  jacobs(A,b,x0,itmax,tol);

[sols,its,svs,M,N] = saidel(A,b,x0,itmax,tol);

[solr,itr,svr,E] = sorx(A,b,x0,itmax,tol,omega);

figure(1)
hold on 
whitebg('k')
semilogy(1:itj,log10(svj),'c',1:its,log10(svs),'m',1:itr,log10(svr),'y')
legend('jacobs','saidel','sorx')
hold off


























