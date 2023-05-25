function [D,A] = nmf(Y,D_0,A_0,nb_iter)
    S = abs(Y);
    A = A_0;
    D = D_0;
    for iter=1:nb_iter
        P = A ./ (D' * D * A);
        A = A .* (D'  * S) ./ (D' * D * A);
        D = D .* (S * A') ./ (D * A * A');
    end
end