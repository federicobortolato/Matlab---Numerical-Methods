%{
Calcolo Numerico 
Ingegneria Aerospaziale (Canale A)
Prof. L. Bergamaschi  
–  Esercitazione Obbligatoria  –  
AA. 2018–19

FEDERICO BORTOLATO

SCRIPTES2
%}

a = @(x) (x.^3 + (exp(2.*x)))./4;

da = @(x) (3.*x.^2 + 2.*exp(2.*x))./4;

b = @(x) -sqrt(4-(exp(2.*x))./x);

db = @(x) ((exp(2.*x)).*(2.*x-1))./((2.*x.^2).*sqrt(4-(exp(2.*x))./x));





%   a)  Verifica quale dei due metodi iterativi convergono a csi per 
%       ogni scelta del punto iniziale in[?3,?1] (anche graficamente facendo 
%       un plot della derivata delle funzioni g ...nei due casi).


bisexx = @(x) x;
c = [-3:0.1:-1];
ybis = bisexx(c);
ya = a(c);
yb = b(c);
yda = da(c);
ydb = db(c);

figure(1)
plot(c,ybis,'m',c,ya,'b',c,yda,'k');
axis equal

% leggendo il grafico la derivata in csi è parecchio maggiore di 1! => non può convergere!

figure(2)
plot(c,ybis,'m',c,yb,'b',c,ydb,'k');
axis equal

% leggendo il grafico la derivata in csi è leggermente minore di 1! => può convergere!

%   b)  Approssima csi mediante il metodo di punto fisso convergente.  
%       (x0=?2.5,toll =10?12 e itmax = 100) visualizzando:  numero di 
%       iterazioni,  soluzione finale,  la migliore approssimazione 
%       della costante asintotica e una stima dell’errore all’ultima iterazione.

%   La funzione convergente da utilizzare è la seconda, ovvero in questo script b

x0PFISSO = -2.5;
tolPFISSO = 1e-12;
itmaxPFISSO = 100;


[xvecPFISSO,iterPFISSO, scartiPFISSO] = pfisso(b,x0PFISSO,tolPFISSO,itmaxPFISSO);


xk = xvecPFISSO(end);               % Soluzione approssimata metodo pfisso
sk = scartiPFISSO(end);             % Ultimo scarto metodo pfisso
sk_meno_uno = scartiPFISSO(end-1);  % Penultimo scarto metodo pfisso

% poichè db(xk) != 0 allora la costante asintotica può essere definita come
% segue

Cost_asint_PFISSO = abs(db(xk));    %Costante asintotica metodo pfisso



vec_print_2 = [iterPFISSO, xk , Cost_asint_PFISSO];
disp('METODO DI PUNTO FISSO')
fprintf('\n%20s %19s %22s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica')
fprintf('%12d \t %20.8f \t %22.8f\r\n \n', vec_print_2)

%   c)  Approssima csi mediante il metodo di estrapolazione di Aitken applicato 
%       al metodo di punto fisso divergente(x0= 2.5,toll = 10?8 e itmax = 100) 
%       visualizzando: numero di iterazioni, soluzione finale e la 
%       migliore approssimazione della costante asintotica.

%   La funzione non convergente da utilizzare è la prima, ovvero in questo
%   script a

x0AITKEN = -2.5;
tolAITKEN = 1e-8;
itmaxAITKEN = 100;

[xvecAITKEN,iterAITKEN, scartiAITKEN]= aitken(a,x0AITKEN,tolAITKEN,itmaxAITKEN);

xvek = xvecAITKEN(end);             % Soluzione approssimata metodo aitken
zk = scartiAITKEN(end);             % Ultimo scarto metodo aitken
zk_meno_uno = scartiAITKEN(end-1);  % Penultimo scarto metodo aitken
Cost_asint_AITKEN = abs(zk)./(zk_meno_uno);    %Costante asintotica metodo aitken



vec_print_2 = [iterAITKEN, xvek , Cost_asint_AITKEN];
disp('METODO DI AITKEN')
fprintf('\n%20s %19s %22s\n', 'Numero Iterazioni', 'Soluzione Finale', 'Costante Asintotica')
fprintf('%12d \t %20.8f \t %22.8f\r\n \n', vec_print_2)

%   d)  Visualizza  in  un  UNICO  grafico  semilogaritmico  il  profilo  di  
%       convergenza  dientrambi i metodi. Salva il grafico nel file graficoes2.pdf

%       grafico salvato a mano

figure(3)
semilogy(1:iterPFISSO, abs(scartiPFISSO),'m+-', 1:iterAITKEN, abs(scartiAITKEN),'bx-')
