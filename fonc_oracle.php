<?php
function OuvrirConnexion($session,$mdp,$instance)
{
  $conn = oci_connect($session, $mdp,$instance,"AL32UTF8");
  if (!$conn) //si pas de connexion retourne une erreur
  {  
	$e = oci_error();
	//avec un message pour pouvoir revenir à la page de connexion
	echo "<br>Votre nom d'utilisateur ou votre mot de passe est &eacute;ronn&eacute;e, veuillez vous reconnecter...<br>";
	exit;
  }
  return $conn;
}

//---------------------------------------------------------------------------------------------
function PreparerRequete($conn,$req)
{
  $cur = oci_parse($conn, $req);
  
  if (!$cur) 
  {  
	$e = oci_error($conn);  
	print htmlentities($e['message']);  
	exit;
  }
  return $cur;
}
//---------------------------------------------------------------------------------------------
function ExecuterRequete($cur)
{
  $r = oci_execute($cur, OCI_DEFAULT);
  if (!$r) 
  {  
	$e = oci_error($r);  
	echo htmlentities($e['message']);  
	exit;
  }
  return $r;
}

//---------------------------------------------------------------------------------------------
function FermerConnexion($conn)
{
  oci_close($conn);
}
//---------------------------------------------------------------------------------------------
function LireDonnees($cur,&$tab)
{
	$nbLignes = oci_fetch_all($cur, $tab,0,-1,OCI_FETCHSTATEMENT_BY_ROW|OCI_ASSOC); 
  return $nbLignes;
}


//---------------------------------------------------------------------------------------------

function AfficherDonnee($tab,$nbLignes)
{echo "<PRE>";
  if ($nbLignes > 0) 
  {
    echo "<table>";
    echo "<tr>";
	for ($i = 0; $i < 1; $i++) 
    {
		foreach ($tab[$i] as $key => $val) 
		{
		  echo "<th>$key  </th>";
		}
	}
	
    echo "<tr></tr>";
    for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
    {
      echo "<tr>";
      foreach ($tab[$i] as $data) // lecture des enregistrements de chaque colonne
	  {
        echo "<td>$data</td>";
      }
    }
    echo "</table>";

  } 
  else 
  {
    echo "Pas de résultat<br />";
  }
echo "</PRE>";  
}
//---------------------------------------------------------------------------------------------

function AfficherTab($tab)
{
	echo '<PRE>';
  print_r($tab);
  echo '</PRE>';
}
//---------------------------------------------------------------------------------------------

function AfficherLignePays($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<option value='.$tab[$i]['NOM'].'>'.$tab[$i]['NOM'].'</option>';
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}


//---------------------------------------------------------------------------------------------


function AfficherLigneClient($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<option value='.$tab[$i]['CL_NUMERO'].'>'.$tab[$i]['CL_NOM']." ".$tab[$i]['CL_PRENOM'].'</option>';
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}


//---------------------------------------------------------------------------------------------

function AfficherLigneMagasin($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<option value='.$tab[$i]['NUM'].'>'.$tab[$i]['MA_LOCALITE'].'</option>';
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}

//---------------------------------------------------------------------------------------------

function AfficherLigneCommande($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<option value='.$tab[$i]['CO_NUMERO'].'>'.$tab[$i]['CO_NUMERO'].'</option>';
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}

//---------------------------------------------------------------------------------------------

function AfficherLigneArticle($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<input type="checkbox" id="coding" name="article[]" value="'.$tab[$i]['AR_NUMERO'].'">';
					echo $tab[$i]['AR_NUMERO']." ".$tab[$i]['AR_NOM']." ".$tab[$i]['AR_COULEUR'];
					echo '</br></input> ';
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}

//---------------------------------------------------------------------------------------------

function AfficherLigneArticle2($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<input type="number" name="'.$tab[$i]['AR_NUMERO'].'1" required></input>';
					echo '<input type="date" name="'.$tab[$i]['AR_NUMERO'].'2" required></input>';
					echo $tab[$i]['AR_NUMERO']." ".$tab[$i]['AR_NOM']." ".$tab[$i]['AR_COULEUR']."</br>";
					
				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}

