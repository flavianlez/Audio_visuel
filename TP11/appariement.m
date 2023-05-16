function paires = appariement(pics_t, pics_f, n_v, delta_t, delta_f)
    paires = [];
    for i = 1:length(pics_t)
        pic_1t = pics_t(i);
        pic_1f = pics_f(i);
        matrice_find = abs(pics_f - pic_1f) <= delta_f;
        matrice_find = matrice_find .* ((pics_t - pic_1t) > 0) .* ( abs(pic_1t - pics_t) <= delta_t);
        proches = find(matrice_find, n_v);
        for ind_j = 1:length(proches)
            j = proches(ind_j);
            quadruplet = [ pic_1f pics_f(j) pic_1t pics_t(j)];
            paires = [paires ; quadruplet];
        end
    end
end