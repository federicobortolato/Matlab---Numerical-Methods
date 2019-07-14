
format short
%       a)

A = hilb(8);
err = 1e-12;


A(2,1) = 2*A(1,1);
A(2,2) = 2*A(1,2) -err;

%       b)

xv = ones(8,1);

b = A*xv;

%       c)

[L,U] = lugauxx(A);

y = L\b;
x = U\y;

%       d)

fprintf('USO LUGAUSS\n')
format long
x
format short
%       e)

res_rel = norm(b-A*x)/norm(b);
err_rel = norm(x - xv)/norm(xv);

fprintf('\nERRORE RELATIVO: %6.3e     RESIDUO RELATIVO: %6.3e\n', err_rel, res_rel)

%       f)

[l,u] = lu(A);
%{
allora:

y =L\Pb
x = U\y

%}
Y = l\b;
X = u\y;

fprintf('\nUSO lu\n')
format long
X
format short

%       g)

res_rel_1 = norm(b-A*X)/norm(b);
err_rel_1 = norm(X - xv)/norm(xv);

fprintf('ERRORE RELATIVO: %6.3e     RESIDUO RELATIVO: %6.3e\n', err_rel_1, res_rel_1)






























