function [U,k] = recuit(U,k,AD,T,beta)
    N = size(AD,3);
    nbl = size(AD,1);
    nbc = size(AD,2);
    for i=1:nbl
        for j=1:nbc
            ks = k(i,j);
            % Creation de nombre aléatoire ente 1 et N-1
            epsilon = 10^-8;
            aleatoire = 1 + ((N-1-epsilon) * rand());
            ks_prime = floor(aleatoire);
            % Donner la bonne valeur de la classe car k_s 
            % ne peut pas être tiré pour chaque pixel s
            if ks <= ks_prime
                ks_prime = ks_prime + 1;
            end
            %Calcul de l'énergie de ks_prime
            tg = AD(i,j,ks_prime);
            k_voisins = k(max(i-1,1):min(i+1,nbl),max(j-1,1):min(j+1,nbc));
            td = beta * regularisation(k_voisins,ks_prime,ks);
            Us_prime = tg + td;

            %Comparaison des deux énergies
            Us = U(i,j); 
            if Us_prime < Us
                U(i,j) = Us_prime;
                k(i,j) = ks_prime;
            else
                % Modification en fonction de la proba
                terme_proba = exp((Us- Us_prime)/T);
                proba = rand();
                if proba < terme_proba
                    U(i,j) = Us_prime;
                    k(i,j) = ks_prime;
                end
            end
        end
    end
end
 