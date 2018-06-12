<?php 

		include 'transformation-nom2.php';	
		if (isset($_POST['nom']))
			{
				if (!empty($_POST['nom']))
				{
					$nom=$_POST['nom'];
					$nom=adieuEspacesTirets($nom);
					if(motValide(testNom($nom),$nom)){
						$nom = ChangementNom($nom);
					
					}
					else{
					$erreur= 'Nom non valide';
					echo 'Nom non valide </br>';
					}
				}
				else{
					$erreur= 'nom non rempli';
					echo 'Nom non rempli </br>';
					}
			}
			
		if (isset($_POST['prenom']))
			{
				if (!empty($_POST['prenom']))
				{
					$prenom=$_POST['prenom'];
					$prenom=adieuEspacesTirets($prenom);
					if(motValide(testPrenom($prenom),$prenom)){
						$prenom = ChangementPrenom($prenom);
					}
					else{
					$erreur= 'Prenom non valide';
					echo 'Prenom non valide </br>';
					}
				}
				else{
					$erreur= 'Prenom non rempli';
					echo 'Prenom non rempli </br>';
					}
				
			}
		
			
		if (isset($_POST['localite']))
			{
				if (!empty($_POST['localite']))
				{
					$localite=$_POST['localite'];
					$localite=adieuEspacesTirets($localite);
					if(motValide(testLocalite($localite),$localite)){
						$localite=ChangementNom($localite);
					}
					else{
					$erreur= 'Localite non valide';
					echo 'Localite non valide </br>';
					}
				}
				else{
					$erreur= 'Localite non valide';
					echo 'Localite non valide </br>';
					}
			}
	
		if (isset($_POST['ca']))
				{
					if (!empty($_POST['ca']))
					{
						
						if ($_POST['typeclient'] != 'Particulier'){
							$ca=$_POST['ca'];
							if(!motValide(testCA($ca),$ca)){
								$erreur= 'CA non valide';
								echo 'CA non valide </br>';
							}
							
						}
						else{
						$erreur= 'Un client particulier ne peut pas avoir de CA';
						echo 'Un client particulier ne peut pas avoir de CA </br>';
						}
						
					}
					else $ca="";
					
				}
				
				if ($erreur == null){
					
				$req="select CL_NOM, CL_PRENOM, CL_LOCALITE from CDI_CLIENT where CL_NOM='$nom' and CL_PRENOM='$prenom' and CL_LOCALITE='$localite'";		
				$cur=PreparerRequete($conn,$req);
				$r=executerRequete($cur);
				
				$nblignes=LireDonnees($cur,$tab);
				if($nblignes!=0){$erreur= 'Ce client existe déjà';
				echo 'Ce client existe déjà <br/>';}}
?>