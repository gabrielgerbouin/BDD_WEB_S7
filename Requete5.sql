-- gerbouga
-- Testee, validee
SELECT Club.region, AVG(Evaluation.note) as moyenne 
FROM Club, Evaluation, Utilisateur, Competiteur, Dessin 
WHERE Club.numClub = Utilisateur.numClub -- On lie la table Club à la table Utilisateur 
AND Utilisateur.numUtilisateur = Competiteur.numCompetiteur -- On lie la table Utilisateur à la table Competiteur 
AND Competiteur.numCompetiteur = Dessin.numCompetiteur -- On lie la table Competiteur à la table Dessin 
AND Dessin.numDessin = Evaluation.numDessin -- On lie la table Dessin à la table Evaluation 
GROUP BY Club.region -- Regroupe les résultats par région 
ORDER BY AVG(Evaluation.note) DESC -- Trie les résultats par note moyenne décroissante 
LIMIT 1 -- On ne garde que le 1er resultat (la meilleure moyenne)