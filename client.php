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
              <?php
				

				$conn=OuvrirConnexion($session,$mdp,$instance);
				$req="SELECT CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE from CDI_CLIENT ";				
				$cur=PreparerRequete($conn,$req);
				$r=executerRequete($cur);
				$nblignes=LireDonnees($cur,$tab);
				AfficherDonnee($tab,$nblignes);
				
				
				
				
			//	AfficherTab($tab);
			//	AfficherTab(count($tab[0]));
				$req="SELECT  CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE from CDI_CLIENT order by CL_NUMERO ";				
				$cur=PreparerRequete($conn,$req);
				$r=executerRequete($cur);
				$nblignes=LireDonnees($cur,$tab);
				AfficherDonnee($tab,$nblignes);
				$erreur=0;
				Calculer($tab,$nblignes,$erreur);
			    $conn=FermerConnexion($conn);
			  
			  
			  ?>
 

  </body>
</html>
