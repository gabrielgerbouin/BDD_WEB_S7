<?php
	include "header.php";
?>

<h1>Statistiques des utilisateurs</h1>

<form class="center-div" method = "post" action="#">
	<label for="user-name">Utilisateur: </label>
	<input name="target-user" id="target-list" list="users" style="margin: 10px">
	<datalist id="users">
	<?php
	include_once("fct_query.php");
	$sql="SELECT nom, prenom FROM Utilisateur";
	$a=executeSelect($sql,[]);
	if($a>0)
	{
		foreach($a as $utilisateur) {
			echo "<option value='" . $utilisateur["nom"] . "'>\n";
		}
	}
	?>
	</datalist>
	<button name="stats_submit" value="1" type="submit">Afficher les statistiques</button>
</form>

<?php
if(isset($_POST))
{
	if($_POST['target-user'] != "") {
		$sql='SELECT nom, prenom, Count(DISTINCT theme) as nbrConcours, COUNT(note) as nbrParticipations, ROUND(AVG(note), 2) as moyenne, MIN(note) as minimum, MAX(note) as maximum FROM Dessin, Evaluation, Competiteur, Utilisateur, Concours WHERE Dessin.numCompetiteur = Competiteur.numCompetiteur AND Dessin.numDessin = Evaluation.numDessin AND Competiteur.numCompetiteur = Utilisateur.numUtilisateur AND Concours.numConcours = Dessin.numConcours AND nom LIKE ?';
		$a=executeSelect($sql,array($_POST['target-user']));
		if($a>0)
		{
			if($a[0]["nbrParticipations"] == 0) {
				echo "<p style='text-align:center'>Il n'existe aucun dessin pour " . $_POST['target-user'] . "</p>";
			} else {
				echo "<table>";
				echo "<tr><th>Nom</th><th>Prénom</th><th>Nbr total de concours</th><th>Nbr de participations</th><th>Moyenne</th><th>Pire note</th><th>Meilleur note</th></tr>";
				foreach($a as $result) {
					echo "<tr>" .
						"<td>" . $result["nom"] . "</td>" .
		                                "<td>" . $result["prenom"] . "</td>" .
		                                "<td>" . $result["nbrConcours"] . "</td>" .
		                                "<td>" . $result["nbrParticipations"] . "</td>" .
		                                "<td>" . $result["moyenne"] . "</td>" .
		                                "<td>" . $result["minimum"] . "</td>" .
		                                "<td>" . $result["maximum"] . "</td>" .
					"</tr>";
				}
				echo "</table>";
			}
		}
	}
}
?>

<div class="center-div">
        <a href="requestHub.php">
        <button>Retour</button>
        <a>
</div>
