function [x,iter, scarti]= aitken(g,x0,tol,itmax)
% -------------------------------------------------------------------------
% Metodo di Aitken
% [xvec,iter, scarti, asint1] =aitken(g,x0,epsilon,itmax)
% -------- OUTPUT VARIABLES -----------
% scarti: vettore degli scarti (scarti(i) = xk+1 -xk)
% x: vettore contenente le approssimazioni del punto fisso calcolate
% iter: numero di iterazioni 
% -------- INPUT VARIABLES ------------
% g: funzione
% x0: punto iniziale
% tol: tolleranza richiesta per il test sullo scarto
% itmax: numero massimo di iterazioni consentito
% -------------------------------------------------------------------------

xold=x0;
x=[x0];
iter=0;
dif=tol+1;
scarti=[];

while abs(dif)>tol & iter<itmax
     
        
     num = -(g(xold)-xold).^2;
     den =  g(g(xold))-2.*g(xold)+xold;
     dif = num./den;
     xnew   = xold + dif;
     
     x=[x;xnew];
     scarti=[scarti;dif];
     xold=xnew; 
     iter=iter+1;
end


if iter==itmax 
    disp('Raggiunto il massimo numero di iterazioni');
end
