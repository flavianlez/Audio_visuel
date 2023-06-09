function u_barre = calcul_structure_2(u_barre,b,Dx,Dy,lambda,epsilon)
   N = size(b,1);
   [nb_lignes,nb_colonnes] = size(u_barre);
   u_barre = u_barre(:);
   norme_div = (Dx *u_barre).^2 + (Dy * u_barre).^2;
   terme_fract = sqrt(norme_div +  epsilon);
   terme_fract = terme_fract.^(-1);
   W = spdiags(terme_fract,0,N,N);
   terme_droite = -Dx' * W *Dx - Dy'* W * Dy;
   terme_droite = lambda * terme_droite;
   A = speye(N) - terme_droite;
   u_barre = A\b;
   u_barre = reshape(u_barre,nb_lignes,nb_colonnes);