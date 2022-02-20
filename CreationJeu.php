<?php
//connexion à la base de données
$Connexion = mysqli_connect("localhost","root","","jeuxvideo");

// Rectification du problème d'encodage
$Connexion->set_charset("utf8");

$OdreSQLGenre = "SELECT ID, Libelle FROM GENRE";

$OdreSQLConsole = "SELECT ID, Libelle FROM CONSOLE";

$resultat_Genre = $Connexion ->query($OdreSQLGenre);
$resultat_Console = $Connexion ->query($OdreSQLConsole);

?>

<!DOCTYPE HTML>
<html lang ="fr">
	<head>
		<meta charset ="utf-8">
		<link href ="CreationJeu.css" rel="stylesheet">
		<title> Création d'un jeu vidéo</title>
	</head>
	
	<body>
		<h1>Bienvenue sur la page d'ajout d'un jeu vidéo</h1><br />
		<h2>Ce formulaire va vous guider afin de rajouter un jeu à notre liste</h2>
		
		<form action ="Liste.php"id="Jeu" name ="Jeu" action ="" method ="POST">
			<table>
				<tr> 
					<td><b>Titre du jeu* :</b></td> 
					<td><input type="text" name="Nom" value="" size="20" maxlength="50" required /></td>
				</tr>
				<tr> 
					<td><b>Editeur du jeu* :</b></td> 
					<td><input type="text" name="Editeur" value="" size="20" maxlength="50" required /></td>
				</tr>
				<tr> 
					<td>Genre Principal:</td> 
					<td>
						<?php while($Tableau = $resultat_Genre->fetch_assoc())
						{
							echo '<input type= "radio" name ="Genre" value='.$Tableau['ID'].'>'.$Tableau['Libelle'].'<br />';
						}?>
					</td>
				</tr>
				<tr> 
					<td>Console Principal:</td> 
					<td>
						<?php while($Tableau = $resultat_Console->fetch_assoc())
						{
							echo '<input type= "radio" name ="Console" value='.$Tableau['ID'].'>'.$Tableau['Libelle'].'<br />';
						}?>
					</td>
				</tr>
				<tr> 
					<td>Histoire :</td>
					<td><textarea name = 'Histoire'>Veuillez décrire l'histoire ici</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" name="Envoyer" value="Envoyer">
						<input type="reset" name="Recommencer" value="Réinitialiser">
						<a href ="Login.php"><input type="button" name="Accueil" value="Accueil">
				</tr>
			</table>
		</form>
		* notion obligatoire
	</body>
</html>