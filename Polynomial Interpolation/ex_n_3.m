fun = @(x) 1./(1+x.^2);
start = -5;
finish = 5;

num_nodes = [6 8 10 15];
colors = ['c','y','m','g'];
figure(1)
hold on
whitebg('k')
fplot(fun, [start finish],'w');
hold off

figure(2)
hold on
whitebg('k')
fplot(fun, [start finish],'w');
hold off

puntival = linspace(start,finish,100);

for k = 1:4
    
    grade = num_nodes(k);
    
    nodes = linspace(start,finish,grade+1);
    values = fun(nodes);
    coeff = polyfit(nodes,values,grade);
    valutati = polyval(coeff,puntival);
    
    err_1 = abs(fun(puntival)-valutati);
    err_max1 = norm(err_1,inf);
    err_med_1 = sum(err_1)/100;
    battonodes = chebatto(start,finish, grade+1);
    battovalues = fun(battonodes);
    battocoeff = polyfit(battonodes,battovalues,grade);
    battotati = polyval(battocoeff,puntival);
    
    err_2 = abs(fun(puntival) - battotati);
    err_max2 = norm(err_2,inf);
    err_med_2 = sum(err_2)/100;
    
    figure(1)
    hold on
    plot(puntival,valutati,colors(k));
    hold off 
    
    figure(2)
    hold on 
    plot(puntival,battotati,colors(k));
    hold off
    
    figure(k+2)
    hold on
    whitebg('k')
    fplot(fun, [start finish],'w');
    plot(puntival,valutati,'m');
    plot(puntival,battotati,'c');
    plot(puntival,err_1,'y')
    plot(puntival, err_2,'g')
    
    yline(err_med_1, 'c');
    yline(err_med_2, 'm');
    plot(nodes,-0.5,'^w')
    plot(battonodes,-0.2,'ow')
    
    titollo = sprintf('interpol a punti equi vs punti chebatto, pol grad %d', grade);
    title(titollo);
    legend('runge','equi','chebatto','err equi','err cheb','err equi med', 'err cheb med','equinod','chebnod')
    hold off
    
    Y = sprintf('CHEBATTO NODES V 2.0 - Error max == %f (referred to n grade poly: %d)\n',err_max2, grade);
    X = sprintf('EQUI NODES V 1.0 - Error max == %f (referred to n grade poly: %d)\n',err_max1, grade);
    disp(X)
    disp(Y)
    
   
end


sx = nodes;
sy = fun(nodes);
ss = spline(sx,sy,puntival);

vao = fun(puntival);

figure(7)
hold on
whitebg('k')
title('runge vs spline vs interpol')
plot(puntival,vao,'w')
plot(puntival,ss,'m')
plot(puntival,valutati,'c')
plot(puntival,battotati,'y')
legend('runge','spline','equipol','chebapol')
hold off






