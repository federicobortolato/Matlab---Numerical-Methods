x = [0 0.06 0.14 0.25 0.31 0.47 0.60];

y = [0 0.08 0.14 0.20 0.23 0.25 0.28];

xinc = 0.7;
yvero = 0.29;

ss = linspace(0,0.7);

coeff1 = polyfit(x,y,1);
values1 = polyval(coeff1,ss);

yerr1 = values1(end);

coeff2=polyfit(x,y,2);
values2 = polyval(coeff2,ss);

yerr2 = values2(end);

%--------------------------------------------------------------------------

coeffpolu = polyfit(x,y,6);
valupolu = polyval(coeffpolu,ss);

yerrpol = valupolu(end);

epol = abs(yvero-yerrpol);
errpol = epol/yvero*100;

%--------------------------------------------------------------------------



figure(1)
hold on
whitebg('k')
plot(ss,values1,'c',xinc,yvero,'^m',x,y,'ow',ss,values2,'y',ss,valupolu,'g')
hold off


e1 = abs(yvero - yerr1);
e2 = abs(yvero - yerr2);

err1 = e1/yvero*100;
err2 = e2/yvero*100;


text = ['L"errore della retta è del ', num2str(err1),'%'];
disp(text)

text1 = ['L"errore della parabola è del ', num2str(err2),'%'];
disp(text1)

text1 = ['L"errore del polu è del ', num2str(errpol),'%'];
disp(text1)

sqr = 0;
sqp = 0;

for k = 1:7
    sqr = sqr + (polyval(coeff1,x(k))-y(k))^2;
    sqp = sqp + (polyval(coeff2,x(k))-y(k))^2;
    
end

text3 = ['sqr =', num2str(sqr)];
text4 = ['sqp =', num2str(sqp)];


disp(text3)
disp(text4)

    





ss = linspace(0,0.9);

coeff1 = polyfit(x,y,1);
values1 = polyval(coeff1,ss);

coeff2=polyfit(x,y,2);
values2 = polyval(coeff2,ss);

%--------------------------------------------------------------------------

coeffpolu = polyfit(x,y,6);
valupolu = polyval(coeffpolu,ss);

yerrpol = valupolu(end);

%--------------------------------------------------------------------------

figure(2)
hold on
whitebg('k')
plot(ss,values1,'c',x,y,'ow',ss,values2,'y',ss,valupolu,'g')
hold off


        
    
    
    
    