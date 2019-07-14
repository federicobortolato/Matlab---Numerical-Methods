function [z] = reglin(x,y)
%A PARTIRE DA M PUNTI DI COORDINATE X,Y, OTTENGO COEFF A1 E A0 y = a1*x + a0

lg = length(x);

if lg == length(y)
    disp('vettori iniziali ok')
else 
    error('vettori non combacianti')
end


a = lg;
b = 0;
c = 0;
d = 0;
e = 0;

for k=1:lg
    
    b = b + x(k);
    c = c + y(k);
    d = d + x(k)^2;
    e = e + x(k)*y(k);
    
end

a1 = (a*e - b*c)/(a*d -b^2);
a0 = (c-b*a1)/a;

z = [a1,a0];

end

