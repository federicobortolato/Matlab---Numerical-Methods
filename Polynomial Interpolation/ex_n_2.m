fun = @(x) exp(x);

v0 = [ -2 -1 0 1 3 ];

w0 = fun(v0);

[coeff, vett, valutati] = interpolatore(v0,w0);


errfundata = abs(valutati - exp(vett));

figure(2)
plot(vett,valutati,'b')
hold on 
plot(v0,w0, '^m')
plot(vett, exp(vett), 'k')
plot(vett,errfundata, 'g')
hold off

interpol_fun = @(x) coeff(1).*x^4 + coeff(2).*x.^3 + coeff(3).*x.^2 + coeff(4).*x +coeff(5);

errfun = @(x) abs(fun(x) - interpol_fun(x));

lims = [min(v0), max(v0)];

figure(3)
fplot(errfun,lims,'g')
hold on
fplot(fun,lims,'k')
fplot(interpol_fun,lims,'b')
hold off

figure(4)
fplot(errfun,'g')
hold on
fplot(fun,'k')
fplot(interpol_fun,'b')
fplot(h)
hold off

errore_in_2 = errfun(2)

errmax = exp(2).*interpol_fun(2)./factorial(5)