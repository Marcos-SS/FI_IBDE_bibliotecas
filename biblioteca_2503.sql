/*
Nombre: Marcos Sandoval Salazar
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
CREATE TABLE facultad
(
	id_facultad serial NOT NULL,
	nombre_facultad varchar(100),
	CONSTRAINT fac_PK PRIMARY KEY (id_facultad)
);

CREATE TABLE alumnado
(
	numero_cuenta integer NOT NULL,
	nombre_alumno varchar(100),
	segundo_apellido varchar(100),
	primer_apellido varchar(100),
	regular	char(2),
	CONSTRAINT alumno_PK PRIMARY KEY (numero_cuenta)
);


CREATE TABLE carrera
(
	id_carrera serial NOT NULL,
	nombre_carrera varchar(150),
	CONSTRAINT carrera_PK PRIMARY KEY (id_carrera)
);

CREATE TABLE sede 
(
	id_sede serial NOT NULL,
	fac_id	integer,
	carrera_id integer,
	CONSTRAINT sede_PK PRIMARY KEY (id_sede)
);

CREATE TABLE libro 
(
	isbn bigint NOT NULL,
	nombre_libro varchar(150),
	nombre_autor varchar(100),
	materno_autor varchar(100),
	paterno_autor varchar(100),
	fecha_publicacion date,
	editorial varchar(100),
	clasificacion varchar(100),
	CONSTRAINT libro_PK PRIMARY KEY (isbn)
);

CREATE TABLE prestamo 
(
	id_prestamo serial NOT NULL,
	isbn_fk bigint,
	numero_cuenta_fk integer,
	fecha_prestamo date,
	fecha_devolucion date,
	observaciones text,
	CONSTRAINT prestamo_PK PRIMARY KEY (id_prestamo)
);

CREATE TABLE catalogo 
(
	id_catalogo serial,
	isbn_cat bigint,
	biblio_id integer,
	CONSTRAINT catalogo_PK PRIMARY KEY (id_catalogo)
);

CREATE TABLE biblioteca
(
	id_biblioteca serial NOT NULL,
	nombre_biblioteca varchar(100),
	ubicacion varchar(100),
	fac_biblio integer,
	CONSTRAINT biblio_PK PRIMARY KEY (id_biblioteca)
);

CREATE TABLE control 
(
	control_id serial NOT NULL,
	carrera_fk integer,
	num_cta_fk integer,
	CONSTRAINT control_PK PRIMARY KEY (control_id)
);

--Llaves Foraneas
ALTER TABLE sede ADD CONSTRAINT fk_sede_fac FOREIGN KEY (fac_id)
REFERENCES facultad (id_facultad)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE sede ADD CONSTRAINT fk_sede_carr FOREIGN KEY (carrera_id)
REFERENCES carrera (id_carrera)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE biblioteca ADD CONSTRAINT fk_biblio_fac FOREIGN KEY (fac_biblio)
REFERENCES facultad (id_facultad)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE catalogo ADD CONSTRAINT fk_catg_lib FOREIGN KEY (isbn_cat)
REFERENCES libro (isbn)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE catalogo ADD CONSTRAINT fk_catg_bibl FOREIGN KEY (biblio_id)
REFERENCES biblioteca (id_biblioteca)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE prestamo ADD CONSTRAINT fk_pres_alm FOREIGN KEY (numero_cuenta_fk)
REFERENCES alumnado (numero_cuenta)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE prestamo ADD CONSTRAINT fk_pres_lib FOREIGN KEY (isbn_fk)
REFERENCES libro (isbn)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE control ADD CONSTRAINT fk_ctl_alm FOREIGN KEY (num_cta_fk)
REFERENCES alumnado (numero_cuenta)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE control ADD CONSTRAINT fk_crl_carr FOREIGN KEY (carrera_fk)
REFERENCES carrera (id_carrera)
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE EXTENSION postgis;