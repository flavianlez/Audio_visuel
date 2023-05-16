function [Y, valeurs_t, valeurs_f] = TFCT(y, f_ech, n_fenetre, n_decalage, fenetre)
    y_decoupe = buffer(y,n_fenetre,n_fenetre - n_decalage,"nodelay");
    if fenetre == 'hann'
        fen = hann(n_fenetre); 
    else
        fen = ones(n_fenetre);
    end
    nfen = repmat(fen, 1,size(y_decoupe,2));
    y_decoupe = y_decoupe .* nfen;
    y_f = fft(y_decoupe);
    Y = y_f(1:(n_fenetre/2)+1,:);
    valeurs_t = (0:size(Y,2)-1) * n_decalage /f_ech;
    valeurs_f = (0:n_fenetre/2) * (f_ech /n_fenetre);
end