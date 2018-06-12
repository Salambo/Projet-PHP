<?php
session_start();

require_once 'fonc_oracle.php';
$session='ETU2_41';
$mdp='ETU2_41';
$instance='spartacus.iutc3.unicaen.fr:1521/info.iutc3.unicaen.fr';
$conn=OuvrirConnexion($session,$mdp,$instance);
?>



 <!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Commande</title>
	<link rel="stylesheet" type="text/css" href="test.css" />
  </head>
  <body>
  <h1>Liste des commandes</h1>
  <form name="selectionCommande" action= "" method="post" enctype="multipart/form-data">
  <?php
  

	$req="select CO_NUMERO from CDI_COMMANDE";		
	$cur=PreparerRequete($conn,$req);
	$r=executerRequete($cur);		
	$nblignes=LireDonnees($cur,$tab);
	 
	echo '<select name="commande" size="1">';
	echo' <option value="">------</option>';
	
	AfficherLigneCommande($tab,$nblignes);
	echo '</select>';  
		
	?>
	<input type="submit" name="EN" value="Envoyer" onclick=""> </form>
	</br>
	<form name="selectionClient" action= "" method="post" enctype="multipart/form-data">
	<?php
		$req="select * from CDI_CLIENT where CL_NUMERO in
		(select CL_NUMERO from CDI_COMMANDE)
		order by CL_NOM";		
		$cur=PreparerRequete($conn,$req);
		$r=executerRequete($cur);
		$nblignes=LireDonnees($cur,$tab);	
		
		echo '<form action="" method="post" >';
		echo '<select name="client">';
		echo' <option value="">------</option>';			
		AfficherLigneClient($tab,$nblignes);
		echo '</select>';
	?>
	<input type="submit" name="EM" value="Envoyer" onclick=""> </form> </br>
	<form name="selectionCommandebis" action= "" method="post" enctype="multipart/form-data">
	<?php
		if( isset ($_POST['EN']))
		{
			$commande=$_POST['commande'];
			echo "<h1>Affichage de la commande $commande</h1></br>";
			echo "Détails de la commande: </br></br>";
			$commande="'".$commande."'";
			
			
			$req="SELECT CO_DATE as Commande, CL_NOM as Nom, CL_PRENOM as Prenom, MA_NUMERO as Magasin from CDI_COMMANDE join CDI_CLIENT using(CL_NUMERO) where CO_NUMERO=".$commande."";				
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			AfficherDonnee($tab,$nblignes);
			
			$req="SELECT AR_NUMERO as reference, AR_NOM as Nom, AR_COULEUR as Colori, LIC_QTCMDEE,LIC_QTLIVREE from CDI_ARTICLE join CDI_LIGCDE using(AR_NUMERO) where CO_NUMERO=".$commande."";
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			AfficherDonnee($tab,$nblignes);
			
  
		}
		else{
			if( isset ($_POST['EM'])){
				if (isset($_POST['client']) ){
							
							$client= $_POST['client'];
							echo '<form name="selectionCommande" action= "" method="post" enctype="multipart/form-data">';
							$req="SELECT CO_NUMERO as COMMANDE, CL_NOM as NOM, CL_PRENOM as PRENOM, CO_DATE as \"DATE\" from CDI_COMMANDE join CDI_CLIENT using (CL_NUMERO) where CL_NUMERO='$client'";				
							$cur=PreparerRequete($conn,$req);
							
							$r=executerRequete($cur);
							$nblignes=LireDonnees($cur,$tab);
							echo '<h1>Affichage des commandes du client '.$tab[0]['NOM'].' '.$tab[0]['PRENOM'].'</h1></br>';
							AfficherRadioCommande($tab,$nblignes);
							echo '<input type="submit" name="EN" value="Envoyer" onclick=""> </form>';
							$client=null;
						}
			}
			else{
		echo '<fieldset>';
		echo '<form name="selectionCommande" action= "" method="post" enctype="multipart/form-data">';
		$req="SELECT CO_NUMERO as Commande, CO_DATE as \"DATE\", CL_NOM as Nom, CL_PRENOM as Prenom from CDI_COMMANDE join CDI_CLIENT using(CL_NUMERO) ";		
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);		
			$nblignes=LireDonnees($cur,$tab);
		 
		
		AfficherRadioCommande($tab,$nblignes);
		
		echo '<input type="submit" name="EN" value="Envoyer" onclick=""> </form>';
		
	}
		}
		
		/*
		select distinct CO_NUMERO, AR_NUMERO, LIC_QTCMDEE, LIC_QTLIVREE from CDI_LIGCDE where LIC_QTCMDEE>LIC_QTLIVREE and LIC_QTLIVREE!=0;
		select distinct CO_NUMERO from CDI_LIGCDE where CO_NUMERO not in (select CO_NUMERO from CDI_LIGCDE where LIC_QTCMDEE>LIC_QTLIVREE and LIC_QTLIVREE!=0) and LIC_QTLIVREE=0;
		select distinct CO_NUMERO from CDI_LIGCDE where CO_NUMERO not in (select CO_NUMERO from CDI_LIGCDE where LIC_QTCMDEE>LIC_QTLIVREE) and LIC_QTLIVREE=LIC_QTCMDEE;
		*/
?>
	</br></br><a href="index.html"><button>Menu</button></a>
  </body>
  
 
</html>