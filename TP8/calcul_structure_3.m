function u_barre= calcul_structure_3(u_barre,u,Dx,Dy,Phi,epsilon,mu_prime,gamma)
   [nb_lignes,nb_colonnes] = size(u_barre);
   fu_barre = fft2(u_barre);
   fu_barre = fftshift(fu_barre);
   fu = fft(u);
   fu = fftshift(fu);
   phiu = Phi .* (fu_barre - fu);
   terme_gauche = ifft2(ifftshift(phiu));
   terme_gauche = real(terme_gauche);
    
   u_x = Dx * u_barre(:);
   u_y = Dy * u_barre(:);
   u_xx = -Dx' * Dx * u_barre(:);
   u_xy = -Dx' * Dy * u_barre(:);
   u_yy = -Dy' * Dy * u_barre(:);
   num = u_xx .* (u_y.^2 + epsilon) + u_yy .*(u_x.^2 + epsilon) - 2 * u_x .* u_y .* u_xy;
   denom = (u_x.^2 + u_y.^2 + epsilon) .^(3/2);
   terme_div = num ./denom;
   terme_div = reshape(terme_div,nb_lignes,nb_colonnes);
   u_barre = u_barre - gamma * (terme_gauche - mu_prime * terme_div);
end