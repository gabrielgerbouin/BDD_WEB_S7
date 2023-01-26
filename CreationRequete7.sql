drop table if exists TempTableRequete7; 

Create Table TempTableRequete7
(    
nomEval         Varchar (60) NOT NULL,
prenomEval      Varchar (60) NOT NULL, 
moyenne         float check  (moyenne between 0 and 20),
numConcours     smallint NOT NULL);

-- PRIMARY KEY (nomEval)) ;