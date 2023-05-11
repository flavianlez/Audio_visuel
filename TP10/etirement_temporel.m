function Y_modifie = etirement_temporel(y, f_ech,pourcentage)
    n_fenetre = 2048;
    n_decalage = 512;
    Y = TFCT(y,f_ech,n_fenetre,n_decalage,"hann");
    C = 1:pourcentage:size(Y,2);
    phi = angle(Y(:,1));
    for i=1:length(C)
        c = floor(C(i));
        alpha = C(i) - c;
        rho = (1-alpha) * Y(:,c) + alpha * Y(:,c+1);
        Y_modifie(:,i) = rho .* exp(1i * phi);
        dphi = angle(Y(:,c+1)) - angle(Y(:,c));
        phi = phi + dphi;
    end
    Y_modifie = ITFCT(Y_modifie,f_ech,n_decalage,"hann");
end