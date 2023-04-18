function f = kaczmarz(p,W,n_boucles)
    n_mesures= size(W,1);
    f = zeros(size(W,2),1);
    Wtransp = W';
    normW = sum(Wtransp.^2);
    for k=1:n_boucles
        for i = 1:n_mesures
            wi =Wtransp(:,i);
            wi = wi';
            nwi = normW(i);
            if nwi ~= 0
                f = f + ((p(i) - wi*f)/(nwi)) *wi';
            end
        end
        
    end
end