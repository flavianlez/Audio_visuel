function [moyenne,sigma] = estimation(echantillons)

    moyenne = mean(echantillons,"all");

    sigma = mean(echantillons.^2,"all")- moyenne^2;
    
end