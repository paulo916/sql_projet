#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: EMPLOYEE
#------------------------------------------------------------

CREATE TABLE EMPLOYEE(
        id_employee   Int  Auto_increment  NOT NULL ,
        nom           Varchar (50) NOT NULL ,
        prenom        Varchar (50) NOT NULL ,
        date_embauche Date NOT NULL ,
        poste         Varchar (50) NOT NULL
	,CONSTRAINT EMPLOYEE_PK PRIMARY KEY (id_employee)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SALLE
#------------------------------------------------------------

CREATE TABLE SALLE(
        id_salle        Int  Auto_increment  NOT NULL ,
        nombres_places Int NOT NULL ,
        id_film        Int NOT NULL ,
        id_employee    Int NOT NULL
	,CONSTRAINT SALLE_AK UNIQUE (id_film,id_employee)
	,CONSTRAINT SALLE_PK PRIMARY KEY (id_salle)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: BILLET
#------------------------------------------------------------

CREATE TABLE BILLET(
        id_billet Int  Auto_increment  NOT NULL ,
        prix      Float NOT NULL ,
        heure     TimeStamp NOT NULL ,
        id_film   Int NOT NULL ,
        id_salle   Int NOT NULL
	,CONSTRAINT BILLET_AK UNIQUE (id_film,id_salle)
	,CONSTRAINT BILLET_PK PRIMARY KEY (id_billet)

	,CONSTRAINT BILLET_SALLE_FK FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FILM
#------------------------------------------------------------

CREATE TABLE FILM(
        id_film    Int  Auto_increment  NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        duree      Int NOT NULL ,
        genre      Varchar (50) NOT NULL ,
        age_limite Int NOT NULL ,
        id_billet  Int NOT NULL
	,CONSTRAINT FILM_PK PRIMARY KEY (id_film)

	,CONSTRAINT FILM_BILLET_FK FOREIGN KEY (id_billet) REFERENCES BILLET(id_billet)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir2
#------------------------------------------------------------

CREATE TABLE Appartenir2(
        id_salle Int NOT NULL ,
        id_film Int NOT NULL
	,CONSTRAINT Appartenir2_PK PRIMARY KEY (id_salle,id_film)

	,CONSTRAINT Appartenir2_SALLE_FK FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle)
	,CONSTRAINT Appartenir2_FILM0_FK FOREIGN KEY (id_film) REFERENCES FILM(id_film)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir4
#------------------------------------------------------------

CREATE TABLE Appartenir4(
        id_employee Int NOT NULL ,
        id_salle     Int NOT NULL
	,CONSTRAINT Appartenir4_PK PRIMARY KEY (id_employee,id_salle)

	,CONSTRAINT Appartenir4_EMPLOYEE_FK FOREIGN KEY (id_employee) REFERENCES EMPLOYEE(id_employee)
	,CONSTRAINT Appartenir4_SALLE0_FK FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle)
)ENGINE=InnoDB;

