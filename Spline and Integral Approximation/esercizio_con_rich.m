f = @(x) exp(x-2).*sin(sqrt(x));
a = 1;
b = 4;
tol = 1e-14;

TEXT = sprintf('\n\n%-6s %-20s %-11s %-20s %-11s %-20s %-11s', 'N','I_TRAP', 'ERR TRAP' , 'I_SIMP','ERR SIMP' ,'I_RICH','ERR RICH' );
disp(TEXT)

IV = quad(f,a,b,tol);               % i vera
format long
for k = 1:10
    k;
    N = 2^k;

    
    
    [xtrap,ptrap,IT] = trapezi_composta(N,a,b,f);     % i trap
    [xsimp,psimp,IS] = simpson_composta(N,a,b,f);     % i simp
    
    Q1 = IS;
    [xq2,pq2,Q2] = simpson_composta(2*N,a,b,f);
    
    IR = (16*Q2 -Q1)/15;                % i rich

    EKT = abs(IV - IT);
    EKS = abs(IV - IS);
    EKR = abs(IV - IR);
    
    text = sprintf('%-6d %-20.16f %-11.3e %-20.16f %-11.3e %-20.16f %-11.3e', N, IT, EKT,IS,EKS, IR, EKR);
    disp(text)
    
end
