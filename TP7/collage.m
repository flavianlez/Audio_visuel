function u = collage(r,s,interieur)
    r = double(r);
    s = double(s);
    % Calcul Dx et Dy
    [nb_lignes nb_colonnes] = size(r,1:2);
    nb_pixels = nb_lignes * nb_colonnes;
    e = ones(nb_pixels,1);
    Dx = spdiags([-e e],[0 nb_lignes],nb_pixels,nb_pixels);
    Dx(end-nb_lignes+1:end,:) = 0;
    Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
    Dy(nb_lignes:nb_lignes:end,:) = 0;
    % calcul de A
    A = -Dx'*Dx - Dy' * Dy;
    %Condition aux bords
    indices_bords_r = zeros(size(r,1:2));
    taille_ligne = size(r,1);
    taille_collonne = size(r,2);
    indices_bords_r(1,:) = ones(taille_collonne,1);
    indices_bords_r(end,:) = ones(taille_collonne,1);
    indices_bords_r(:,1) = ones(taille_ligne,1);
    indices_bords_r(:,end) = ones(taille_ligne,1);
    indices_bord_r = find(indices_bords_r == 1);


    % Applicationd e la condition au contour
    n_bord_r = length(indices_bord_r);
    n_r = nb_pixels;

    A(indices_bord_r,:) = sparse(1:n_bord_r,indices_bord_r,ones(n_bord_r,1),n_bord_r,n_r);
    
    u = r;
    for k=1:3
        ri = r(:,:,k);
        ri =ri(:);
        si = s(:,:,k);
        si = si(:);
        g_x= Dx*ri;
        g_y =Dy * ri;
        grads_x = Dx* si;
        grads_y = Dy*si;

        g_x(interieur) = grads_x(interieur);
        g_y(interieur) = grads_y(interieur);

        bk = Dx *g_x + Dy * g_y;
        bk(indices_bord_r) = ri(indices_bord_r);
        uk = A \bk;
        uk = reshape(uk,size(r,1),size(r,2));
        u(:,:,k) = uk;
    end
end