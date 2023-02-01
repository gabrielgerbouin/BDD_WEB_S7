<?php
session_start();

include "header.php"; //contient l'entete de la page 
$_TITRE_PAGE="Système d'Information pour la Gestion des Concours de Dessins";
?>

<h1><?php 	echo $_TITRE_PAGE ?></h1>
<?php
	if(isset($_SESSION["user"])) {
		echo "<p style='text-align:center'>Bienvenue " . $_SESSION["user"] . ".</p>";
		echo "<p style='text-align:center'>Pourquoi ne pas lancer quelques requêtes SQL ?</p>";
		echo "<div class='center-div'>" .
			"<a href='requestHub.php'>" .
			"<button>C'est parti !</button>" .
			"</a>" .
		"</div>";
	} else {
		echo "<p style='text-align:center'>Bienvenue sur la page d'accueil de ce projet de BDD. Pour commencer, veuillez vous identifier.</p>";
	}
?>
    </body>
</html>
