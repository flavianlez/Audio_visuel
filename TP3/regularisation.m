function u = regularisation(k_voisins,k1,k2)

    kronk = k1*ones(size(k_voisins)) ~=  k_voisins;
    u = sum(kronk,"all");

end