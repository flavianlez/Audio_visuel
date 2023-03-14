function AD = attache_donnees(I,moyennes,variances)
nl= size(I,1);
nc = size(I,2);
k = size(moyennes,2);
AD = zeros(nl,nc,k);
    for i=1:nl
        for j=1:nc
            for l= 1:k
                td = ((I(i,j) - moyennes(l))^2) / ((variances(l))^2);
                AD(i,j,l) = 1/2 * ( log(variances(l)^2) + td);
        end
    end

end