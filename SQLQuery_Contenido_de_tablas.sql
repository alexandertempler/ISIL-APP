--Esquema Persona--
go
insert into Ubigeo (IdUbigeo,Pais,Departamento,Provincia,Distrito)
			values	('180202', 'Peru', 'Lima', 'Lima', 'Santa Anita'),
					('190202', 'Peru', 'Lima', 'Lima', 'Molina');
go
insert into Empresa (Activo,Descripcion) values (1,'San Ignacio De Loyola');
go
insert into TipoUsuario (Descripcion) values ('Alumno'), ('Profesor');
go
insert into TipoDocumentoCLiente (idTipoDocumentoCliente, Descripcion)values ('1','RUC'),('6','DNI');
go 
Insert into Cliente (IdEmpresa,Nombres,ApellidoMaterno,ApellidoPaterno, RazonSocial,Correo,Direccion,IdUbigeo,Telefono) 
			values	(1, 'Geampier Alexander','Jaucha', 'Calderon',' ', 'geampierjaucha1.s@gmail.com','Jr. Ollantay','180202','939377020');
					--(1, ' ',' ', ' ', 'ISIL.SAC', 'plataformaISIL@gmail.com',' ',' ',' ');
go
insert into Sede (IdEmpresa,Descripcion,Direccion,IdUbigeo,Telefono) 
			values (1,'ISIL LA MOLINA', 'Via Expresa','190202','987654321');
go
insert into ClienteTipoDocumento (IdTipoDocumentoCliente, IdCliente, IdEmpresa, NumeroDocumento) 
			values ('6',1,1,'70691538');
go
insert into Usuario (CodigoUsuario, IdEmpresa, IdCliente, IdTipoUsuario, Activo)
			values ('70691538', 1, 1, 1, 1);
go

--Esquema Acceso--
insert into Identidad (CodigoUsuario, IdEmpresa, Username, Activo) values ('70691538',1,'70691538',1);

--Esquema Educacion-- datetime(dia-mes-ano)
insert into Carrera (IdEmpresa, Descripcion) 
			values (1,'Sistemas de Información'),(1,'Diseño de Software');
go
insert into Curso (CodigoCurso,IdCarrera,IdCurso,Descripcion,Activo,Horas,Creditos) 
			values	('0001',1, 1,'Programación Web',1,24,3),
					('0002',2, 1,'Diseño y Programacion de Base de Datos',1,25,3);
go
insert into Facultad (IdCarrera)



