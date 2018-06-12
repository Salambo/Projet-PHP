<?php
session_start();

require_once 'fonc_oracle.php';
$session='ETU2_41';
$mdp='ETU2_41';
$instance='spartacus.iutc3.unicaen.fr:1521/info.iutc3.unicaen.fr';
$conn=OuvrirConnexion($session,$mdp,$instance);
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
	
<?php
//if( isset ($_GET['action']))
if( isset ($_POST['EN']))
{
		if ((isset($_POST['client'])) && (isset($_POST['article'])) && (isset($_POST['magasin'])))
			{
				if ((!empty($_POST['client'])) && (!empty($_POST['magasin'])) && (!empty($_POST['article'])))
				{
					echo '<h1>Suite de l\'insertion de la commande </h1>';
					
					$client=$_POST['client'];
					
					$magasin=$_POST['magasin'];
					
					$article=$_POST['article'];
					
					echo '<form name="client_s" action= "" method="post" enctype="multipart/form-data">';
					
					for ($i = 0; $i < sizeof($article); $i++){
						$req="select AR_NUMERO, AR_NOM, AR_COULEUR from CDI_ARTICLE where AR_NUMERO='$article[$i]'";		
						$cur=PreparerRequete($conn,$req);
						$r=executerRequete($cur);
						$nblignes=LireDonnees($cur,$tab);
						AfficherLigneArticle2($tab,$nblignes);
						
					}
					
					echo '<input type="submit" name="EM" value="Envoyer" onclick="return testerValid()">';
					echo '</form>';
					
					
				}
			}
			else {
				
				
				
				
				echo 'erreur';}
		
			
		
		
		
			
			
				
}
				else{
				/*	if( isset ($_POST['EM'])){
						$client=$_POST['client'];
					
						$magasin=$_POST['magasin'];
					
						$article=$_POST['article'];
					echo 'Coucou';
					for ($i = 0; $i < sizeof($article); $i++){
						echo $article[$i];
						if ((isset($_POST['$article[$i]1'])) && (isset($_POST['$article[$i]2'])))
						{
						if ((!empty($_POST['$article[$i]1'])) && (!empty($_POST['$article[$i]2'])))
							{
								echo 'ça marche';
						}}
					}
				}
					else{*/
			
		echo '<form name="client_s" action= "" method="post" enctype="multipart/form-data">';
		echo '<fieldset>';
		echo '<legend><b>Insérer une nouvelle commande</b></legend>';
		echo '<br />';


		

	
			$req="select CL_NUMERO, CL_NOM, CL_PRENOM from CDI_CLIENT";		
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
		
		
		echo '<select name="client" size="1">'; 
		AfficherLigneClient($tab,$nblignes);
		
		echo '</select>';
		
		
		
		echo '<br />';
		echo '<label for="magasin">Magasin: </label>';
		
			$req="select MA_NUMERO as NUM, MA_LOCALITE from CDI_MAGASIN";		
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			
		
		echo '<select name="magasin" size="1">'; 
		AfficherLigneMagasin($tab,$nblignes);
		
		echo '</select>';
		
		?>
		<br />
		<label for="article">Articles : </label></br>
		<?php
			$req="select AR_NUMERO, AR_NOM, AR_COULEUR from CDI_ARTICLE";		
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			AfficherLigneArticle($tab,$nblignes);
		
		
		echo '<br />';
			
	  echo '</fieldset>';
       echo ' <br />';
		echo '<input type="submit" name="EN" value="Envoyer" onclick="return testerValid()">&nbsp;&nbsp;&nbsp;';		
		echo '<input type="reset" name="RE" value="Effacer"> &nbsp;&nbsp;&nbsp;';       
        echo '<br />';
	  echo '<br />';	  
				echo '</form>';}/*}*/
	?>
	<a href="FormulaireCommande.php"><button>Annuler</button></a>
	</br><a href="index.html"><button>Menu</button></a>
  </body>
</html>