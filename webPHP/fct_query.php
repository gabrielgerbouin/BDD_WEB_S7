<?php
  // Paramètres de connexion à la base de données
  include_once("dBConnexion.php");  
  /* variable h  est une variable globale utilisée pour la connexion à la BDD */
  $h="mysql:host=".DB_HOST.";dbname=".DB_NAME.";charset=UTF8";
  /* 
    Fonction pour exécuter une requête qui va ajouter supprimer une table- ou ajouter un enregistrement 
    $sql : contient une requête de type create table / drop table / insert table 
    
  */
  
  
  function exec_query_createTB($sql){
    $v=0;
    //On établit la connexion
    try{
    $link = new PDO($GLOBALS['h'], DB_USER, DB_PASS);
    //On définit le mode d'erreur de PDO sur Exception
    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    /*setAttribute() sert à configurer un attribut PDO. 
    Dans ce cas précis, elle permet de configurer l’attribut PDO::ATTR_ERRMODE qui sert à créer un rapport d’erreur 
    et nous précisons que l’on souhaite qu’il émette une exception avec PDO::ERRMODE_EXCEPTION. */
    echo 'Connexion réussie';
    $link->exec($sql);
    echo "creation table réusssie";
    $v=1;
    
    }		
    /*On capture les exceptions si une exception est lancée et on affiche
    les informations relatives à celle-ci*/
    catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
    
    $v= -1;
    }
    
    $link=NULL;
    return $v;
  }
  /* cette fonction permet d'exécuter une requête SQL préparée 
    $sql : contient la requête préparée
    $a: contient les valeurs correspondants aux ?
    
     retourne 1 si requête exécuté ou -1 si erreur
  */
	function executeInsert($sql,$a){
    try{
      $link = new PDO($GLOBALS['h'], DB_USER, DB_PASS);
      //On définit le mode d'erreur de PDO sur Exception
      $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      /*setAttribute() sert à configurer un attribut PDO. 
      Dans ce cas précis, elle permet de configurer l’attribut PDO::ATTR_ERRMODE qui sert à créer un rapport d’erreur 
      et nous précisons que l’on souhaite qu’il émette une exception avec PDO::ERRMODE_EXCEPTION. */
      echo 'Connexion réussie';
      
      
      
      //$sth appartient à la classe PDOStatement
      $sth = $link->prepare($sql);
      $sth->execute($a);
      /***************************************************************
      /* AUTRE METHODE : utilisez soit bindValue soit bindParam on ne peut pas utiliser les deux pour une même requête
      1/ pour sql= INSERT INTO Users(Nom,Prenom,Adresse,Ville,Codepostal,Pays) VALUES (?, ?, ?, ?, ?, ?)
      $sth->bindValue(1, $a[0]);   
      $sth->bindValue(2, $a[1]);
      $sth->bindValue(3, $a[2]);
      $sth->bindValue(4, $a[3]);
      $sth->bindValue(5, $a[4], PDO::PARAM_INT);
      $sth->bindValue(6, $a[5]);
      
      OU -------------------------------------------
      
      
      2/ pour sql=	INSERT INTO USERS VALUES (:nom, :prenom, :adresse, :ville, :cp, :pays)
      $sth->bindParam(':nom', $a[0]); ...
      ****************************************************************
      à la fin exécuter la requête créée
      $sth->execute();
      ****************************************************************/
      echo "Entrée ajoutée dans la table";
      $v=1;
    }
    
    catch(PDOException $e){
      echo "Erreur : " . $e->getMessage();
      $v=-1;
    }
    return $v;
	}
  function executeUpdate($sql,$a){
  
    try{
      $link = new PDO($GLOBALS['h'], DB_USER, DB_PASS);
      //On définit le mode d'erreur de PDO sur Exception
      $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      /*setAttribute() sert à configurer un attribut PDO. 
      Dans ce cas précis, elle permet de configurer l’attribut PDO::ATTR_ERRMODE qui sert à créer un rapport d’erreur 
      => nous voulons qu'il émette une exception avec PDO::ERRMODE_EXCEPTION. */
      echo 'Connexion réussie';
      
      
      
      //$sth appartient à la classe PDOStatement
      $sth = $link->prepare($sql);
      $sth->execute($a);
      
      //On affiche le nombre d'entrées mise à jour
      $count = $sth->rowCount();
      print('Mise à jour de ' .$count. ' entrée(s)');
    }
      
    catch(PDOException $e){
      echo "Erreur : " . $e->getMessage();
      $count =-1;
    }
      return $count;
	}
  function executeSelect($sql,$a){
    $resultat=[];
    try{
      $link = new PDO($GLOBALS['h'], DB_USER, DB_PASS);
      //On définit le mode d'erreur de PDO sur Exception
      $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      /*setAttribute() sert à configurer un attribut PDO. 
      Dans ce cas précis, elle permet de configurer l’attribut PDO::ATTR_ERRMODE qui sert à créer un rapport d’erreur 
      et nous précisons que l’on souhaite qu’il émette une exception avec PDO::ERRMODE_EXCEPTION. */
      //echo 'Connexion réussie';
      
      
      
      //$sth appartient à la classe PDOStatement
      $sth = $link->prepare($sql);
      $sth->execute($a);
      
      //On affiche le nombre d'entrées mise à jour
      $resultat = $sth->fetchAll(PDO::FETCH_ASSOC);
      //print_r($resultat);
      //$count=sizeof($resultat);
    }
    
    catch(PDOException $e){
      echo "Erreur : " . $e->getMessage();
      return -1;
    }
    return $resultat;// contient un tableau avec l'ensemble des enregistrements sélectionnés avec la requête SQL.
  }
?>
