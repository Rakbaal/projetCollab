<?php 

//connexion à la base de données
$Connexion = mysqli_connect("localhost","root","","jeuxvideo");

// Rectification du problème d'encodage
$Connexion->set_charset("utf8");

$Nom = $_POST['Nom'];
$Editeur = $_POST['Editeur'];
$Genre = $_POST['Genre'];
$Console = $_POST['Console'];
$Histoire = $Connexion->real_escape_string($_POST["Histoire"]);

$OrdreInsertionJeu = "INSERT INTO jeuxvideos(Titre, Editeur, Genre, Console, Histoire) VALUES ('".$Nom."','".$Editeur."',$Genre,$Console,'".$Histoire."')";

if (mysqli_query($Connexion, $OrdreInsertionJeu)) {
      echo "Nouveau enregistrement créé avec succès";
} else {
      echo "Erreur : " . $OrdreInsertionJeu . "<br>" . mysqli_error($Connexion);
}

?>
