
%Ax = b

err = 1e-14;
A = [1 1 -3;2 2-err 4;1 9 4];

xvera = [1 1 1];

xvera = xvera'

b = A*xvera;



[L,U] = lugauxx(A);

% LUx = b

% Ux = y
% Ly = b

y = L\b

x = U\y

res_rel = norm(b - A*x)/norm(b)*100 
err_rel = norm(x - xvera)/norm(xvera)*100 

[l,u] = lu(A);

Y = l\b
X = u\Y

res_rel_mat = norm(b - A*X)/norm(b)
err_rel_mat = norm(X - xvera)/norm(xvera)