clc
close all


for k = 1:20
    rng(100*k);
    n = randi(5);
    r = n;
    m = randi(3);
    p = m;
    N = randi([2,5]);
    S = 1:N;    
    L = randi([0,30],N)/10;
    Pi = randi([0,10],N,1);
    p0 = Pi/sum(Pi(:));
    Dim = [n r m p N];
    
    
    for i=1:N
        
        sumLine = 0;
        for j=1:N
            if (j==i)
                continue
            end
            sumLine = sumLine + L(i,j);
        end
        
        L(i,i) = -sumLine;
        
    end
    
    filenameDim = sprintf('Case_%d/Dimensions_n_r_m_p_N.txt', k);
    filenameS = sprintf('Case_%d/S.txt', k);
    filenameL = sprintf('Case_%d/L.txt', k);
    filenamep0 = sprintf('Case_%d/p0.txt', k);
    writematrix(Dim,filenameDim);
    writematrix(S,filenameS);
    writematrix(L,filenameL);
    writematrix(p0,filenamep0);
    for i = 1:N
        rng(50*i);
             
        A = randi(100,n)/100 - 10*eye(n);
        C = randi(4,n,r)/2;
        
        H = randi([9,11],m,n)/10;
        G = diag(diag(randi(20,m,p)/4));
                   
        filenameA = sprintf('C:/Users/vitin/MATLAB Drive/Case_%d/A_%d.txt', k, i);
        filenameC = sprintf('C:/Users/vitin/MATLAB Drive/Case_%d/C_%d.txt', k, i);
        
        filenameH = sprintf('C:/Users/vitin/MATLAB Drive/Case_%d/H_%d.txt', k, i);
        filenameG = sprintf('C:/Users/vitin/MATLAB Drive/Case_%d/G_%d.txt', k, i);
        
        writematrix(A,filenameA);
        writematrix(C,filenameC);
        
        writematrix(H,filenameH);
        writematrix(G,filenameG);
        
    end
     
end
