x = 1999:2009;
y = [16.390 17.721 15.592 15.052 16.582 18.268 18.781 20.192 18.165 17.255 18.902];

z = reglin(x,y);



xinc = 2010;
yvero = 19.500;

ss = linspace(1999,2010);
pp = polyval(z,ss);


figure(1)
whitebg('k')

plot(ss,pp,'c',xinc,yvero,'^m',x,y,'ow')


err = abs(yvero - pp(end));
errrel = err/yvero*100;

X = ['L"errore assoluto è di ' , num2str(err) , ' L"errore relativo è del ' , num2str(errrel), ' percento'];
disp(X)