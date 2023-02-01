<?php
	include "header.php";
?>

<?php
	include_once("fct_query.php");
	$sql="SELECT Utilisateur.nom, Utilisateur.prenom, COUNT(Evaluation.note) AS nombreDeNotes, Concours.numConcours ".
		"FROM Utilisateur, Evaluation, Concours, Dessin, Evaluateur ".
		"WHERE Evaluation.numDessin = Dessin.numDessin ".
		"AND Dessin.numConcours = Concours.numConcours ".
		"AND Evaluation.numEvaluateur = Evaluateur.numEvaluateur ".
		"AND Evaluateur.numEvaluateur = Utilisateur.numUtilisateur ".
		"GROUP BY Evaluation.numEvaluateur, Concours.numConcours ".
		"ORDER BY Concours.numConcours ASC;";
	echo "<h1>Afficher le nombre de dessins évalués par chaque évaluateur, pour chaque concours. Afficher le nombre de dessins, le nom de l’évaluateur, le numéro du concours.</h1>";
	echo "<p style='text-align: center;'> $sql </p>";
	$a=executeSelect($sql,[]);
	if($a>0)
        {
                echo "<table>";
		echo "<tr>".
			"<th>Nom</th>".
			"<th>Prénom</th>".
			"<th>Id du Concours</th>".
			"<th>Nombre de dessins évalués sur le concours</th>".
		"</tr>";
                foreach($a as $result) {
                        echo "<tr>".
				"<td>".$result["nom"]."</td>".
                                "<td>".$result["prenom"]."</td>".
                                "<td>".$result["numConcours"]."</td>".
                                "<td>".$result["nombreDeNotes"]."</td>".
                	"</tr>";
		}
                echo "</table>";
        }
?>

<div class="center-div">
        <a href="requestHub.php">
        <button>Retour</button>
        <a>
</div>
