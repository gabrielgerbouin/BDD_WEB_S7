-- gerbouga
SELECT Concours.numConcours, YEAR(Concours.datedeb) AS année, Concours.descriptif AS DescriptifConcours, User_Competiteur.nom AS NomCompetiteur, Dessin.numDessin, Dessin.commentaire AS CommentaireDessin, Evaluation.note, Evaluation.commentaire AS CommentaireNote, User_Evaluateur.nom AS NomEvaluateur 
FROM Concours, Utilisateur AS User_Competiteur, Utilisateur AS User_Evaluateur, Dessin, Evaluation, Evaluateur, Competiteur, ParticipeCompetiteur
WHERE User_Competiteur.numUtilisateur = Competiteur.numCompetiteur -- On lie la table Utilisateur (pour le competiteur) a la table Competiteur
AND Competiteur.numCompetiteur = Dessin.numCompetiteur -- On lie la table Competiteur a la table Dessin
AND Dessin.numConcours = Concours.numConcours -- On lie la table Dessin a la table Concours
AND ParticipeCompetiteur.numConcours = Concours.numConcours -- On lie la table ParticipeCompetiteur a la table Concours
AND User_Evaluateur.numUtilisateur = Evaluateur.numEvaluateur -- On lie la table Utilisateur (pour l evaluateur) a la table Evaluateur
AND Evaluateur.numEvaluateur = Evaluation.numEvaluateur -- On lie la table Evaluateur a la table Evaluation
AND Evaluation.numDessin = Dessin.numDessin -- On lie la table Evaluation a la table Dessin
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On lie la table Competiteur a la table ParticipeCompetiteur
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On lie la table Competiteur a la table ParticipeCompetiteur
AND Evaluation.note IS NOT NULL; -- On exclue les dessins non notés