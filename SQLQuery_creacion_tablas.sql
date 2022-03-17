CREATE database Sistema_Empresarial;
use Sistema_Empresarial;
--drop DATABASE Sistema_Empresarial--

--Esquema Persona--
create table Cliente (
    IdCliente int IDENTITY(1,1) not null,
    IdEmpresa int not null,
    Nombres NVARCHAR(100) NULL,
    ApellidoMaterno NVARCHAR(100) NULL,
    ApellidoPaterno NVARCHAR(100) NULL,
    RazonSocial NVARCHAR(100) NULL,
    Correo NVARCHAR(100) NULL,
    Direccion NVARCHAR(100) NULL,
    IdUbigeo NVARCHAR(10) NULL,
    Telefono NVARCHAR(10) NULL,
    PRIMARY key (IdCliente, IdEmpresa)
);
-- select * from Cliente; --

create table Ubigeo (
    IdUbigeo NVARCHAR(10) PRIMARY key not null,
    Pais NVARCHAR(50) not null,
    Departamento NVARCHAR(50) not null,
    Provincia NVARCHAR(50) not null,
    Distrito NVARCHAR(50) not null
);

CREATE table ClienteTipoDocumento(
    IdTipoDocumentoCliente NVARCHAR(2) not null,
    IdCliente int not null,
    IdEmpresa int not null,
    NumeroDocumento NVARCHAR(13) not null,
    PRIMARY KEY (IdTipoDocumentoCliente, IdCliente, IdEmpresa)
);

create table TipoDocumentoCLiente (
    idTipoDocumentoCliente NVARCHAR(2) PRIMARY KEY not null,
    Descripcion NVARCHAR(50) not null
);

Create table Usuario (
    CodigoUsuario NVARCHAR(50) not null,
    IdEmpresa int not null,
    IdCliente INT not null,
    IdTipoUsuario TINYINT not null,
    Activo BIT not null,
    PRIMARY KEY(CodigoUsuario, IdEmpresa)
);

create table TipoUsuario (
    IdTipoUsuario TINYINT identity(1,1) PRIMARY KEY not null,
    Descripcion NVARCHAR(50)not null
);

Create table Empresa (
    IdEmpresa int IDENTITY(1,1) PRIMARY KEY,
    Activo BIT not null,
    Descripcion NVARCHAR(50) null
);

create table Sede (
    IdSede int IDENTITY(1,1) PRIMARY key,
    IdEmpresa int not null,
    Descripcion NVARCHAR(50) not null,
    Direccion NVARCHAR(100) not null,
    IdUbigeo NVARCHAR(10) not null,
    Telefono NVARCHAR(50) not null

);
--Llaves Unicas--
ALTER TABLE Cliente ADD CONSTRAINT Uk_IdCliente_1 UNIQUE (IdCliente); 
ALTER TABLE Cliente ADD CONSTRAINT Uk_IdEmpresa_1 UNIQUE (IdEmpresa); 
ALTER TABLE Usuario ADD CONSTRAINT UK_CodigoUsuario_1 UNIQUE (CodigoUsuario); 
ALTER TABLE Usuario ADD CONSTRAINT Uk_IdEmpresa_2 UNIQUE (IdEmpresa); 
ALTER TABLE Usuario ADD CONSTRAINT Uk_IdCliente_2 UNIQUE (IdCliente); 
ALTER TABLE Usuario ADD CONSTRAINT Uk_TipoUsuario_1 UNIQUE (IdTipoUsuario); 
--Llaves Foraneas--
 alter table Cliente add constraint FK_IdEmpresa_1 foreign key (IdEmpresa) references Empresa(IdEmpresa);
 alter table Cliente add constraint FK_IdUbigeo_1 foreign key (IdUbigeo) references Ubigeo(IdUbigeo);
 alter table ClienteTipoDocumento add constraint FK_IdTipoDocumentoCliente_1 foreign key (IdTipoDocumentoCliente) references TipoDocumentoCliente(IdTipoDocumentoCliente);
 alter table ClienteTipoDocumento add constraint FK_IdCliente_1 foreign key (IdCliente) references Cliente(IdCliente);
 alter table ClienteTipoDocumento add constraint FK_IdEmpresa_2 foreign key (IdEmpresa) references Empresa(IdEmpresa);
 alter table Usuario add constraint FK_IdEmpresa_3 foreign key (IdEmpresa) references Cliente(IdEmpresa);
 alter table Usuario add constraint FK_IdCliente_2 foreign key (IdCliente) references Cliente(IdCliente);
 alter table Usuario add constraint FK_IdTipoUsuario_1 foreign key (IdTipoUsuario) references TipoUsuario(IdTipoUsuario);
 alter table Sede add constraint FK_IdEmpresa_4 foreign key (IdEmpresa) references Empresa(IdEmpresa);
 alter table Sede add constraint FK_IdUbigeo_2 foreign key (IdUbigeo) references Ubigeo(IdUbigeo);

