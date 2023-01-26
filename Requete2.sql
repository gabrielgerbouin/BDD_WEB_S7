-- gerbouga
SELECT Evaluation.numDessin, Evaluation.note, Utilisateur.nom, Concours.descriptif, Concours.theme
FROM Evaluation, Utilisateur, Concours, Dessin, Competiteur
WHERE Evaluation.numDessin = Dessin.numDessin -- On lie la table Evaluation a la table Dessin
AND Dessin.numConcours = Concours.numConcours -- On lie la table Dessin a la table Concours
AND Dessin.numCompetiteur = Competiteur.numCompetiteur -- On lie la table Dessin a la table Competiteur
AND Competiteur.numCompetiteur = Utilisateur.numUtilisateur -- On lie la table Competiteur a la table Evaluateur
AND YEAR(Dessin.dateRemise) = 2022  -- YEAR(une_date) permet de retourner lannée uniquement
ORDER BY Evaluation.note ASC; -- Tri dans l'ordre ascendant des notes