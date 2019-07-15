

A = [4 0 -1 -2;
    0 -1 -1 -0.5;
    -0.5 -1 3 0;
    -1 -1 0 4];
    
xv = ones(4,1);
b = A*xv;

itmax = 100;
tol = 1e-8;
x0 = zeros(4,1);

[solj, itj, svj,D,N] =  jacobs(A,b,x0,itmax,tol);
[sols, its, svs, m , n] = saidel(A,b,x0,itmax,tol);


figure(1)
whitebg('k')
semilogy(1:itj,svj,'c',1:its,svs,'m')
legend('jacobs')


asintj= svj(2:itj)./svj(1:itj-1);
asints= svs(2:its)./svs(1:its-1);














