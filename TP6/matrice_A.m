function A =  matrice_A(N,alpha,beta,gamma)
    Id =speye(N);
    e = ones(N,1);
    D2 = spdiags([e -2*e e],-1:1,N,N);
    D2(N,1) = 1;
    D2(1,N) = 1;
    A = Id + gamma * (alpha*D2 - beta*D2'*D2);
end