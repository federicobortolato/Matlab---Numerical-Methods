function [x,iter,scarti]= steffensen(f,x0,tol,itmax)
%----------------------------------------------------------------
% STEFFENSEN:  calcola una radice della funzione f definita 
% usando il metodo iterativo di Steffensen
% Test di arresto sullo scarto (dif)
%----------------------------------------------------------------
% [x,iter,scarti]=steffensen(f,x0,tol,itmax)
%----------------------------------------------------------------
% parametri di input: 
%        f: funzione della quale si cerca una radice 
%        x0 = approssimazione iniziale
%        tol: tolleranza  
%        itmax: numero massimo di iterazioni 
% parametri di output: 
%        x: vettore delle approssimazione della radice 
%        iter:  numero di iterazioni effettuate
%        scarti: vettore degli scarti successivi
%----------------------------------------------------------------

 xold=x0;
 x=[x0];
 scarti=[];
 dif=tol+1;
 iter=0;
 
 while (abs(dif) > tol) & (iter < itmax)
    
    if abs(f(xold+f(xold))-f(xold)) <= eps 
       disp('ERRORE: CANCELLAZIONE NUMERICA'); return; 
    end
     
    dif = (f(xold).^2)./(f(xold+f(xold))-f(xold));
    xnew = xold - dif ;
      
    iter=iter+1;
    scarti=[scarti;abs(dif)];
    x=[x; xnew];
    xold=xnew;
 end

 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni');
 end