function [coeff, vett, valutati] = interpolatore(x,y)
lungx = length(x);
lungy = length(y);

if lungy == lungx
    disp('TUTT^APPOST')   
else 
    error('QUI ABBIAM FATTO I FURBETTI EH?! CONTROLLA I VETTORI!')
   
end

coeff = polyfit(x,y, lungx-1);

a = min(x);
b = max(x);

vett = [a : 0.1 : b];

valutati = polyval(coeff, vett);

figure(1)
plot(vett,valutati, 'b')
hold on 

plot(x,y, '^m')
hold off

end

