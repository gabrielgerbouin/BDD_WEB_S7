-- pommergu
-- ne fonctionne pas

-- Nous devons prendre tous les l'opérateur ALL n existant pas il faut donc faire une double négation 
-- Nous devons donc afficher le reste des dessins en enlevant tous les dessin qui n'ont pas été noté  
SELECT Concours.numConcours, YEAR(Concours.datedeb) as "année", Concours.descriptif, User_Competiteur.nom, Dessin.numDessin , Dessin.commentaire, Evaluation.note, Evaluation.commentaire, User_Evaluateur.nom  
FROM Concours,Utilisateur User_Competiteur, Competiteur, ParticipeCompetiteur, Dessin, Evaluation, Evaluateur, Utilisateur User_Evaluateur -- Nous sommes obligés de créeer deux tables utilisateurs une pour le competiteur une pour l evaluateur 
WHERE User_Competiteur.numUtilisateur = Competiteur.numCompetiteur -- On selection le competiteur dans une table user à part 
AND Competiteur.numCompetiteur = ParticipeCompetiteur.numCompetiteur -- On s assure que l on parle bien du même utilisateur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours          -- On s assure qu'on sélectionne un concours de ce même utilisateur 
AND Dessin.numCompetiteur = Competiteur.numCompetiteur    -- On sélectionne le dessin du compétiteur  
AND Dessin.numDessin = Evaluation.numDessin  -- On sélectionne l évaluation correspondante au dessinNOT EXISTS -- Premiere negation 
AND Evaluation.numEvaluateur = Evaluateur.numEvaluateur 
AND User_Evaluateur.numUtilisateur = Evaluateur.numEvaluateur -- On selectionne l évaluateur dans une table user à part  
AND  NOT EXISTS -- Deuxieme negation 
(SELECT * FROM Evaluation -- ON prends toutes les dessins non notés  
WHERE Evaluation.note IS NULL) )

-- gerbouga
-- ne fonctionne pas, erreur : Unknown column 'ParticipeCompetiteur.numCompetiteur' in 'where clause'
SELECT Concours.numConcours, YEAR(Concours.datedeb) AS année, Concours.descriptif AS DescriptifConcours, User_Competiteur.nom AS NomCompetiteur, Dessin.numDessin, Dessin.commentaire AS CommentaireDessin, Evaluation.note, Evaluation.commentaire AS CommentaireNote, User_Evaluateur.nom AS NomEvaluateur 
FROM Concours, Utilisateur AS User_Competiteur, Utilisateur AS User_Evaluateur, Dessin, Evaluation, Evaluateur, Competiteur 
WHERE User_Competiteur.numUtilisateur = Competiteur.numCompetiteur 
AND Competiteur.numCompetiteur = Dessin.numCompetiteur 
AND Dessin.numCompetiteur = ParticipeCompetiteur.numCompetiteur 
AND ParticipeCompetiteur.numConcours = Concours.numConcours 
AND User_Evaluateur.numUtilisateur = Evaluateur.numEvaluateur 
AND Evaluateur.numEvaluateur = Evaluation.numEvaluateur 
AND Evaluation.numDessin = Dessin.numDessin; 