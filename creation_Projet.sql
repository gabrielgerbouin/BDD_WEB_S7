drop table if exists MembreJury; 

drop table if exists ParticipeCompetiteur; 

drop table if exists ParticipeClub; 

drop table if exists Evaluation; 

drop table if exists Dirige; 

drop table if exists Dessin; 

drop table if exists Concours; 

drop table if exists Directeur; 

drop table if exists Administrateur; 

drop table if exists Competiteur; 

drop table if exists Evaluateur; 

drop table if exists President; 

drop table if exists Utilisateur; 

drop table if exists Club; 

Create Table Club
(    
numClub    	        smallint NOT NULL auto_increment,
nomClub		        Varchar (60) NOT NULL, 
adresse 	        Varchar(60) NOT NULL,
numTelephone        Varchar(10) NOT NULL,
nombreAdherents 	smallint,
departement 	    Varchar(60) NOT NULL,
region		        VARCHAR(60)NOT NULL, 

PRIMARY KEY (numclub)) ;

Create Table Utilisateur
(
numClub    	        smallint NOT NULL,        
numUtilisateur        	Integer NOT NULL,
nom         	Varchar(40)  NOT NULL, -- 1 er 40 devrait suffire
prenom         	Varchar(40)  NOT NULL, -- 2 eme 40 devrait suffire
age             smallint check (age between 0 and 150),
adresse     	Varchar(60), -- Peut être null si on sait pas 
identifiant     Varchar(20) NOT NULL, -- Doit être renseigner aussi 
motdepasse      Varchar(40) NOT NULL,
dateAdhesion    Date,
PRIMARY KEY (numUtilisateur),
FOREIGN KEY (numClub) REFERENCES Club (numClub)
);


Create Table President 
(    
numPresident	Integer NOT NULL, -- On en crée une meme si c'est une clé étrangere 
prime	VarChar(50) NOT NULL,
PRIMARY KEY (numPresident),
FOREIGN KEY (numPresident) REFERENCES Utilisateur (numUtilisateur)
);

Create Table Evaluateur
(    
numEvaluateur Integer NOT NULL auto_increment,
specialite      VArChar(40),
PRIMARY KEY (numEvaluateur),
FOREIGN KEY (numEvaluateur) REFERENCES Utilisateur (numUtilisateur)
) ;

Create Table Competiteur
( 
numCompetiteur Integer NOT NULL auto_increment,
datePremParticipation    Date,
PRIMARY KEY (numCompetiteur),
FOREIGN KEY (numCompetiteur) REFERENCES Utilisateur (numUtilisateur)
) ;

Create Table Administrateur
( 
numAdministrateur Integer NOT NULL auto_increment,
dateDebut   Date,
PRIMARY KEY (numAdministrateur),
FOREIGN KEY (numAdministrateur) REFERENCES Utilisateur (numUtilisateur)

) ;

Create Table Directeur
( 
numDirecteur Integer NOT NULL auto_increment,
dateDebut   Date,
PRIMARY KEY (numDirecteur),
FOREIGN KEY (numDirecteur) REFERENCES Utilisateur (numUtilisateur)

) ;

Create Table Concours
(
numPresident	Integer NOT NULL auto_increment,
numConcours	integer,
theme  VarChar(60),
descriptif  VarChar(240),
datedeb Date,
datefin Date,
etat	ENUM ('pas commmence', 'en cours', 'attente', 'resultat', 'evalue'),
PRIMARY KEY (numConcours),
FOREIGN KEY (numPresident) REFERENCES President (numPresident)
) ;

Create Table Dessin
( 
numDessin smallint NOT NULL auto_increment ,
numCompetiteur Integer NOT NULL,
numConcours	integer,
commentaire Varchar(240),
classement  smallint, 
dateRemise   Date,
leDessin    VarChar(40), -- Il faudra mettre le format du fichier plus tard 
PRIMARY KEY (numDessin),
FOREIGN KEY (numConcours) REFERENCES  Concours (numConcours),
FOREIGN KEY (numCompetiteur) REFERENCES Competiteur (numCompetiteur)

) ;

Create Table Dirige
( 
numClub smallint,
numDirecteur integer,
PRIMARY KEY (numClub,numDirecteur),
FOREIGN KEY (numClub) REFERENCES  Club (numClub),
FOREIGN KEY (numDirecteur) REFERENCES Directeur (numDirecteur)

) ;

Create Table Evaluation
( 
numDessin smallint,
numEvaluateur integer,
dateEvaluation Date,
note float check  (note between 0 and 20),
commentaire VarChar(240),


PRIMARY KEY (numDessin,numEvaluateur),
FOREIGN KEY (numDessin) REFERENCES  Dessin (numDessin),
FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur (numEvaluateur)

) ;

Create Table ParticipeClub
( 
numClub smallint NOT NULL,
numConcours integer,

PRIMARY KEY (numClub,numConcours),
FOREIGN KEY (numClub) REFERENCES  Club (numClub),
FOREIGN KEY (numConcours) REFERENCES Concours (numConcours)

) ;

Create Table ParticipeCompetiteur
( 
numCompetiteur integer,
numConcours integer,

PRIMARY KEY (numCompetiteur,numConcours),
FOREIGN KEY (numCompetiteur) REFERENCES  Competiteur (numCompetiteur),
FOREIGN KEY (numConcours) REFERENCES Concours (numConcours)

) ;

Create Table MembreJury
( 
numConcours integer,
numEvaluateur integer,
PRIMARY KEY (numConcours,numEvaluateur),
FOREIGN KEY (numConcours) REFERENCES  Concours (numConcours),
FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur (numEvaluateur)

) ;


