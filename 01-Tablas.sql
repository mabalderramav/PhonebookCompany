USE dbPhonebookCompany
;




CREATE TABLE Acceso ( 
	IdAcceso int identity(1,1)  NOT NULL,
	Codigo nvarchar(10) NOT NULL,
	Nombre nvarchar(100) NOT NULL,
	Descripcion nvarchar(250) NOT NULL,
	Icono nvarchar(100) NOT NULL,
	Posicion smallint NOT NULL,
	URL nvarchar(250) NOT NULL,
	Habilitado bit NOT NULL,
	Clic bit NOT NULL,
	AccesoRoot nvarchar(10) NOT NULL
)
;

CREATE TABLE AccesoRol ( 
	IdAcceso int NOT NULL,
	IdRol smallint NOT NULL
)
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
	AccesoDirecto nvarchar(10) NOT NULL,
	IdCargo smallint NOT NULL,
	IdUbicacion smallint NOT NULL
)
;

CREATE TABLE AgendaUsuario ( 
	IdAgenda int NOT NULL,
	IdUsuario int NOT NULL
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

CREATE TABLE Rol ( 
	IdRol smallint identity(1,1)  NOT NULL,
	Descripcion nvarchar(100) NOT NULL
)
;

CREATE TABLE Ubicacion ( 
	IdUbicacion smallint identity(1,1)  NOT NULL,
	Descripcion nvarchar(100) NOT NULL
)
;

CREATE TABLE Usuario ( 
	IdUsuario int identity(1,1)  NOT NULL,
	Nombre nvarchar(50) NOT NULL,
	Clave nvarchar(20) NOT NULL,
	Disponible bit NOT NULL,
	IdRol smallint NOT NULL
)
;


ALTER TABLE Acceso
	ADD CONSTRAINT UQ_Acceso_Codigo UNIQUE (Codigo)
;

CREATE INDEX IXFK_AccesoRol_Rol
	ON AccesoRol (IdRol ASC)
;

CREATE INDEX IXFK_AccesoRol_Acceso
	ON AccesoRol (IdAcceso ASC)
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

CREATE INDEX IXFK_AgendaUsuario_Usuario
	ON AgendaUsuario (IdUsuario ASC)
;

CREATE INDEX IXFK_AgendaUsuario_Agenda
	ON AgendaUsuario (IdAgenda ASC)
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

CREATE INDEX IXFK_Usuario_Rol
	ON Usuario (IdRol ASC)
;

ALTER TABLE Usuario
	ADD CONSTRAINT UQ_Usuario_Nombre UNIQUE (Nombre)
;

ALTER TABLE Acceso ADD CONSTRAINT PK_Acceso 
	PRIMARY KEY CLUSTERED (IdAcceso)
;

ALTER TABLE AccesoRol ADD CONSTRAINT PK_AccesoRol 
	PRIMARY KEY CLUSTERED (IdAcceso, IdRol)
;

ALTER TABLE Agenda ADD CONSTRAINT PK_Agenda 
	PRIMARY KEY CLUSTERED (IdAgenda)
;

ALTER TABLE AgendaUsuario ADD CONSTRAINT PK_AgendaUsuario 
	PRIMARY KEY CLUSTERED (IdAgenda, IdUsuario)
;

ALTER TABLE Area ADD CONSTRAINT PK_Area 
	PRIMARY KEY CLUSTERED (IdArea)
;

ALTER TABLE Cargo ADD CONSTRAINT PK_Cargo 
	PRIMARY KEY CLUSTERED (IdCargo)
;

ALTER TABLE Rol ADD CONSTRAINT PK_Rol 
	PRIMARY KEY CLUSTERED (IdRol)
;

ALTER TABLE Ubicacion ADD CONSTRAINT PK_Ubicacion 
	PRIMARY KEY CLUSTERED (IdUbicacion)
;

ALTER TABLE Usuario ADD CONSTRAINT PK_Usuario 
	PRIMARY KEY CLUSTERED (IdUsuario)
;



ALTER TABLE AccesoRol ADD CONSTRAINT FK_AccesoRol_Rol 
	FOREIGN KEY (IdRol) REFERENCES Rol (IdRol)
;

ALTER TABLE AccesoRol ADD CONSTRAINT FK_AccesoRol_Acceso 
	FOREIGN KEY (IdAcceso) REFERENCES Acceso (IdAcceso)
;

ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_Cargo 
	FOREIGN KEY (IdCargo) REFERENCES Cargo (IdCargo)
;

ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_Ubicacion 
	FOREIGN KEY (IdUbicacion) REFERENCES Ubicacion (IdUbicacion)
;

ALTER TABLE AgendaUsuario ADD CONSTRAINT FK_AgendaUsuario_Usuario 
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
;

ALTER TABLE AgendaUsuario ADD CONSTRAINT FK_AgendaUsuario_Agenda 
	FOREIGN KEY (IdAgenda) REFERENCES Agenda (IdAgenda)
;

ALTER TABLE Cargo ADD CONSTRAINT FK_Cargo_Area 
	FOREIGN KEY (IdArea) REFERENCES Area (IdArea)
;

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Rol 
	FOREIGN KEY (IdRol) REFERENCES Rol (IdRol)
;
