function Mfit = mregress(y, X, betainit)
    function w=u(r)
        c=0.731;
        if (r<=c) && (r>=c)
            w=2;
        elseif r>c
            w=2*c/r;
        else
            w=-2*c/r;
        end    
    end 
    Mfit=betainit;
    sig=1.4286*median(abs(y-X*betainit));
    
    for i=(1:100)
        beta=Mfit;
        R=(y-X*Mfit)./sig;
        W=diag(arrayfun(@u,R));
        Mfit=(X'*W*X)\(X'*W*y);
        if max(abs(beta-Mfit))<0.001
            break
        end
    end
end