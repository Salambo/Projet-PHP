--------------------------------------------------------
--  Fichier cr�� - samedi-octobre-30-2010   
-- modifi� le 10/10/2017
--------------------------------------------------------

--------------------------------------------------------
--  DDL for Tables CDI
--------------------------------------------------------

drop table CDI_ARTICLE cascade constraints;
drop table CDI_CLIENT cascade constraints;
drop table CDI_COMMANDE cascade constraints;
drop table CDI_FOURNISSEUR cascade constraints;
drop table CDI_LIGCDE cascade constraints;
drop table CDI_LIGLIV cascade constraints;
drop table CDI_LIVRAISON cascade constraints;
drop table CDI_MAGASIN cascade constraints;

CREATE TABLE CDI_ARTICLE 
(	"AR_NUMERO" CHAR(8), 
	"FO_NUMERO" CHAR(8), 
	"AR_NOM" VARCHAR2(25), 
	"AR_POIDS" NUMBER(10,3), 
	"AR_COULEUR" VARCHAR2(20), 
	"AR_STOCK" NUMBER(4,0), 
	"AR_PA" NUMBER(5,2), 
	"AR_PV" NUMBER(5,2),
   ar_poicode NUMBER(1) ,
    CONSTRAINT PK_CDI_ARTICLE PRIMARY KEY (AR_NUMERO)  
);

CREATE TABLE CDI_CLIENT 
(
	CL_NUMERO CHAR(8),
	CL_NOM VARCHAR2(25),
	CL_PRENOM NVARCHAR2(25),
	CL_PAYS VARCHAR2(64),
	CL_LOCALITE VARCHAR2(20),
	CL_CA NUMBER(7),
	CL_TYPE VARCHAR2(16),
	EMP_ENUME NUMBER(4) 
);

CREATE TABLE CDI_COMMANDE 
(	"CO_NUMERO" CHAR(8), 
	"CO_DATE" DATE, 
	"CL_NUMERO" CHAR(8), 
	"MA_NUMERO" CHAR(8)
);

CREATE TABLE CDI_FOURNISSEUR
(	"FO_NUMERO" CHAR(8), 
	"FO_NOM" CHAR(25),
    CONSTRAINT PK_CDI_FOURNISSEUR PRIMARY KEY (FO_NUMERO)  
) ;

CREATE TABLE CDI_LIGCDE 
(	"LIC_QTCMDEE" NUMBER(*,0), 
	"LIC_QTLIVREE" NUMBER(*,0), 
	"LIC_PU" FLOAT(126), 
	"CO_NUMERO" CHAR(8), 
	"AR_NUMERO" CHAR(8), 
	"DATE_LIV" DATE
) ;

CREATE TABLE CDI_LIGLIV 
(	"LIL_QTLIVREE" NUMBER(3,0), 
	"LI_NUMERO" CHAR(8), 
	"AR_NUMERO" CHAR(8)
) ;

CREATE TABLE CDI_LIVRAISON 
(	"LI_NUMERO" CHAR(8), 
	"MA_NUMERO" CHAR(8), 
	"CO_NUMERO" CHAR(8), 
	"CL_NUMERO" CHAR(8), 
	"DATE_LIV" DATE
);

CREATE TABLE CDI_MAGASIN 
(	
  "MA_NUMERO" CHAR(8), 
	"MA_LOCALITE" VARCHAR2(25), 
	"MA_NOM_GERANT" VARCHAR2(25),
	"MA_PRENOM_GERANT" VARCHAR2(25)
);


---------------------------------------------------
--   DATA FOR  CDI
---------------------------------------------------
REM INSERTING into CDI_MAGASIN
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M01','PARIS 5E','BERTON','Louis');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M02','PARIS 10E','JANNEAU','Luc');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M03','LYON','MOUILLARD','Marcel');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M04','MARSEILLE','CAMUS','Marius');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M05','MONTPELLIER','BAIJOT','Marc');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M06','BORDEAUX','DETIENNE','Nicole');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M07','NANTES','DUMONT','Henri');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M08','TOURS','DEMARTEAU','Ren�e');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M09','ROUEN','NOSSENT','Daniel');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M10','LILLE','NIZET','Jean-Luc');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M11','BRUXELLES','VANDAELE','Annick');
Insert into CDI_MAGASIN (MA_NUMERO,MA_LOCALITE,MA_NOM_GERANT,MA_PRENOM_GERANT) values ('M12','LIEGE','HANNEAU','Vincent');

