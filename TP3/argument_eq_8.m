function [poids,argument] = argument_eq_8(mu_test,sigma_test,liste_nvg,F)
    N = size(mu_test,2);
    A = zeros(256,N);
    for indice =1:256
        x = liste_nvg(indice);
        Id = ones(1,N);
        % Construction de la matrice A
        terme_exp_num = (x*Id - mu_test).^2;
        term_exp_denom = -2 * ((sigma_test).^2);
        terme_exp = exp(terme_exp_num ./ term_exp_denom);
        A(indice,1:end) = terme_exp ./ (sqrt(2*pi) * sigma_test);
    end
    % Résolution du système linéaire
    % pour estimer les poids
    poids = A \ F';

    % Recherche de l'argument minimum
    valeur = (F' - A * poids).^2;
    argument = sum(valeur);
end