--Esquema Acceso--
create table Identidad (
    CodigoUsuario NVARCHAR(50) not null,
    IdEmpresa int not null,
    Username VARCHAR(50) not null,
    HashPassword BINARY not null,
    hashCode varchar(50) not null,
    activo BIT not null,
    PRIMARY key (CodigoUsuario, IdEmpresa)
);
--Llaves Foraneas--
 alter table Identidad add constraint FK_CodigoUsuario_1 foreign key (CodigoUsuario) references Usuario(CodigoUsuario);
 alter table Identidad add constraint FK_IdEmpresa_5 foreign key (IdEmpresa) references Usuario(IdEmpresa);

--Esquema Educacion--
create table Carrera (
    IdCarrera INT IDENTITY(1,1) PRIMARY KEY not null,
    IdEmpresa int not null,
    Descripcion NVARCHAR(50) not null
);

create table Facultad(
    IdFacultad Int IDENTITY(1,1) not null,
    IdCarrera int not null,
    PRIMARY key (IdFacultad, IdCarrera)
);

create table Curso(
    CodigoCurso NVARCHAR(50) not null,
    IdCarrera int  not null,
    IdCurso int  not null,
    Descripcion NVARCHAR(50)  not null,
    Activo bit not null,
    Horas DECIMAL(18,6) not null,
    Creditos INT  not null
    PRIMARY key (CodigoCurso, IdCarrera)
);

create table Aula (
    IdAula int primary Key not null,
    Descripcion NVARCHAR(50) not null,
    IdSede INT not null,
    IdFacultad int null,
    IdCarrera int null,
    Activo BIT not null
)

create table CicloCurso (
    CodigoCiclo NVARCHAR(50) not NULL,
    CodigoUsuarioProfesor NVARCHAR(50) not NULL,
    CodigoCurso NVARCHAR(50) not NULL,
    IdCarrera int,
    primary key (CodigoCiclo, CodigoUsuarioProfesor, CodigoCurso)
);

create table Ciclo(
    CodigoCiclo NVARCHAR(50) PRIMARY key not null,
    Descripcion NVARCHAR(100) not NULL,
    Activo BIT not NULL,
    FechaInicio DATETIME not NULL,
    FechaFin DATETIME not NULL
);
 
Create table Horario (
    IdHorario int IDENTITY(1,1) PRIMARY key not NULL,
    IdAula INT not NULL
);

create table DetalleHorario (
    IdDetalleHorario int IDENTITY(1,1) PRIMARY key not NULL,
    IdHorario int not NULL,
    IdDia int not NULL,
    HoraInicio DATETIME not NULL,
    HoraFin DATETIME not NULL
);

create table Dia (
    IdDia int IDENTITY(1,1) not NULL,
    Descripcion NVARCHAR(50) not NULL
);

create table CicloCursoHorario (
    IdHorario INT  not NULL,
    CodigoCiclo NVARCHAR(50) not NULL,
    CodigoUsuarioProfesor NVARCHAR(50) not NULL,
    CodigoCurso NVARCHAR(50) not NULL,
    IdCarrera INT not NULL,
    PRIMARY key (IdHorario, CodigoCiclo, CodigoUsuarioProfesor,CodigoCurso,IdCarrera)
);

create table Nota(
    IdNota int IDENTITY(1,1) PRIMARY key not NULL,
    Descripcion NVARCHAR(50) not NULL
);

create table HistoricoAcademico (
    IdHistoricoAcademico int identity(1,1) PRIMARY key not NULL,
    IdMatricula int not NULL,
    IdNota int not NULL,
    Calificacion DECIMAL(18,6) not NULL,
    Activo bit not NULL,
    Fecha DATETIME not NULL
);

create table Matricula(
IdMatricula int IDENTITY(1,1) PRIMARY KEY not null,
CodigoUsuarioAlumno NVARCHAR(50) not NULL,
IdEmpresa int not NULL,
IdHorario int not NULL,
CodigoCiclo NVARCHAR(50) not NULL,
CodigoUsuarioProfesor NVARCHAR(50) not NULL,
CodigoCurso NVARCHAR(50) not NULL,
IdCarrera INT not NULL,
Fecha DATETIME not NULL,
Activo BIT not NULL,
Origen NVARCHAR(50) not NULL,
IdUsuarioRegistra NVARCHAR(50) not NULL
);
--Llaves Unicas--
ALTER TABLE Facultad ADD CONSTRAINT Uk_IdFacultad_1 UNIQUE (IdFacultad); 
ALTER TABLE Curso ADD CONSTRAINT Uk_CodigoCurso_1 UNIQUE (CodigoCurso); 
ALTER TABLE Curso ADD CONSTRAINT Uk_IdCarrera_1 UNIQUE (IdCarrera); 
ALTER TABLE Dia ADD CONSTRAINT Uk_IdDia_1 UNIQUE (IdDia); 
ALTER TABLE CicloCurso ADD CONSTRAINT Uk_CodigoCiclo_1 UNIQUE (CodigoCiclo); 
ALTER TABLE CicloCurso ADD CONSTRAINT Uk_CodigoUsuarioProfesor_1 UNIQUE (CodigoUsuarioProfesor); 
ALTER TABLE CicloCurso ADD CONSTRAINT Uk_CodigoCurso_2 UNIQUE (CodigoCurso); 
ALTER TABLE CicloCurso ADD CONSTRAINT Uk_IdCarrera_2 UNIQUE (IdCarrera); 
ALTER TABLE CicloCursoHorario ADD CONSTRAINT Uk_IdHorario_1 UNIQUE (IdHorario); 
ALTER TABLE CicloCursoHorario ADD CONSTRAINT Uk_CodigoCiclo_2 UNIQUE (CodigoCiclo); 
ALTER TABLE CicloCursoHorario ADD CONSTRAINT Uk_CodigoUsuarioProfesor_2 UNIQUE (CodigoUsuarioProfesor); 
ALTER TABLE CicloCursoHorario ADD CONSTRAINT Uk_CodigoCurso_4 UNIQUE (CodigoCurso); 
ALTER TABLE CicloCursoHorario ADD CONSTRAINT Uk_IdCarrera_3 UNIQUE (IdCarrera); 
ALTER TABLE HistoricoAcademico ADD CONSTRAINT Uk_IdMatricula_1 UNIQUE (IdMatricula); 
ALTER TABLE HistoricoAcademico ADD CONSTRAINT Uk_IdNota_1 UNIQUE (IdNota); 

