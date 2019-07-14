%{
Calcolo Numerico 
Ingegneria Aerospaziale (Canale A)
Prof. L. Bergamaschi  
–  Esercitazione Obbligatoria  –  
AA. 2018–19

FEDERICO BORTOLATO

SCRIPTES1
%}

f = @(x) x.^3 - 4.*x + exp(2.*x);


%   a)  Traccia il grafico della funzione nell'intervallo I = [a,b] = [-3,0]
figure(1)
a=-3;
b=0;
ezplot(f,[a,b]);
assex = @(x) 0;
hold on 
ezplot(assex,[a,b]);
hold off

%   b)  Verifica tramite il teorema degli zeri che esiste una soluzione csi in I = [a,b] 

if f(a).*f(b) <= 0
    statement_1 = ['La funzione verifica il teorema degli zeri! '...
    '=> esiste sicuramente una soluzione in [a,b] = [-3,0]!'];
    disp(statement_1);
else
    statement_2 = ['Purtroppo la funzione NON verifica il teorema degli zeri! '...
    '=> non è detto che esista una soluzione in [a,b] = [-3,0]! '];
    disp(statement_2);
end

%   c)  Approssima csi mediante il metodo di Newton Raphson visualizza: numero di iterazioni,  
%       soluzione finale, la migliore approssimazione della costante asintotica e 
%       una stima dell’errore all’ultima iterazione.

x0NEWT = -2.5;
tolNEWT = 1e-8;
itmaxNEWT = 100;

df = @(x) 3.*x.^2 - 4 + 2.*exp(2.*x);
d2f = @(x) 6.*x + 4.*exp(2.*x);

[xvecNEWT, iterNEWT, scartiNEWT] = newton(f,df,x0NEWT,tolNEWT,itmaxNEWT);



xk = xvecNEWT(end);      % Soluzione approssimata metodo Newton-Raphson
sk = scartiNEWT(end);    % Ultimo scarto metodo Newton-Raphson

Cost_asint_NEWT = 0.5.*abs(d2f(xk)./df(xk));    %Costante asintotica metodo Newton-Raphson
Err_NEWT = Cost_asint_NEWT.*(sk.^2);



vec_print_1 = [iterNEWT, xk, Cost_asint_NEWT, Err_NEWT];

disp('METODO DI NEWTON')
fprintf('\n%20s %19s %22s %15s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica', 'Stima Errore')
fprintf('%12d \t %20.8f \t %18.8f \t %13.4e\r\n \n', vec_print_1)


%   d)  Approssima csi mediante il metodo di Steffensen e visualizza:  numero di iterazioni, 
%       soluzione finale e la migliore approssimazione della costante asintotica.

x0STEFF= -2.2 ;
tolSTEFF = 1e-8;
itmaxSTEFF = 100;

[xvecSTEFF, iterSTEFF, scartiSTEFF] = steffensen(f,x0STEFF,tolSTEFF,itmaxSTEFF);

Sk_piu_uno = scartiSTEFF(end);      % Ultimo scarto metodo Steffensen
Sk = scartiSTEFF(end-1);            % Penultimo scarto metodo Steffensen
valore_quasi_vero = xvecSTEFF(end); % Soluzione approssimata metodo Steffensen


Cost_asint_STEFF = abs(Sk_piu_uno)./(Sk);    %Costante asintotica metodo Steffensen

vec_print_2 = [iterSTEFF, valore_quasi_vero, Cost_asint_STEFF];
disp('METODO DI STEFFENSEN')
fprintf('\n%20s %19s %22s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica')
fprintf('%12d \t %20.8f \t %18.8f\r\n \n', vec_print_2)



  
%   e)  Mediante calcolo della costante asintotica (utilizzando come csi la soluzione con 
%       uno dei due metodi precedenti), verifica la convergenza del metodo della tangente  
%       fissa con punto iniziale x0, quindi approssima csi con tale metodo e visualizza:
%       numero di iterazioni, soluzione finale e lamigliore approssimazione della
%       costante asintotica.


x0TANF     = -2.5;
tolTANF    = 1e-8;
itmaxTANF  = 100; 

%xk è la soluzione approssimata secondo il metodo di Newton-Raphson
%df è la derivata prima

[xvecTANF,iterTANF,scartiTANF,Cost_asint_TANF] = tanfissa(f,df,x0TANF,tolTANF,itmaxTANF,xk);

%{
Sk_piu_uno = scartiTANF(end);      % Ultimo scarto metodo Tanfissa
Sk = scartiTANF(end-1);            % Penultimo scarto metodo Tanfissa
%}

valore_vero_2 = xvecTANF(end);     % Soluzione approssimata metodo Tanfissa

vec_print_2 = [iterSTEFF, valore_vero_2 , Cost_asint_TANF];
disp('METODO DI TANFISSA')
fprintf('\n%20s %19s %22s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica')
fprintf('%12d \t %20.8f \t %18.8f\r\n \n', vec_print_2)

%   f)  Visualizza in un UNICO grafico semilogaritmico il profilo 
%       di convergenza (valore assoluto dello scarto rispetto all’indice di iterazione) 
%       di tutti e tre i metodi. Salva il grafico nel file graficoes1.pdf.


figure(2)
semilogy(1:iterNEWT,abs(scartiNEWT),'mo-')

hold on
semilogy(1:iterSTEFF,abs(scartiSTEFF),'b+-')
semilogy(1:iterTANF,abs(scartiTANF),'kv-')
hold off

%       ...salvato a mano tramite matlab



%   g)   Chiami infine la function newton 
%        con punto iniziale x0=?1.123, tol = 10^(?8) e itmax = 100. 
%        Spiegare il risultato ottenuto

x0NEWT2 = -0.123;
tolNEWT2 = 1e-8;
itmaxNEWT2 = 100;


[xvecNEWT2, iterNEWT2, scartiNEWT2] = newton(f,df,x0NEWT2,tolNEWT2,itmaxNEWT2);



xk2 = xvecNEWT2(end);      % Soluzione approssimata metodo Newton-Raphson
sk2 = scartiNEWT2(end);    % Ultimo scarto metodo Newton-Raphson

%       f,df,d2f le riprende da sopra

Cost_asint_NEWT2 = 0.5.*abs(d2f(xk2)./df(xk2));    %Costante asintotica metodo Newton-Raphson
Err_NEWT2 = Cost_asint_NEWT2.*(sk2.^2);



vec_print_3 = [iterNEWT2, xk2, Cost_asint_NEWT2, Err_NEWT2];

disp('METODO DI NEWTON')
fprintf('\n%20s %19s %22s %15s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica', 'Stima Errore')
fprintf('%12d \t %20.8f \t %18.8f \t %13.4e\r\n \n', vec_print_3)

figure(3)
semilogy(1:iterNEWT2,abs(scartiNEWT2),'mo-')

%{
Commento alla soluzione del punto g):

Il punto iniziale -come si può osservare nel grafico della figure(1)- si 
trova nei pressi del punto di massimo (locale?) della funzione; nel caso si 
fosse preso proprio il punto di massimo non si avrebbe avuto convergenza poichè 
la tangente sarebbe risultata parallela all'asse delle x, generando l'errore 
connesso alla relativa function. A quanto pare non siamo sulla sommità della curva
e ci troviamo pure nel 'versante' corretto, infatti, nonostante le difficoltà, il
metodo alla fine converge. Altalena 

La stima dell'errore appare alquanto bassa (e improbabile) ma soluzione e 
costante asintotica sono perfettamente coerenti con quanto visto fare dal 
metodo nelle condizioni di cui al punto c).

%}

