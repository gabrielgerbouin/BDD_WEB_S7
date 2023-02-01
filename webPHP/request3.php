<?php
	include "header.php";
?>

<?php
	include_once("fct_query.php");
	$sql="SELECT Club.nomClub, AVG(Evaluation.note) AS moyenne, COUNT(Dessin.numDessin) AS nombreDeDessins ".
		"FROM Club, Evaluation, Dessin, Concours, ParticipeClub ".
		"WHERE Evaluation.numDessin = Dessin.numDessin ".
		"AND Dessin.numConcours = Concours.numConcours ".
		"AND Concours.numConcours = ParticipeClub.numConcours ".
		"AND ParticipeClub.numClub = Club.numClub ".
		"GROUP BY Club.nomClub ".
		"ORDER BY AVG(Evaluation.note) ASC";
	echo "<h1>Afficher le nom et la moyenne des notes de chaque club, tous concours confondus. Afficher également le nombre total de dessins réalisés par chacun de ces clubs.</h1>";
	echo "<p style='text-align: center;'> $sql </p>";
	$a=executeSelect($sql,[]);
	if($a>0)
        {
                echo "<table>";
		echo "<tr>".
			"<th>Club</th>".
			"<th>Moyenne (ordre croissant)</th>".
			"<th>Nbr total de dessins</th>".
		"</tr>";
                foreach($a as $result) {
                        echo "<tr>".
				"<td>".$result["nomClub"]."</td>".
                                "<td>".$result["moyenne"]."</td>".
                                "<td>".$result["nombreDeDessins"]."</td>".
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
