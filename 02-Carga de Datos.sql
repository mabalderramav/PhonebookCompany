use dbPhonebookCompany
go
------Tabla Area
INSERT INTO Area([Codigo],[Descripcion]) VALUES('1000','Administración y Finanzas'),('2000','Recursos Humanos y Organización & Métodos')
INSERT INTO Area([Codigo],[Descripcion]) VALUES('3000','Gerencia'),('4000','Relaciones Públicas'),('5000','Tecnólogia de la Información')
go
------Tabla Cargo
------Administración y Finanzas
DECLARE @IdArea smallint
set @IdArea = (select Area.IdArea from Area where Area.Codigo = '1000')
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1010','Jefa de Administración y Finanzas', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1020','Coordinador Administrativo', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1030','Asistente de Administración', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1040','Supervisor de Seguridad', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1050','Encargado de Almacen y Adquisiciones', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1060','Supervisor de Mantenimiento', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1070','Jefe de Contabilidad', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1080','Sub-Contador', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1090','Asistente Contable', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1100','Supervisor de Caja', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('1110','Asistente de Caja', @IdArea)
------Recursos Humanos y Organización & Métodos
set @IdArea = (select Area.IdArea from Area where Area.Codigo = '2000')
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('2010','Jefe de RR.HH. y O&M', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('2020','Asistente de RR.HH', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('2030','Analista de RR.HH.', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('2040','Responsable de Adm. de Personal', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('2050','Responsable de Organización y Metodo', @IdArea)
------Gerencia
set @IdArea = (select Area.IdArea from Area where Area.Codigo = '3000')
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('3010','Gerente General', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('3020','Gerente Administrativo', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('3030','Asesor Legal', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('3040','Secretaria de Gerencia', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('3050','Mensajero de Gerencia', @IdArea)
------Relaciones Públicas
set @IdArea = (select Area.IdArea from Area where Area.Codigo = '4000')
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('4010','Jefa de Relaciones Públicas', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('4020','Asistente de Relaciones Públicas', @IdArea)
------Tecnólogia de la Información
set @IdArea = (select Area.IdArea from Area where Area.Codigo = '5000')
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('5010','Jefe de Tecnología de la Información', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('5020','Analista Programador', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('5030','Responsable de Soporte Técnico', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('5040','Asistente de Soporte Tecnico', @IdArea)
INSERT INTO Cargo([Codigo],[Descripcion],[IdArea]) VALUES('5050','Responsable de Adm. Bases de Datos', @IdArea)
------Tabla Ubicación
INSERT INTO Ubicacion([Descripcion]) VALUES('PB')
INSERT INTO Ubicacion([Descripcion]) VALUES('P1')
INSERT INTO Ubicacion([Descripcion]) VALUES('P2')
INSERT INTO Ubicacion([Descripcion]) VALUES('P3')
------Tabla Agenda
Declare @IdCargo smallint,
		@IdUbicacion smallint
set @IdCargo = (select Cargo.IdCargo from Cargo where Cargo.Codigo = '5010')
set @IdUbicacion = (select Ubicacion.IdUbicacion from Ubicacion where Ubicacion.Descripcion = 'P3')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10001','Miguel Aldo Balderrama Vaca','mbalderrama@nanus.com.bo',1,'img/','3-3439391','5010','No tiene',@IdCargo,@IdUbicacion,'*911')
set @IdCargo = (select Cargo.IdCargo from Cargo where Cargo.Codigo = '5020')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10002','Imogene Lucas','ilucas@nanus.com.bo',1,'img/','3-3439392','5020','No tiene',@IdCargo,@IdUbicacion,'*511')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10003','Yoshi Robinson','yrobinson@nanus.com.bo',1,'img/','3-3439392','5020','No tiene',@IdCargo,@IdUbicacion,'*512')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10004','Demetrius Mann','dmann@nanus.com.bo',1,'img/','3-3439392','5020','No tiene',@IdCargo,@IdUbicacion,'*513')
set @IdCargo = (select Cargo.IdCargo from Cargo where Cargo.Codigo = '5030')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10005','Myra Koch','mkoch@nanus.com.bo',1,'img/','3-3439360','5030','(+591)-6085982',@IdCargo,@IdUbicacion,'*610')
set @IdCargo = (select Cargo.IdCargo from Cargo where Cargo.Codigo = '5040')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10006','Basil Hudson','bhudson@nanus.com.bo',1,'img/','3-3439363','5040','(+591)-6086082',@IdCargo,@IdUbicacion,'*755')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10007','Frances Peck','fpeck@nanus.com.bo',1,'img/','3-3439364','5050','(+591)-6086083',@IdCargo,@IdUbicacion,'*756')
set @IdCargo = (select Cargo.IdCargo from Cargo where Cargo.Codigo = '5050')
INSERT INTO Agenda([Codigo],[Nombre],[Email],[Habilitado],[ImagenRuta],[LineaDirecta],[Interno],[Corporativo],[IdCargo],[IdUbicacion],[AccesoDirecto])
	VALUES('10008','Wylie Skinner','wskinner@nanus.com.bo',1,'img/','3-3439364','5060','No tiene',@IdCargo,@IdUbicacion,'*800')
go
-----------Tabla Rol----------------------------------
INSERT INTO Rol([Descripcion]) VALUES('Administrador')
INSERT INTO Rol([Descripcion]) VALUES('Usuario')
-----------Tabla Usuario------------------------------
INSERT INTO Usuario([Nombre],[Clave],[Disponible],[IdRol]) VALUES('admin','admin',1,1)