x = 1900:10:2000;

y = [75.995 91.972 105.711 123.203 131.669 150.697 179.323 203.212 226.505 249.663 281.422];

xinc = 2010;
yvero = 308.745;

ss = linspace(1900,2010);

coeff = polyfit(x,y,1);
values = polyval(coeff,ss);

yerr = values(end);

figure(1)
hold on
whitebg('k')
plot(ss,values,'c',xinc,yvero,'^m',x,y,'oy')
hold off

err = (yvero - yerr );

text = ['L"errore è di ', num2str(err), ' milioni di persone'];
disp(text)