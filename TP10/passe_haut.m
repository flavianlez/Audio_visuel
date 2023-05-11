function Y_modifie = passe_haut(Y, valeurs_f, f_coupure)
    Y_modifie = Y;
    Y_modifie(valeurs_f < f_coupure,:) = 0;
end