//---------------------------------------------------------------------------------------------

function AfficherRadioCommande($tab,$nbLignes)
{
if ($nbLignes > 0) 
	
			{

				for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
				{ 
					echo '<input type="radio" name="commande" value="'.$tab[$i]['COMMANDE'].'" >';
					echo $tab[$i]['COMMANDE']." ".$tab[$i]['DATE']." ".$tab[$i]['NOM']." ".$tab[$i]['PRENOM']."";
					echo '</br></input>';

				}
			} 
			else 
			{
			echo "Pas de ligne<br />";
			}
}



//---------------------------------------------------------------------------------------------

function Calculer($conn)
{

			$req="select 'C' ||to_char(max(to_number(substr(cl_numero,2)))+1) as nb from cdi_client";				
			$cur=PreparerRequete($conn,$req);
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			return $tab[0]['NB'];
			
}

//---------------------------------------------------------------------------------------------

function AfficherDonneeClientPasCommande($tab,$nbLignes)
{
	echo "<PRE>";
  if ($nbLignes > 0) 
  {
    echo '<table>';
	echo '<form action="" method="post">';
    echo "<tr>";
	for ($i = 0; $i < 1; $i++) 
    {
		foreach ($tab[$i] as $key => $val) 
		{
		  echo '<th>'.$key.' </th>';
		}
	}
	echo "<th>MODIFIER </th><th> SUPPRIMER </th>";
    echo "<tr></tr>";
    for ($i = 0; $i < $nbLignes; $i++) // balayage de toutes les lignes
    {
      echo "<tr>";
      foreach ($tab[$i] as $data) // lecture des enregistrements de chaque colonne
	  {
        echo "<td>$data</td>";
      }
	  echo '<td><input name="clientModif[]" type="radio" value="'.$tab[$i]['CL_NUMERO'].'"></td>
		<td><input name="clientSupp[]" type="checkbox" value="'.$tab[$i]['CL_NUMERO'].'"></td>';
		echo "</tr>";
    }
	for ($i = 0; $i < 1; $i++) 
    {
		foreach ($tab[$i] as $key => $val) 
		{
		  echo "<td></td>";
		}
	}
echo'<td><input type="submit" name="MOD" value="Modifier"></td><td><input type="submit" name="SUP" value="Supprimer"></td>';
	echo '</form>';
    echo "</table>";
	
  } 
  else 
  {
    echo "Pas de résultat<br />";
  }
echo "</PRE>";  

}

//---------------------------------------------------------------------------------------------

function Supprimer($tab,$conn)
{echo "<PRE>";
foreach ($tab as $data){ 
				$req="DELETE FROM CDI_CLIENT WHERE CL_NUMERO='$data'";			
				$cur=PreparerRequete($conn,$req);		
				$r=executerRequete($cur);			
				oci_commit($conn);
}
 
 
echo "</PRE>";  
}


//---------------------------------------------------------------------------------------------

function Modifier($tab,$conn)
{
echo "<PRE>";

foreach ($tab as $data){
			$req="SELECT * FROM CDI_CLIENT WHERE CL_NUMERO='$data'";			
			$cur=PreparerRequete($conn,$req);		
			$r=executerRequete($cur);
			$nblignes=LireDonnees($cur,$tab);
			require_once("FormulaireClientModifier.php");			
}
 
echo "</PRE>";  
}


//---------------------------------------------------------------------------------------------
function ValeurInitiale($nom)
{
	if(!empty($_POST[$nom])){
		
		if( ($_POST[$nom])!= ""){	
		$val=$_POST[$nom];
		echo $val;
		}

	}

}
//---------------------------------------------------------------------------------------------
function ValeurInitialeOption($nom)
{
	if(!empty($_POST[$nom])){
		
		if( ($_POST[$nom])!= ""){	
		$val=$_POST[$nom];
		echo'<option value="'.$val.'">'.$val.'</option>';
		}

	}

}

?>


