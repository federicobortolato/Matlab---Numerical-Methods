function [x,iter,scarti,M]=tanfissa(f,df,x0,tol,itmax,csi)
%----------------------------------------------------------------
% TANFISSA:  calcola una radice della funzione f definita 
% usando il metodo iterativo di tangente fissa
% Test di arresto sullo scarto (dif)
%----------------------------------------------------------------
% [x,iter,scarti]=tanfissa(f,df,x0,tol,itmax)
%----------------------------------------------------------------
% parametri di input: i
%        f: funzione della quale si cerca una radice 
%        df: derivata prima di f
%        x0 = approssimazione iniziale
%        tol: tolleranza
%        csi: soluzione vera
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
 dfx0 = df(x0);
 
 
 
 
% Condizione convergenza: 
dif_vera = -df(csi)/dfx0;
M = abs(1 + dif_vera);
if  M < 1
    disp('Il metodo di tangente fissa converge!')
else
    disp('Il metodo di tangente fissa NON converge!')
end
    
    
 while (abs(dif) > tol) & (iter < itmax)
 %{   
    % Condizione convergenza: 
    dif_vera = -df(csi)/dfx0
    if abs(1 + dif_vera) < 1
        disp('Il metodo di tangente fissa converge!')
    else
        disp('Il metodo di tangente fissa NON converge!')
        break
    end
 %}     
    dif=-f(xold)/dfx0;
    xnew=xold+dif;
    scarti=[scarti;dif];
    x=[x; xnew];
    xold=xnew;
    iter=iter+1;
    
 end
 if (iter >=itmax)
    disp('raggiunto il numero massimo di iterazioni')
 end