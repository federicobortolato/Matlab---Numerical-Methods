x = [ 1 5 17]
y = [ -2 18 7]
z = polyfit(x,y,2)

a = z(1)
b = z(2)
c = z(3)

X = [1: 0.1 : 20];
interpol = @(x) a.*x.^2 + b.*x + c;
Y =interpol(X);

W = polyval(z,x)     %y valutate



figure(1)
plot(X, Y, '-b')
hold on
plot(x,y, '*m')
plot(x,W, '^k')
hold off

