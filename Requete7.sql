-- gerbouga
-- testee, validee
-- Premiere requete, pour selectionner le nom et prenom de chaque evaluateur, et la moyenne qu'il a donné pour tous les concours
INSERT INTO TempTableRequete7
SELECT Utilisateur.nom, Utilisateur.prenom, AVG(Evaluation.note) AS moyenne, Concours.numConcours
FROM Utilisateur, Evaluation, Concours, Dessin, Evaluateur
WHERE Evaluation.numDessin = Dessin.numDessin -- On lie la table Evaluation et la table Dessin
AND Dessin.numConcours = Concours.numConcours -- On lie la table Dessin et la table Concours
AND Evaluation.numEvaluateur = Evaluateur.numEvaluateur -- On lie la table Evaluation et la table Evaluateur
AND Evaluateur.numEvaluateur = Utilisateur.numUtilisateur -- On lie la table Evaluateur et la table Utilisateur
GROUP BY Evaluation.numEvaluateur, Concours.numConcours -- On regroupe les résultats par rapport au numéro d'évaluateur et au numéro de concours
ORDER BY AVG(Evaluation.note) ASC; -- On trie les résultats par note moyenne croissante
-- Seconde requete, pour selectionner la moyenne minimale par concours
SELECT nomEval, prenomEval, MIN(moyenne) AS moyenneMinimale, numConcours
FROM TempTableRequete7
GROUP BY numConcours;