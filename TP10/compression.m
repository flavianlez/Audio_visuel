function Y_modifie = compression(Y, m)
    Y_modifie = zeros(size(Y));
    [~,ind] = sort(Y,1,"descend");
    Y_modifie(ind <=m) = Y(ind <=m);
end