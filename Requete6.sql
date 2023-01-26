-- gerbouga
-- testee, validee
SELECT Utilisateur.nom, Utilisateur.prenom, COUNT(Evaluation.note) AS nombreDeNotes, Concours.numConcours
FROM Utilisateur, Evaluation, Concours, Dessin, Evaluateur
WHERE Evaluation.numDessin = Dessin.numDessin -- On lie la table Evaluation et la table Dessin
AND Dessin.numConcours = Concours.numConcours -- On lie la table Dessin et la table Concours
AND Evaluation.numEvaluateur = Evaluateur.numEvaluateur -- On lie la table Evaluation et la table Evaluateur
AND Evaluateur.numEvaluateur = Utilisateur.numUtilisateur -- On lie la table Evaluateur et la table Utilisateur
GROUP BY Evaluation.numEvaluateur, Concours.numConcours -- On regroupe les résultats par rapport au numéro d'évaluateur et au numéro de concours
ORDER BY Concours.numConcours ASC; -- On trie les résultats par numero de concours croissant