REM INSERTING into CDI_FOURNISSEUR
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F01','CATI O ELECTRONIC   ');
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F02','LES STYLOS REUNIS   ');
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F03','MECANIQUE DE PRECISION   ');
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F04','SARL ROULAND   ');
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F05','ELECTROLAMP    ');
Insert into CDI_FOURNISSEUR (FO_NUMERO,FO_NOM) values ('F06','RAMONAGE BDD   ');

REM INSERTING into CDI_ARTICLE
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A31','F06','SOURIS',35,'Vert',5,2,5);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A21','F06','COLLE',60,'BLANC',10,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A22','F03','COLLE',60,'BLANC',34,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A25','F01','COLLE',null,'BLANC',10,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A26','F02','COLLE',60,'BLANC',15,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A27','F05','COLLE',60,'BLANC',1,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A01','F04','AGRAFEUSE',150,'ROUGE',3,7,10);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A02','F01','CALCULATRICE',100,'NOIR',null,25,40);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A03','F04','CACHEUR-DATEUR',100,'BLANC',3,15,25);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A04','F05','LAMPE',550,'ROUGE',48,18,28);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A05','F05','LAMPE',550,'BLANC',666,18,28);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A06','F05','LAMPE',550,'BLEU',null,18,28);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A07','F05','LAMPE',550,'VERT',3,18,28);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A08','F03','PESE-LETTRE 1-500',1230,null,null,28,35);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A09','F03','PESE-LETTRE 1-1000',null,null,3,30,39);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A10','F02','CRAYON',20,'ROUGE',null,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A11','F02','CRAYON',20,'BLEU',null,3,4);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A12','F02','CRAYON LUXE',20,'ROUGE',8,3,4);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A13','F02','CRAYON LUXE',20,'VERT',7,3,4);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A14','F02','CRAYON LUXE',20,'BLEU',null,3,4);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A15','F02','CRAYON LUXE',20,'NOIR',null,3,5);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A20','F01','COLLE',60,'BLANC',null,1,3);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A28','F03','Surligneur',10,'JAUNE',0,1,2);
Insert into CDI_ARTICLE (AR_NUMERO,FO_NUMERO,AR_NOM,AR_POIDS,AR_COULEUR,AR_STOCK,AR_PA,AR_PV) values ('A30','F01','Calculatrice',80,'Bleu',null,6,15);

REM INSERTING into CDI_CLIENT
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C01     ','DEFRERE','Marc','FRANCE','PARIS',null,'Particulier','7934');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C02     ','DECERF','Jean','FRANCE','PARIS',null,'Particulier','7934');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C03     ','DEFAWE','Leon','BELGIQUE','LIEGE',null,'Particulier','7900');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C04     ','NOSSENT','Serge','BELGIQUE','BRUXELLES',null,'Particulier','7654');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C05     ','JACOB','Marthe','FRANCE','MARSEILLE','31','Administration','4');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C06     ','JAMAR','Pierre','BELGIQUE','LIEGE','21','Administration','8');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C07     ','DECKERS','Willian','FRANCE','LYON','140','Grand compte','7436');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C08     ','DECLERCQ','Lucien','BELGIQUE','BRUXELLES','349','Grand compte','7436');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C09     ','DEFYZ','Maurice','FRANCE','BORDEAUX',null,'Particulier','6');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C10     ','DEFOOZ','Francis','FRANCE','LILLE',null,'Particulier','7844');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C11     ','RAMJOIE','Victor','FRANCE','NANTES',null,'Particulier','7436');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C12     ','RENARDY','Jean','FRANCE','MARSEILLE','275','Grand compte','7900');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C13     ','MANTEAU','Yvan','FRANCE','CAEN','105','Grand compte','7902');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C14     ','JONAS','Henri','FRANCE','PARIS','190','PME','7436');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C15     ','DELVENNE','Christian','FRANCE','LYON','590','Grand compte','7436');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C16     ','DEFEEZ','Andr�','FRANCE','LYON',null,'Particulier','5814');
Insert into CDI_CLIENT (CL_NUMERO,CL_NOM,CL_PRENOM,CL_PAYS,CL_LOCALITE,CL_CA,CL_TYPE,EMP_ENUME) values ('C113    ','MUDA','Robert','FRANCE','IFS',null,'Particulier',null);

