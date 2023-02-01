<?php
session_start()
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf8" >
        <title><?php echo $_TITRE_PAGE ?></title>
       <link rel = "stylesheet" href = "css/styles.css" type="text/css">
      
    </head>

    <body>

        <nav class="navigation-bar">
	    <div class="left-links">
            	<img class="logo" src="logo_eseo.png">
            	<a class="links" href="index.php">Accueil</a>
	    	<?php 
		if(isset($_SESSION['user']))  {
			echo "<a class='links' href='requestHub.php'>Requêtes</a>\n";
		}
	    	?>
	    </div>
	    <div class="right-links">
	    	<?php
		if(isset($_SESSION['user'])) {
			echo "<img class='user-icon' src='user_icon.png'>";
			echo "<div class='user-tag'>".$_SESSION['user']."</div>";
			echo "<a class='links' href='logout.php'>Déconnexion</a>";
		} else {
			echo "<a class='links' href='login.php'>Connexion</a>";
		}
		?>
	    </div>
        </nav>
