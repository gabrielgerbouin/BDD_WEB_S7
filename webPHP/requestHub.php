<?php
	include "header.php";
?>

<div class="container">
        <h1 style="text-align:center;">Liste des requêtes disponibles</h1>
	<?php
	if($_SESSION['is_admin'] == true) {
		echo "<div class='center-div'>" .
			"<a href='user_stats.php'>" .
			"<button>Statistiques utilisateurs</button>" .
			"</a>" .
		"</div>";
	}
	?>
	<div class="center-div">
		<a href="request1.php">
            	<button>Requête personnalisée 1</button>
        	</a>
	</div>
	<div class="center-div">
                <a href="request2.php">
                <button>Requête personnalisée 2</button>
                </a>
        </div>
	<div class="center-div">
                <a href="request3.php">
                <button>Requête personnalisée 3</button>
                </a>
        </div>
</div>
