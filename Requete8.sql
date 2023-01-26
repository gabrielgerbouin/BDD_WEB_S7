-- gerbouga
SELECT Club.nomClub, AVG(Evaluation.note) AS moyenne, COUNT(Dessin.numDessin) AS nombreDeDessins
FROM Club, Evaluation, Dessin, Concours, ParticipeClub
WHERE Evaluation.numDessin = Dessin.numDessin -- On lie la table Evaluation et la table Dessin
AND Dessin.numConcours = Concours.numConcours -- On lie la table Dessin et la table Concours
AND Concours.numConcours = ParticipeClub.numConcours -- On lie la table Concours et la table ParticipeClub
AND ParticipeClub.numClub = Club.numClub -- On lie la table ParticipeClub et la table Club
GROUP BY Club.nomClub -- On regroupe les résultats par rapport au nom de Club
ORDER BY AVG(Evaluation.note) ASC -- On trie les résultats par note moyenne croissante