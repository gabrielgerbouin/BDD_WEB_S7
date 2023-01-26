-- gerbouga
-- Le meilleur et le pire club avec la moyenne et le nombre total de leurs dessins
-- ne renvoie pas encore le min et max
SELECT Club.nomClub, AVG(Evaluation.note) AS moyenne, COUNT(Dessin.numDessin) AS nombreDeDessins
FROM Club, Evaluation, Dessin, Concours, ParticipeClub
WHERE Evaluation.numDessin = Dessin.numDessin
AND Dessin.numConcours = Concours.numConcours
AND Concours.numConcours = ParticipeClub.numConcours
AND ParticipeClub.numClub = Club.numClub
GROUP BY Club.nomClub
ORDER BY AVG(Evaluation.note) ASC

-- 9, 10, 11, 12 : max (10.13548951724974)
-- 5,  6,  7,  8 : min (10.109337408709443)