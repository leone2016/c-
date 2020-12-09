create database CursosOnline
go


create table Curso
(
    CursoId          int identity
        constraint table_name_pk
            primary key nonclustered,
    Titulo           nvarchar(500),
    Descripcion      nvarchar(1000),
    FechaPublicacion datetime,
    FotoPortada      varbinary(max)
)
go

create table Precio
(
    PrecioId     int identity
        constraint Precio_pk
            primary key nonclustered,
    PrecioActual money,
    Promocion    money,
    CursoId      int
)
go
alter table Precio add constraint fk_precio_curso foreign key (CursoId) references Curso(CursoId);

-- auto-generated definition
create table Comentario
(
    ComentarioId    int identity
        constraint Comentario_pk
            primary key nonclustered,
    Alumno          nvarchar(500),
    Puntaje         int,
    Comentariotexto nvarchar(max),
    CursoId         int
)
go
alter table Comentario add constraint fk_comentario_curso foreign key (CursoId) references Curso(CursoId);

create table Instructor
(
	InstructorId int identity
		constraint Instructor_pk
			primary key nonclustered,
	Nombre nvarchar(500),
	Apellido nvarchar(500),
	Grado varchar(500),
	FotoPerfil varbinary(max)
)
go

CREATE TABLE CursoInstructor (
    CursoId int NOT NULL,
    InstructorId int NOT NULL,
    CONSTRAINT CursoInstructor_pk PRIMARY KEY (CursoId,InstructorId)
);
alter table CursoInstructor add constraint fk_instructor_curso foreign key (CursoId) references Curso(CursoId);
alter table CursoInstructor add constraint fk_instructor foreign key (InstructorId) references Instructor(InstructorId);



INSERT INTO CursosOnline.dbo.Curso ( Titulo, Descripcion, FechaPublicacion, FotoPortada) VALUES ( N'React Hooks firebase y Material desing', N'Curso de Programación', N'2020-12-06 22:48:49.000', null);
INSERT INTO CursosOnline.dbo.Curso ( Titulo, Descripcion, FechaPublicacion, FotoPortada) VALUES ( N'ASP .NET Core y React Hooks', N'Curso de .NET', N'2020-12-06 22:49:33.000', null);

INSERT INTO CursosOnline.dbo.Precio (PrecioActual, Promocion, CursoId) VALUES (900.0000, 99.0000, 1);
INSERT INTO CursosOnline.dbo.Precio (PrecioActual, Promocion, CursoId) VALUES (650.0000, 15.0000, 2);

INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Leonardo Medina', 4, N'Buen curso aunque hay cosas que son un poco repetitivas, me agradaria que se haga de forma mas rapida', 1);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Carla Sanana', 5, N'Good coourse', 1);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Antonio Saritama', 2, N'No me gusto el curso', 2);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Felipe Benegas', 3, N'Lo maximo', 2);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Antonio Saritama', 5, N'No entendi', 1);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Leonardo medina', 5, N'Nuevo comment', 2);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Lorena Guartazaca', 5, N'Good coourse', 1);
INSERT INTO CursosOnline.dbo.Comentario (Alumno, Puntaje, Comentariotexto, CursoId) VALUES (N'Andrea Morillo', 5, N'Good coourse', 2);

INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (1, 1);
INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (1, 5);
INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (2, 1);
INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (2, 2);
INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (2, 3);
INSERT INTO CursosOnline.dbo.CursoInstructor (CursoId, InstructorId) VALUES (2, 4);