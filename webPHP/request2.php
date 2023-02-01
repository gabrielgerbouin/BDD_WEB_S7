<?php
	include "header.php";
?>

<?php
	include_once("fct_query.php");
	$sql="SELECT nomEval, prenomEval, MIN(moyenne) AS moyenneMinimale, numConcours ".
		"FROM TempTableRequete7 ".
		"GROUP BY numConcours;";
	echo "<h1>Afficher le nom de l’évaluateur le plus sévère pour chaque concours ; la moyenne des notes qu’il a attribuées ; le numéro du concours évalué..</h1>";
	echo "<p style='text-align: center;'> $sql </p>";
	$a=executeSelect($sql,[]);
	if($a>0)
        {
                echo "<table>";
		echo "<tr>".
			"<th>Nom</th>".
			"<th>Prénom</th>".
			"<th>Numéro du concours</th>".
			"<th>Moyenne minimale sur le concours</th>".
		"</tr>";
                foreach($a as $result) {
                        echo "<tr>".
				"<td>".$result["nomEval"]."</td>".
                                "<td>".$result["prenomEval"]."</td>".
                                "<td>".$result["numConcours"]."</td>".
                                "<td>".$result["moyenneMinimale"]."</td>".
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
