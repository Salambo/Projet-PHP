<?php 
					
					
					
					
					
					$req="select * from CDI_PAYS";		
					$cur=PreparerRequete($conn,$req);
					$r=executerRequete($cur);
					$nblignes=LireDonnees($cur,$tabpays);
					$num=$tab[0]['CL_NUMERO'];
					$nom=$tab[0]['CL_NOM'];
					$prenom=$tab[0]['CL_PRENOM'];
					$localite=$tab[0]['CL_LOCALITE'];
					$ca=$tab[0]['CL_CA'];
					$pays=$tab[0]['CL_PAYS'];
					$typeclient=$tab[0]['CL_TYPE'];
					

					
						

?>
<form action= "" method="post" enctype="multipart/form-data">
		<fieldset>
		<legend><b>Modifier le client: <?php echo $num?></b></legend>
		<br />
		<label for="nom">*Nom : </label><input type="text" name="nom" size="30" maxlength="50"  value="<?php echo $nom; ?>" required><br />
		<label for="prenom">*Prénom : </label><input type="text" name="prenom" size="30" maxlength="50"  value="<?php echo $prenom; ?>" required><br />	
		<label for="pays" >Pays : </label>
		 
		<select name="pays" size="1">
		 <?php
		echo'<option value="'.$pays.'">'.$pays.'</option>';	
		echo'<option value="">------</option>';	
		AfficherLignePays($tabpays,$nblignes);
		?>
		</select>
		
		
		<br />
		<label for="localite">*Localité : </label><input type="text" name="localite" size="30" maxlength="50" value=" <?php echo $localite?>"required><br />
		<label for="typeclient">Type Client : </label>
		<select name="typeclient" size="1">
		<?php
		echo'<option value="'.$typeclient.'">'.$typeclient.'</option>';	
		echo'<option value="">------</option>';		
		?>
		  <option value="Particulier"    > Particulier</option>
		  <option value="Administration"  > Administration</option>
		  <option value="Grand compte"    > Grand compte</option>
		  <option value="PME"    > PME </option>
		</select>
		<br />
		<label for="ca">Chiffre d'affaires : </label><input type="text" name="ca" size="30" maxlength="50" value="<?php echo $ca ?>"><br />	
		<input type="hidden" name="num" value="<?php echo $num?>"> 	
        <br />
		<input type="submit" name="MODIF" value="Modification du client"> 		
		<input type="reset" name="RE" value="Effacer">    
        <br />
	  <br />
</fieldset>	  
	</form>