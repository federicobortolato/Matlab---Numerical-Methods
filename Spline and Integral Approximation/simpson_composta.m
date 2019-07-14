function [xvett,w, I] = simpson_composta(N,a,b,f)

h = (b-a)/(2*N);
x = a:h:b;
hz = 2*h;

w = ones (2*N+1 ,1);
w( 2 : 2 : 2*N) = 4;
w( 3 : 2 : 2*N-1)= 2;
w = w*hz/6;

fx = feval(f,x);
I = w'*fx';
xvett = x;

end