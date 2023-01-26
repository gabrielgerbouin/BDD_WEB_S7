-- gerbouga
-- En Cours
INSERT INTO TempTableRequete7
SELECT Utilisateur.nom, Utilisateur.prenom, AVG(Evaluation.note) AS moyenne, Concours.numConcours
FROM Utilisateur, Evaluation, Concours, Dessin, Evaluateur
WHERE Evaluation.numDessin = Dessin.numDessin
AND Dessin.numConcours = Concours.numConcours
AND Evaluation.numEvaluateur = Evaluateur.numEvaluateur
AND Evaluateur.numEvaluateur = Utilisateur.numUtilisateur
GROUP BY Evaluation.numEvaluateur, Concours.numConcours
ORDER BY AVG(Evaluation.note) ASC;