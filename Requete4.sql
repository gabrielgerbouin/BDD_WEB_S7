-- gerbouga
-- Suppression de la table TempTableRequete4 si elle n'a pas ete supprimee auparavant
drop table if exists TempTableRequete4;

-- Creation de la table temporaire TempTableRequete4
Create Table TempTableRequete4
(    
nomUtil         Varchar (60) NOT NULL,
prenomUtil      Varchar (60) NOT NULL, 
age             smallint check (age between 0 and 150),
nbrConcours     smallint NOT NULL);

-- Premiere requete, pour selectionner le nom, prenom et age de chaque competiteur, et le nombre de participations pour chaque competiteur
-- Requete inseree dans la table temporaire TempTableRequete4
INSERT INTO TempTableRequete4
SELECT Utilisateur.nom, Utilisateur.prenom, Utilisateur.age, COUNT(ParticipeCompetiteur.numConcours) AS nbrConcours
FROM Utilisateur, Competiteur, ParticipeCompetiteur, Concours 
WHERE Utilisateur.numUtilisateur = Competiteur.numCompetiteur -- On lie la table Utilisateur à la table Comptiteur 
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On lie la table Competiteur à la table ParticipeCompetiteur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours -- On lie la table ParticipeCompetiteur à la table Concours 
GROUP BY ParticipeCompetiteur.numCompetiteur; -- On regroupe les résultats par rapport au numéro de competiteur

-- Seconde requete, pour selectionner uniquement les competiteurs stockes dans la table TempTableRequete4 qui ont participe a tous les concours
SELECT *
FROM TempTableRequete4
WHERE nbrConcours = 8;

-- Suppression de la table TempTableRequete4 en fin de requete
drop table if exists TempTableRequete4;