USE dbPhonebookCompany
;




CREATE TABLE Agenda ( 
	IdAgenda int identity(1,1)  NOT NULL,
	Codigo nvarchar(5) NOT NULL,
	Nombre nvarchar(100) NOT NULL,
	Email nvarchar(100) NOT NULL,
	Habilitado bit NOT NULL,
	ImagenRuta nvarchar(200) NOT NULL,
	LineaDirecta nvarchar(20) NOT NULL,
	Interno nvarchar(20) NOT NULL,
	Corporativo nvarchar(20) NOT NULL,
	IdCargo smallint NOT NULL,
	IdUbicacion smallint NOT NULL
)
;

CREATE TABLE Area ( 
	IdArea smallint identity(1,1)  NOT NULL,
	Codigo nvarchar(5) NOT NULL,
	Descripcion nvarchar(100) NOT NULL
)
;

CREATE TABLE Cargo ( 
	IdCargo smallint identity(1,1)  NOT NULL,
	Codigo nvarchar(5) NOT NULL,
	Descripcion nvarchar(100) NOT NULL,
	IdArea smallint NOT NULL
)
;

CREATE TABLE Ubicacion ( 
	IdUbicacion smallint identity(1,1)  NOT NULL,
	Descripcion nvarchar(100) NOT NULL
)
;


ALTER TABLE Agenda
	ADD CONSTRAINT UQ_Agenda_Codigo UNIQUE (Codigo)
;

CREATE INDEX IXFK_Agenda_Cargo
	ON Agenda (IdCargo ASC)
;

CREATE INDEX IXFK_Agenda_Ubicacion
	ON Agenda (IdUbicacion ASC)
;

ALTER TABLE Area
	ADD CONSTRAINT UQ_Area_Codigo UNIQUE (Codigo)
;

CREATE INDEX IXFK_Cargo_Area
	ON Cargo (IdArea ASC)
;

ALTER TABLE Cargo
	ADD CONSTRAINT UQ_Cargo_Codigo UNIQUE (Codigo)
;

ALTER TABLE Agenda ADD CONSTRAINT PK_Agenda 
	PRIMARY KEY CLUSTERED (IdAgenda)
;

ALTER TABLE Area ADD CONSTRAINT PK_Area 
	PRIMARY KEY CLUSTERED (IdArea)
;

ALTER TABLE Cargo ADD CONSTRAINT PK_Cargo 
	PRIMARY KEY CLUSTERED (IdCargo)
;

ALTER TABLE Ubicacion ADD CONSTRAINT PK_Ubicacion 
	PRIMARY KEY CLUSTERED (IdUbicacion)
;



ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_Cargo 
	FOREIGN KEY (IdCargo) REFERENCES Cargo (IdCargo)
;

ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_Ubicacion 
	FOREIGN KEY (IdUbicacion) REFERENCES Ubicacion (IdUbicacion)
;

ALTER TABLE Cargo ADD CONSTRAINT FK_Cargo_Area 
	FOREIGN KEY (IdArea) REFERENCES Area (IdArea)
;
