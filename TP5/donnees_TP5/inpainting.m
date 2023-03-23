function u_kp1 = inpainting(b,u_k,lambda,Dx,Dy,epsilon,D)
    
    N = size(b,1);
    norme_div = (Dx *u_k).^2 + (Dy * u_k).^2;
    terme_fract = sqrt(norme_div +  epsilon);
    terme_fract = terme_fract.^(-1);
    W = spdiags(terme_fract,0,N,N);
    terme_droite = -Dx' * W *Dx - Dy'* W * Dy;
    terme_droite = lambda * terme_droite;
    OmegaD = D == 0;
    Wid = spdiags(OmegaD ,0,N,N);
    A = Wid - terme_droite;
    u_kp1 = A\(Wid*b);
end