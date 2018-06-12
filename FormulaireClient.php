<?php
require_once 'fonc_oracle.php';

$session='ETU2_33';
$mdp='ETU2_33';
$instance='spartacus.iutc3.unicaen.fr:1521/info.iutc3.unicaen.fr';
$conn=OuvrirConnexion($session,$mdp,$instance);

						
$req="select * from CDI_PAYS";		
$cur=PreparerRequete($conn,$req);
$r=executerRequete($cur);
$nblignes=LireDonnees($cur,$tabpays);


if( isset ($_POST['EN']))
{
			$erreur = null;	
			
			require_once("VerificationClient.php");
			if ($erreur == null)
						{
							
							$typeclient=$_POST['typeclient'];
							$pays=$_POST['pays'];
							$numero=Calculer($conn);

							$req="Insert INTO CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE) values ('$numero', '$nom' ,'$prenom', '$pays', '$localite', '$ca', '$typeclient')";		
							$cur=PreparerRequete($conn,$req);
							$r=executerRequete($cur);
							oci_commit($conn);
							echo '<script>document.location="supprimerclient.php"</script>'; 
						
						}
}
	
?>
<!--  25/09/2017 -->
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Formulaire Client</title>
	    <script	 src="./fonctions.js">     </script>
  </head>
  <body>
	<form action= "" method="post" enctype="multipart/form-data">
		<fieldset>
		<legend><b>Insérer un nouveau client</b></legend>
		<br />
		<label for="nom">*Nom : </label><input type="text" name="nom" size="30" maxlength="25"  value="<?php ValeurInitiale('nom'); ?>" required><br />
		<label for="prenom">*Prénom : </label><input type="text" name="prenom" size="30" maxlength="25"  value="<?php ValeurInitiale('prenom'); ?>" required><br />	
		<label for="pays" >Pays : </label>
		 
		<select name="pays" size="1">
		<?php
		ValeurInitialeOption('pays');	
		echo'<option value="">------</option>';	
		AfficherLignePays($tabpays,$nblignes);
		?>
		</select>
		
		
		<br />
		<label for="localite">*Localité : </label><input type="text" name="localite" size="30" maxlength="50" placeholder="localite ?" value="<?php ValeurInitiale('localite'); ?>" required><br />
		<label for="typeclient">Type Client : </label>
		<select name="typeclient" size="1">
		<?php
		ValeurInitialeOption('typeclient');	
		echo'<option value="">------</option>';		
		?>
		  <option value="Particulier"    > Particulier</option>
		  <option value="Administration"  > Administration</option>
		  <option value="Grand compte"    > Grand compte</option>
		  <option value="PME"    > PME </option>
		</select>
		<br />
		<label for="ca">Chiffre d'affaires : </label><input type="text" name="ca" size="5" maxlength="5" value="<?php ValeurInitiale('ca'); ?>"><br />	
	  </fieldset>
        <br />
		<input type="submit" name="EN" value="Envoyer"> 		&nbsp;&nbsp;&nbsp;
		<input type="reset" name="RE" value="Effacer">        &nbsp;&nbsp;&nbsp;
        <br />
	  <br />	  
	</form>
	 <a href="supprimerclient.php"><button>Annuler</button></a>
  </body>
</html>
