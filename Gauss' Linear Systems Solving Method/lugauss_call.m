A = [2 1 0; 1 2 1; 0 1 2];

b = [3 4 3];
b = b';

%LU = A
%LUx = b

%Ux = y
%Ly = b

%y = L\b
%x =U\y

[L,U] = lugauxx(A);

y = L\b
x = U\y

xvera = [1 1 1];
xvera = xvera'
