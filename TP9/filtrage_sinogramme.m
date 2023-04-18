function filtre = filtrage_sinogramme(sinogramme)
    
    [Nl,nc] = size(sinogramme);
    sinogramme_TF = fftshift(sinogramme);
    filtre  = abs(fftshift((0:Nl-1)/Nl-0.5));

    filtre = sinogramme_TF .* filtre;

    filtre = real(ifft(filtre));
 
end