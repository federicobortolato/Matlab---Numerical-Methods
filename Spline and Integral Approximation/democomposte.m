f = @(x) x.^20;

N = [11 51 101 301 501];

start = -1;
finish = 1;
I_vero = 2/21;

TEXT = sprintf('\n\n%17s %18s %21s %8s %10s', 'INTEGRALE', 'ERRORE' , 'ERR_REL', 'N', 'METHOD' );
disp(TEXT)

for k = 1:length(N)
    
[vett_trap, pesi_trap,I_trap] = trapezi_composta(N(k),start,finish,f);

[vett_sim, pesi_sim,I_sim] = simpson_composta(N(k),start,finish,f);

err_trap = I_vero - I_trap;
err_sim = I_vero - I_sim;

err_rel_trap = abs(err_trap)/I_vero*100;
err_rel_sim = abs(err_sim)/I_vero*100;



trap = sprintf('%20.14f %20.14f %20.14f %5d %10s' , I_trap ,err_trap ,err_rel_trap, N(k),'trapezi');
sim =  sprintf('%20.14f %20.14f %20.14f %5d %10s' ,I_sim, err_sim, err_rel_sim, N(k),'simpson');

disp(trap)
disp(sim)

end

DD =  sprintf('\n%20.14f %15s\n\n',I_vero,'<=   I_VERO');
disp(DD)
