<?php
//On démarre une nouvelle session
session_start();

$_TITRE_PAGE="Connexion";
include "header.php"; //contient l'entete de la page 

?>
<!DOCTYPE html>
<html lang="fr">
    <body>
	<h1><?php 	echo $_TITRE_PAGE ?></h1>

        <div class="connexion_box">
            <form method = "POST" action="check_login.php">
                <p>
                    <label for="email"></label>
                    <input id="email" name="email" type="text" placeholder="Email">
                </p>
                <p>
                    <label for="mdp"></label>
                    <input name="password" type="password" id="mdp" placeholder="Mot de passe">
                </p>
		<?php
                if(isset($_SESSION["error"])){
                	$error = $_SESSION["error"];
                        echo "<p class='error-message'>$error</p>";
                }
                ?>
                <button class="connexion_submit" name="connexion_submit" value="1" type="submit">Connexion</button>
            </form>
        </div>
    </body>
</html>

<?php
    unset($_SESSION["error"]);
?>
