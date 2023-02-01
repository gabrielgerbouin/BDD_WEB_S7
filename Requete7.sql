-- gerbouga
-- Suppression de la table TempTableRequete7 si elle n'a pas ete supprimee auparavant
drop table if exists TempTableRequete7; 

-- Creation de la table temporaire TempTableRequete7
Create Table TempTableRequete7
(    
nomEval         Varchar (60) NOT NULL,
prenomEval      Varchar (60) NOT NULL, 
moyenne         float check  (moyenne between 0 and 20),
numConcours     smallint NOT NULL);

-- Premiere requete, pour selectionner le nom et prenom de chaque evaluateur, et la moyenne qu'il a donné pour tous les concours
-- Requete inseree dans la table temporaire TempTableRequete7
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
GROUP BY numConcours; -- On regroupe les résultats par rapport au numéro de concours

-- Suppression de la table TempTableRequete7 en fin de requete
drop table if exists TempTableRequete7;