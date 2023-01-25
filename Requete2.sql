-- pommergu
-- testee, a verifier ensemble
SELECT Dessin.numDessin, Evaluation.note, Utilisateur.nom, Concours.descriptif, Concours.theme 
FROM Dessin, Evaluation, Utilisateur, Concours, Competiteur, ParticipeCompetiteur 
Where Utilisateur.numUtilisateur = Competiteur.numCompetiteur -- On selection le competiteur 
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On s assure que l on parle bien du même utilisateur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours          -- On s assure qu'on sélectionne un concours de ce même utilisateur 
AND Dessin.numCompetiteur = Competiteur.numCompetiteur    -- On sélectionne le dessin du compétiteur  
AND Dessin.numDessin = Evaluation.numDessin  -- on sélectionne l évaluation correspondante au dessin 
-- Fin de la sélection, début des conditions 
AND YEAR(Evaluation.dateEvaluation) = 2022 -- YEAR(une_date) permet de retourner lannée uniquement  
ORDER BY  Evaluation.note ASC -- Tri dans l'ordre ascendant des notes