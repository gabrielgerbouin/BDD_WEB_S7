-- pommergu
-- testee, a valider ensemble
SELECT Utilisateur.nom, Utilisateur.adresse, Utilisateur.age, Concours.descriptif, Concours.datedeb, Concours.datefin, Club.nomClub as "Club", Club.departement, Club.region 
FROM Utilisateur, Concours, Club, Competiteur, ParticipeCompetiteur, ParticipeClub 
Where Utilisateur.numUtilisateur = Competiteur.numCompetiteur  
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On s assure que l on parle bien du même utilisateur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours          -- On s assure qu'on sélectionne un concours de ce même utilisateur 
AND ParticipeClub.numClub = Utilisateur.numClub      -- On sélectionne le numéro de club de l utilisateur  
AND ParticipeClub.numConcours = Concours.numConcours  
AND Utilisateur.numClub = Club.numClub      -- PROPOSITION DE CORRECTION GAB : 192 RESULTATS, PLUS DE 3000 AVANT 
-- Fin de la sélection, début des conditions 
AND YEAR(Concours.datedeb) = 2021 -- YEAR(une_date) permet de retourner lannée uniquement