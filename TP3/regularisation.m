function u = regularisation(k_voisins,k1,k2)
    u= 0;
    for i=1:size(k_voisins,1)
        for j=1:size(k_voisins,2)
            kronk = k1 ~= k2;
            u = u + 1  - kronk
        end
    end