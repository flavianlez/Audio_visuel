function resultats = recherche_simplifiee(identifiants, bdd)
    resultats = [];
    for ind_id =1:length(identifiants)
        id = identifiants(ind_id);
        if bdd.isKey(id)
            entrees = bdd(id);
            resultats = [resultats; entrees(:,2)];
        end
    end
end