REM INSERTING into CDI_COMMANDE
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9713   ',to_timestamp('04/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C07','M10');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9701   ',to_timestamp('02/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C07','M03');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9702   ',to_timestamp('03/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C06','M12');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9703   ',to_timestamp('03/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C13','M01');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9704   ',to_timestamp('03/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C01','M02');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9705   ',to_timestamp('05/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C08','M11');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9706   ',to_timestamp('08/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C05','M04');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9707   ',to_timestamp('12/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C04','M11');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9708   ',to_timestamp('13/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C03','M12');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9709   ',to_timestamp('13/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C10','M11');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9710   ',to_timestamp('16/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C01','M11');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9711   ',to_timestamp('16/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C12','M01');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9712   ',to_timestamp('18/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C01','M11');
Insert into CDI_COMMANDE (CO_NUMERO,CO_DATE,CL_NUMERO,MA_NUMERO) values ('C9714   ',to_timestamp('25/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),'C06','M04');

REM INSERTING into CDI_LIVRAISON
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9701   ','M03','C9701   ','C07',to_timestamp('17/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9702   ','M12','C9702   ','C06',to_timestamp('13/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9703   ','M01','C9703   ','C13',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9704   ','M02','C9704   ','C01',to_timestamp('04/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9705   ','M11','C9705   ','C08',to_timestamp('06/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9706   ','M04','C9706   ','C05',to_timestamp('09/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9707   ','M11','C9707   ','C04',to_timestamp('01/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9708   ','M12','C9708   ','C03',to_timestamp('15/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9709   ','M11','C9709   ','C10',to_timestamp('16/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9710   ','M11','C9710   ','C01',to_timestamp('23/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9711   ','M01','C9711   ','C12',to_timestamp('24/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIVRAISON (LI_NUMERO,MA_NUMERO,CO_NUMERO,CL_NUMERO,DATE_LIV) values ('L9712   ','M11','C9712   ','C01',to_timestamp('18/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));

REM INSERTING into CDI_LIGCDE
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (4,1,28,'C9713   ','A04',to_timestamp('01/09/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,25,'C9713   ','A03',to_timestamp('01/09/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (10,4,2,'C9713   ','A10',to_timestamp('03/09/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,28,'C9701   ','A04',to_timestamp('17/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,2,'C9702   ','A10',to_timestamp('13/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (2,1,3,'C9702   ','A11',to_timestamp('13/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,3,3,'C9702   ','A14',to_timestamp('13/05/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,40,'C9703   ','A02',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (2,2,25,'C9703   ','A03',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (5,5,5,'C9703   ','A15',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,3,'C9703   ','A14',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,3,'C9703   ','A13',to_timestamp('26/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (2,0,40,'C9704   ','A02',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,0,3,'C9704   ','A12',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (10,0,3,'C9704   ','A13',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (8,0,5,'C9704   ','A15',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,0,28,'C9704   ','A05',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,28,'C9705   ','A06',to_timestamp('10/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,35,'C9705   ','A08',to_timestamp('10/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,2,'C9706   ','A10',to_timestamp('20/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,0,28,'C9707   ','A07',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,1,10,'C9708   ','A01',to_timestamp('01/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,3,3,'C9709   ','A12',to_timestamp('30/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,3,3,'C9709   ','A13',to_timestamp('30/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,3,3,'C9709   ','A14',to_timestamp('30/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,3,5,'C9709   ','A15',to_timestamp('30/06/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (8,8,3,'C9710   ','A12',to_timestamp('10/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (9,3,3,'C9710   ','A02',to_timestamp('10/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (1,0,39,'C9711   ','A09',null);
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (5,5,5,'C9712   ','A15',to_timestamp('15/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));
Insert into CDI_LIGCDE (LIC_QTCMDEE,LIC_QTLIVREE,LIC_PU,CO_NUMERO,AR_NUMERO,DATE_LIV) values (3,1,25,'C9712   ','A03',to_timestamp('15/07/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'));

REM INSERTING into CDI_LIGLIV
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (4,'L9711   ','A10 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9711   ','A03 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9711   ','A04 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9701   ','A04 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9702   ','A10 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9702   ','A11 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9702   ','A14 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9703   ','A02 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (2,'L9703   ','A03 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (5,'L9703   ','A15 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9703   ','A14 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9703   ','A13 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9704   ','A02 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9704   ','A12 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9704   ','A13 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9704   ','A15 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9704   ','A05 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9705   ','A06 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9705   ','A08 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9706   ','A10 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9707   ','A07 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9708   ','A01 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9709   ','A12 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9709   ','A13 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9709   ','A15 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9709   ','A14 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (3,'L9710   ','A02 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (8,'L9710   ','A12 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (0,'L9711   ','A09 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (1,'L9712   ','A03 ');
Insert into CDI_LIGLIV (LIL_QTLIVREE,LI_NUMERO,AR_NUMERO) values (5,'L9712   ','A05 ');
------------------------------------- SPECIAL -----------


commit;
SELECT CL_NUMERO, CL_NOM as NOM, CL_PRENOM as PRENOM, CL_LOCALITE as LOCALITE from CDI_CLIENT where CL_NUMERO not in (SELECT CL_NUMERO from CDI_COMMANDE) ORDER BY CL_NOM