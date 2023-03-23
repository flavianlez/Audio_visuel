function u_kp1 = debruitage(b,u_k,lambda,Dx,Dy,epsilon)
    
    N = size(b,1);
    norme_div = (Dx *u_k).^2 + (Dy * u_k).^2;
    terme_fract = sqrt(norme_div +  epsilon);
    terme_fract = terme_fract.^(-1);
    W = spdiags(terme_fract,0,N,N);
    terme_droite = -Dx' * W *Dx - Dy'* W * Dy;
    terme_droite = lambda * terme_droite;
    A = speye(N) - terme_droite;
    u_kp1 = A\b;
end