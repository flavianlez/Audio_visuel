function [pics_t, pics_f] = pics_spectraux(S, eta_t, eta_f, epsilon)
    
    SE = strel('rectangle',[eta_t eta_f]);
    Smax = imdilate(S,SE);
    [pics_f,pics_t] = find((Smax - S == 0) .* (S > epsilon));
end