-- gerbouga
-- pas d erreur de code mais impossible de verifier car aucun competiteur n a participe a tous les concours
SELECT Utilisateur.nom, Utilisateur.prenom, Utilisateur.age 
FROM Utilisateur, Competiteur, ParticipeCompetiteur, Concours 
WHERE Utilisateur.numUtilisateur = Competiteur.numCompetiteur -- On lie la table Utilistaue à la table Comptiteur 
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On lie la table Competiteur à la table ParticipeCompetiteur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours -- On lie la table ParticipeCompetiteur à la table Concours 
GROUP BY Competiteur.numCompetiteur 
HAVING  
    (SELECT COUNT(*)  
     FROM ParticipeCompetiteur  
     WHERE ParticipeCompetiteur.numCompetiteur = Competiteur.numCompetiteur) -- Retourne les nombre de concours auquel a participé chaque compétiteur 
     = 
     (SELECT COUNT(*) FROM Concours) -- Retourne le nombre total de concours