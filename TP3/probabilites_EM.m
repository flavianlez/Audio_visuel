function probas = probabilites_EM(D_app,parametres_estim,proportion_1,proportion_2,sigma);

    probas = zeros(2,size(D_app,2));
   
    
    % Calcul des rpi(Pk).^2
    R_pis_1 = calcul_r(D_app, parametres_estim(1,:));
    R_pis_2 = calcul_r(D_app, parametres_estim(2,:));
    carres1 = R_pis_1.^2;
    carres2 = R_pis_2.^2;
    % calcul des termes exponentielles
    a =  2*(sigma^2);
    t1 = (-1*carres1)/(a);
    t2 = (-1*carres2)/(a);
    exp1 = exp(t1);
    exp2 =  exp(t2);
    % Multiplication de stermes exponentielles 
    % par pik/sigmak
    terme1 = (proportion_1/sigma) * exp1;
    terme2 = (proportion_2/sigma) * exp2;
    % Affectation des probas calculées
    probas(1,:) = terme1 ./ (terme1 + terme2);
    probas(2,:) = terme2 ./ (terme1 + terme2);
end