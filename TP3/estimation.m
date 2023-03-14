function [moyenne,sigma] = estimation(echantillons)

    moyenne = mean(echantillons);

    sigma = mean(echantillons.^2)- moyenne^2;
end