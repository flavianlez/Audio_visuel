function f = retroprojection(sinogramme,theta,nb_rayons,nb_lignes,nb_colonnes)
    f = zeros(nb_lignes,nb_colonnes);
    ntheta = length(theta);
    i_centre =nb_lignes/2
    j_centre = nb_colonnes/2;
    milieu = (nb_rayons -1)/2 + 1;
    for o = 1:ntheta
        for i = 1:nb_lignes
            for j= 1:nb_colonnes
                x = j - j_centre;
                y = -i + i_centre;
                t = round(x * cos(deg2rad(theta(o))) + y * sin(deg2rad(theta(o))));
                t = milieu  + t;
                f(i,j) = f(i,j) + sinogramme(t,o);
            end
        end
    end
end