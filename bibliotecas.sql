/*
Nombre: V
Asignatura: IBDE
Semestre: el actual
Grupo: en el  que estamos
Título: Script biblioteca
Descripción: Caso de estudio de una biblioteca, primer Script
Versión: 1.0
*/

--CREAR BD

CREATE DATABASE ms_biblioteca
	WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

--Conectar a BD
\c ms_biblioteca

--Borrar BD
--DROP DATABASE ms_biblioteca;

-- Crear Tablas
CREATE TABLE biblioteca 
(
	id_biblioteca serial NOT NULL,
	nombre_biblioteca varchar(25),
	lugar_biblioteca varchar(30),
	CONSTRAINT biblioteca_pkey PRIMARY KEY (id_biblioteca) 
);

CREATE TABLE alumno 
(
	numcuenta int NOT NULL, 
	nombre_alumno varchar(30),
	ap varchar(30),
	am varchar(30),
	carrera varchar(50),
	facultad varchar(50),
	CONSTRAINT alumno_pkey PRIMARY KEY (numcuenta)
);

CREATE TABLE libro 
(
	isbn int NOT NULL,  
	nombre_libro varchar(30), 
	autor_nombre varchar(30), 
	autor_pa varchar(30),
	autor_sa varchar(30),
	clasificacion varchar(50), 
	anio int,
	CONSTRAINT libro_pkey PRIMARY KEY (isbn)
);

CREATE TABLE catalogo 
(
	id_catalogo serial NOT NULL, 
	isbn_catalogo int,
	id_biblio_catalogo int,
	CONSTRAINT catalogo_pkey PRIMARY KEY (id_catalogo)
);

CREATE TABLE prestamo 
(
	id_prestamo serial NOT NULL, 
	isbn_pres int,
	numcta_pres int,
	CONSTRAINT prestamo_pkey PRIMARY KEY (id_prestamo)
);

-- Crear FK
ALTER TABLE catalogo ADD CONSTRAINT tu_ex FOREIGN KEY (id_biblio_catalogo)  REFERENCES biblioteca (id_biblioteca) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE catalogo ADD CONSTRAINT otra_fk_catalogo FOREIGN KEY (isbn_catalogo)  REFERENCES libro (isbn) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE prestamo ADD CONSTRAINT fk_prestamo_1 FOREIGN KEY (isbn_pres)  REFERENCES libro (isbn) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE prestamo ADD CONSTRAINT fk_prestamo FOREIGN KEY (numcta_pres)  REFERENCES alumno (numcuenta) ON DELETE RESTRICT ON UPDATE CASCADE;

--Insertar datos
INSERT INTO biblioteca (id_biblioteca,nombre_biblioteca,lugar_biblioteca)
VALUES
	(1,'Biblioteca Central','CU'),
	(2,'Posgrado','Posgrado FI'),
	(3,'Anexo','Anexo FI'),
	(4,'Principal','Principal FI');


INSERT INTO biblioteca (nombre_biblioteca,lugar_biblioteca)
VALUES
	('Biblioteca Medicina','Facultad de Medicina'),
	('Biblioteca Ciencias','FC'),
	('Biblioteca contaduria','FCyA'),
	('Biblioteca FES Aragon','FES Aragon');
--SELECT * FROM biblioteca_id_biblioteca_seq;
--ALTER SEQUENCE biblioteca_id_biblioteca_seq RESTART WITH 5;
	
INSERT INTO alumno (numcuenta,nombre_alumno,ap,am,carrera,facultad)
VALUES
	(316145954,'Rodrigo','Camacho','Ramirez','Administracio','contaduria y administracion'),
	(413567980,'Laura','Razo','Roa','Relaciones internacionales','Ciencias politicas'),
	(325645328,'Antonio','Perez','Recendiz','Ingeneria petrolera','Ingenieria'),
	(456735628,'Laura','Morales','Garcia','Medico cirujano','Medicina'),
	(323456789,'Marco','Rosas','Ramos','Derecho','Derecho'),
	(416745678,'Sandra','Palacios','Rivadeneryra','Quimica','Quimica'),
	(317456890,'Claudia','Botella','Marmol','Odontolofia','Odontologia'),
	(410007869,'Eduardo','Sandoval','Martinez','Arquitectura','Arquitectura'),
	(317892062,'Monserrat','Herrera','Loza','Diseño industrial','Arquitectura'),
	(311324856,'Carlos','Gomez','Juarez','Ingenieria ambiental','Ingenieria');

INSERT INTO libro (isbn,nombre_libro,autor_nombre,autor_pa,autor_sa,clasificacion,anio)
VALUES
	(1,'Cuidad de bestias','Isabel','Allende','Llona','800','2002'),
	(2,'El amante japones','Isabel','Allende','Llona','800','2015'),
	(3,'De cero a uno','Peter','Andrews','Thiel','600','2014'),
	(4,'It','Syhephen','King','n','800','1986'),
	(5,'Memorias de mis putas tristes','Gabriel','García','Márquez','800','2004'),
	(6,'Flores en el atico','Virginia','Cleo','Andrews','800','1979'),
	(7,'El segundo sexo','Simone ','Bertrand','de Beavouir','800','1949'),
	(8,'Cartas a satre','Simone ','Bertrand','de Beavouir','800','1990');

INSERT INTO catalogo (isbn_catalogo,id_biblio_catalogo)
VALUES
	(1,2),(2,3),(3,1),(4,2),
	(5,1),(6,3),(7,1),(8,2);

INSERT INTO prestamo (isbn_pres,numcta_pres)
VALUES
	(1,316145954),(2,325645328),(7,456735628),(5,413567980),(7,410007869),(6,311324856),(8,317892062),
(1,416745678),(4,317892062),(3,325645328),(5,325645328),(7,413567980),(4,456735628),(6,325645328),(2,325645328),
(1,325645328),(8,316145954),(7,416745678),(4,317456890),(5,317892062),(1,316145954);