--Llaves Foraneas --
 alter table Carrera add constraint FK_IdEmpresa_6 foreign key (IdEmpresa) references Empresa(IdEmpresa);
 alter table Facultad add constraint FK_IdCarrera_1 foreign key (IdCarrera) references Carrera(IdCarrera);
 alter table Curso add constraint FK_IdCarrera_2 foreign key (IdCarrera) references Carrera(IdCarrera);
 alter table Aula add constraint FK_IdSede_1 foreign key (IdSede) references Sede(IdSede);
 alter table Aula add constraint FK_IdFacultad_1 foreign key (IdFacultad) references Facultad(IdFacultad);
 alter table Aula add constraint FK_IdCarrera_3 foreign key (IdCarrera) references Carrera(IdCarrera);
 alter table CicloCurso add constraint FK_CodigoCiclo_1 foreign key (CodigoCiclo) references Ciclo(CodigoCiclo);
 alter table CicloCurso add constraint FK_CodigoUsuarioProfesor_1 foreign key (CodigoUsuarioProfesor) references Usuario(CodigoUsuario);
 alter table CicloCurso add constraint FK_CodigoCurso_1 foreign key (CodigoCurso) references Curso(CodigoCurso);
 alter table CicloCurso add constraint FK_IdCarrera_4 foreign key (IdCarrera) references Curso(IdCarrera);
 alter table Horario add constraint FK_IdAula_1 foreign key (IdAula) references Aula(IdAula);
 alter table DetalleHorario add constraint FK_IdHorario_1 foreign key (IdHorario) references Horario(IdHorario);
 alter table DetalleHorario add constraint FK_IdDia_1 foreign key (IdDia) references Dia(IdDia);
 alter table CicloCursoHorario add constraint FK_IdHorario_2 foreign key (IdHorario) references Horario(IdHorario);
 alter table CicloCursoHorario add constraint FK_CodigoCiclo_2 foreign key (CodigoCiclo) references CicloCurso(CodigoCiclo);
 alter table CicloCursoHorario add constraint FK_CodigoUsuarioProfesor_2 foreign key (CodigoUsuarioProfesor) references CicloCurso(CodigoUsuarioProfesor);
 alter table CicloCursoHorario add constraint FK_CodigoCurso_2 foreign key (CodigoCurso) references CicloCurso(CodigoCurso);
 alter table CicloCursoHorario add constraint FK_IdCarrera_5 foreign key (IdCarrera) references CicloCurso(IdCarrera);
 alter table Matricula add constraint FK_CodigoUsuarioAlumno_1 foreign Key (CodigoUsuarioAlumno) references Usuario (CodigoUsuario);
 alter table Matricula add constraint FK_IdEmpresa_7 foreign Key (IdEmpresa) references Usuario (IdEmpresa);
 alter table Matricula add constraint FK_IdHorario_3 foreign Key (IdHorario) references CicloCursoHorario (IdHorario);
 alter table Matricula add constraint FK_CodigoCiclo_3 foreign Key (CodigoCiclo) references CicloCursoHorario (CodigoCiclo);
 alter table Matricula add constraint FK_CodigoUsuarioProfesor_3 foreign Key (CodigoUsuarioProfesor) references CicloCursoHorario (CodigoUsuarioProfesor);
 alter table Matricula add constraint FK_CodigoCurso_3 foreign Key (CodigoCurso) references CicloCursoHorario (CodigoCurso);
 alter table Matricula add constraint FK_IdCarrera_6 foreign Key (IdCarrera) references CicloCursoHorario (IdCarrera);
 alter table HistoricoAcademico add constraint FK_IdMatricula_1 foreign Key (IdMatricula) references Matricula (IdMatricula);
 alter table HistoricoAcademico add constraint FK_IdNota_1 foreign Key (IdNota) references HistoricoAcademico (IdNota);
select IdFacultad from Aula
