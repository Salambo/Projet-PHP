<?php
session_start();
require_once 'fonc_oracle.php';
$session='ETU2_33';
$mdp='ETU2_33';
$instance='spartacus.iutc3.unicaen.fr:1521/info.iutc3.unicaen.fr';
?>



 <!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Client</title>
  </head>
  <body>
  <h1>Client sans commande</h1>
              <?php
				$conn=OuvrirConnexion($session,$mdp,$instance);
				$req="SELECT * from CDI_CLIENT where CL_NUMERO not in (SELECT CL_NUMERO from CDI_COMMANDE) ORDER BY CL_NOM ";				
				$cur=PreparerRequete($conn,$req);
				$r=executerRequete($cur);
				$nblignes=LireDonnees($cur,$tab);
				AfficherDonneeClientPasCommande($tab,$nblignes);
						  
			  ?>
 
<a href="FormulaireClient.php"><button>Ajouter client</button></a>
<a href="index.html"><button>Retour Index</button></a>
  <h1>Client avec commande</h1>

			<?php
				$req="SELECT * from CDI_CLIENT
				where CL_NUMERO  in (SELECT CL_NUMERO from CDI_COMMANDE) ";				
				$cur=PreparerRequete($conn,$req);
				$r=executerRequete($cur);
				$nblignes=LireDonnees($cur,$tab);
				AfficherDonnee($tab,$nblignes);
				
			?>
  
  
  <?php
  $erreur=0;
				if( isset ($_POST['SUP'])){
						if (isset($_POST['clientSupp'])  &&  empty($_POST['clientSupp'])){	
						$erreur= 'erreur, il n\' a pas de client selectionné';
						echo 'erreur, il n\' a pas de client selectionné';
						}
						
					if($erreur==0){
						
							if (isset($_POST['clientSupp'])){
								
								$client= $_POST['clientSupp'];
								Supprimer($client,$conn);
								echo '<script>document.location="supprimerclient.php"</script>';  
							}
					}
				}
				
				if( isset ($_POST['MOD'])){
						if (isset($_POST['clientModif'])  &&  empty($_POST['clientModif'])){	
						$erreur= 'erreur, il n\' a pas de client selectionné';
						echo 'erreur, il n\' a pas de client selectionné';
						}
						
					if($erreur==0){
						
							if (isset($_POST['clientModif'])){
								
								$client= $_POST['clientModif'];
								Modifier($client,$conn);
								 
							}
					}
				}
				if( isset ($_POST['MODIF']))
					{
								$erreur = null;	
								require_once("VerificationClient.php");
								 if ($erreur == null)
											{	
												$num=$_POST['num'];
												$typeclient=$_POST['typeclient'];
												$pays=$_POST['pays'];
												$numero=Calculer($conn);
												$req= "UPDATE   CDI_CLIENT SET CL_NOM ='$nom',CL_PRENOM='$prenom',CL_PAYS='$pays' ,CL_LOCALITE='$localite',CL_CA='$ca',CL_TYPE='$typeclient'
												where CL_NUMERO ='$num'";
													
												$cur=PreparerRequete($conn,$req);
												$r=executerRequete($cur);
												oci_commit($conn);
												echo '<script>document.location="supprimerclient.php"</script>'; 
											
											}
								
					}
				
	?>	
</body>	
</html>
