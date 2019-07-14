

x1 = [0 1 4];
x2 = [4 3 0];

y1 = [0 2 4];
y2 = [4 1 0];

t1 = [0 1 2];
t2 = [2 3 4];

ss1 = linspace(0,2); % perchè t va da 0 a due! spline su t => nodi su t!!!
ss2 = linspace(2,4); % perchè intervalli di t sono diversi!!!

xt1 = spline(t1,x1,ss1);
xt2 = spline(t2,x2,ss2);


yt1 = spline(t1,y1,ss1);
yt2 = spline(t2,y2,ss2);

figure(1)
whitebg('k')
hold on 
plot(ss1,xt1,'c',ss2,xt2,'m')
title('xes')
hold off

figure(2)
whitebg('k')
hold on 
plot(ss1,yt1,'c',ss2,yt2,'m')

title('yes')
hold off

figure(3)
whitebg('k')
hold on 
plot(xt1,yt1,'c',xt2,yt2,'m')
plot(x1,y1,'^w', x2,y2,'^w')
title('y(x)')
hold off

% BUONO CAZZO 3 ORE DI PENSAMIENTI FIGA MA E' VENUTO COME DOVEVA VENIRE!


