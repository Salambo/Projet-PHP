<html lang="fr">
  <head>
    <meta charset="utf-8">	
	<title>Transformation des caractères</title>
  </head>
  <body>
  
  <?php
  
  
	function mbStringToArray ($string) { 
    $strlen = mb_strlen($string); 
    while ($strlen) { 
        $array[] = mb_substr($string,0,1,"UTF-8"); 
        $string = mb_substr($string,1,$strlen,"UTF-8"); 
        $strlen = mb_strlen($string); 
		} 
    return $array; 
	} 

	function adieuEspacesTirets($mot){
		$mot= preg_replace('/(  +)/i',' ',$mot);
		$mot= preg_replace('/ - /i','-',$mot);
		$mot=strtolower($mot);
		$mot= remplaceAccents($mot);
		$chars=mbStringToArray($mot);
		while ((preg_match('/ /i',$chars[0]))||(preg_match('/-/i',$chars[0]))){
			$suppr= array_shift($chars);
		}
		$j=sizeof($chars)-1;
		while ((preg_match('/ /i',$chars[$j]))||(preg_match('/-/i',$chars[$j]))){
			$suppr= array_pop($chars);
			$j=sizeof($chars)-1;
		}
		$chars=TransformationPremLettre($chars);
		$mot=implode($chars);
		return $mot;
		
	}
	function remplaceAccents($chaine)
    {
	$chaine= strtr($chaine,
   "ÀÂÄÔÖÈÉÊËÎÏÙÛÜÇ",
   "àâäôöèéêëîïùûüç");
	$chaine= preg_replace('/ø/i','o',$chaine);
	$chaine= preg_replace('/ñ/i','n',$chaine);
	$chaine= preg_replace('/æ/i','ae',$chaine);
	$chaine= preg_replace('/Æ/i','ae',$chaine);
	$chaine= preg_replace('/œ/i','oe',$chaine);
	$chaine= preg_replace('/Œ/i','oe',$chaine);
	return $chaine;
    } 
	function TransformationPremLettre($chars){
		for($i=0;$i<=(sizeof($chars)-1);$i++){
			if($i==sizeof($chars)-1 && $i!=0){
				if($chars[$i]=="'"){
					return $chars;
				}
				else{
					if($chars[$i-1]=='-' || $chars[$i-1]==' '|| $chars[$i-1]=="'"){
						$chars[$i]=TransformationAccent($chars[$i]);
						$chars[$i]=strtoupper($chars[$i]);
					}
				}
			}
			else{	
				if($i==0){
				$chars[$i]=TransformationAccent($chars[$i]);
				$chars[$i]=strtoupper($chars[$i]);
				}
				if($chars[$i]=='-' || $chars[$i]==' '|| $chars[$i]=="'"){
				$chars[$i+1]=TransformationAccent($chars[$i+1]);
				$chars[$i+1]=strtoupper($chars[$i+1]);
				}
			}
		}
		return $chars;
	}
	
	function ChangementPrenom($prenom){
		$prenom=ajoutApostrophe($prenom);
		return $prenom;
		
	}
	
	//Pour nom seulement
	function TransformationAccent($str, $encoding='utf-8')
{
 
    $str = htmlentities($str, ENT_NOQUOTES, $encoding);
 
    $str = preg_replace('#&([A-za-z])(?:acute|grave|cedil|circ|orn|ring|slash|th|tilde|uml);#', '\1', $str);
    $str = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $str);
    $str = preg_replace('#&[^;]+;#', '', $str);
 
		return $str;
	}
	
	function ajoutApostrophe($mot){
		$mot= preg_replace('/\'/i','\'\'',$mot);
		return $mot;
	}
	
	function ChangementNom($nom){
		$nom= TransformationAccent($nom);
		$nom = strtoupper ($nom);
		$nom = ajoutApostrophe($nom);
		return $nom;
	}
	
	/*Partie Salomé: C'est encore le bordel, mais ça marche*/
	function regex($modele,$ch)
	{
	if(preg_match("#$modele#i",$ch,$tab))
	{
	return 0;
	}
	else 
		return 1;
	}
	
	function unregex($modele,$ch)
	{
		if(preg_match("#$modele#i",$ch,$tab))
		{
			return 1;
		}
	else 
		return 0;
	}
	
	function doubleApostrophe($nom){
		$modele = "[|']{2,}";
		return unregex($modele,$nom);
	}
	function tripleTirets($nom){
		$modele = "[\-]{3,}";
		return unregex($modele,$nom);
	}
	function doubleTirets($nom){
		$modele = "[\-]{2,}";
		return unregex($modele,$nom);
	}
	
	function pasNombre($nom){
		$modele = "[0-9]";
		return unregex($modele,$nom);
	}
	
	function desNombres($mot){
		$modele = "[0-9]";
		return regex($modele,$nom);
	}	
	
	function caracteresSpeciaux($nom){//Chercher les caractères autorisés!
		if (preg_match("/^[a-zA-Z\-'àâäôöèéêëîïùûüÿç ]+$/",$nom)){
		return 0;}
		else return 1;
	}
	
	function caracteresSpeciauxLoca($nom){//Chercher les caractères autorisés pour loca!
		if (preg_match("/^[a-zA-Z0-9\-'àâäôöèéêëîïùûüÿç ]+$/",$nom)){
		return 0;}
		else return 1;
	}
	
	function yaDesLettres($nom){
		$modele = "[\-']";
		return unregex($modele,$nom);
	}
	
	function Chiffre($nom){
		if ( is_numeric($nom))
		return 0;
		else return 1;
	}
	
	function testNom($nom){
		$value=0;
		$value=$value+caracteresSpeciaux($nom);
		$value=$value+doubleApostrophe($nom);
		$value=$value+tripleTirets($nom);
		$value=$value+pasNombre($nom);
		$value=$value+yaDesLettres($nom);
		$value=$value+testTaille($nom);
		$value=$value+testLeo($nom);
		return $value;
	}
	
	function testLocalite($nom){
		$value=0;
		$value=$value+caracteresSpeciauxLoca($nom);
		$value=$value+doubleApostrophe($nom);
		$value=$value+doubleTirets($nom);
		$value=$value+yaDesLettres($nom);
		$value=$value+testTaille($nom);
		$value=$value+testLeo($nom);
		return $value;
	}
	
	function testCA($mot){
		$value=0;
		$value=$value+Chiffre($mot);
		return $value;
	}
	
	function testPrenom($nom){
		$value=0;
		$value=$value+caracteresSpeciaux($nom);
		$value=$value+doubleApostrophe($nom);
		$value=$value+pasNombre($nom);
		$value=$value+doubleTirets($nom);
		$value=$value+yaDesLettres($nom);
		$value=$value+testTaille($nom);
		return $value;
	}
	//TestLeo à améliorer
	function testLeo($nom){
		$tab=explode('--', $nom);
		if(sizeof($tab)<=2){
			return 0;
		}
		return 1;
		
	}
	
	function testTaille($nom){
		$nom=TransformationAccent($nom);
		if(strlen($nom)<=25){
			return 0;
		}
		return 1;
	}
	
	function motValide($value,$nom){
		if($value==0){
			return true;
		}
		return false;
	}

	
	
?>

