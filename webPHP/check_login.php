<?php
session_start();

$username = $_POST["email"];
$pw = $_POST["password"];
$error = "Identifiant/mot de passe incorrect";

if($username == "admin" && $pw == "adminpass") {
	$_SESSION['user'] = $username;
	$_SESSION['is_admin'] = true;
	header("Location: index.php");
} elseif($username == "user" && $pw == "userpass") {
	$_SESSION['user'] = $username;
	$_SESSION['is_admin'] = false;
	header("Location: index.php");
} else {
	$_SESSION["error"] = $error;
	header("Location: login.php");
}
?>
