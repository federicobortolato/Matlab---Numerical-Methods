
A = [4 3 0;
    2 3 0.5;
    0 1 2.5];

b = A*ones(3,1);
x0 = zeros(3,1);
tol = 1e-8;
itmax = 200;

[soluz,iterz,scarto_normalizzato] = jacobs(A,b,x0,itmax,tol);

soluz
iterz
ultimo_s = scarto_normalizzato(end)

V = 1:iterz;




[solu,iter,scart] = saidel(A,b,x0,itmax,tol);

v = 1:iter;

solu
iter
ultimo_s2 = scart(end)




figure(1)
hold on
whitebg('k')
plot(V,log10(scarto_normalizzato),'y');
plot(v,log10(scart),'c');
legend('jacobs','saidel')
hold off


