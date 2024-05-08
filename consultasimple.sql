
SELECT * FROM alumno;
SELECT nombre_alumno,ap,am FROM alumno where facultad ='Medicina';
SELECT * FROM prestamo;
SELECT * FROM libro;
SELECT * FROM catalogo;
SELECT * FROM biblioteca;

SELECT numcuenta,nombre_alumno,ap,am FROM alumno ORDER BY ap;

SELECT numcuenta,nombre_alumno,ap,am FROM alumno ORDER BY numcuenta DESC;

SELECT numcuenta,nombre_alumno,ap,am FROM alumno ORDER BY ap DESC;

SELECT numero_libro,nombre_libro,autor_nombre FROM libro;
----
--ALTER TABLE nombre_actual RENAME TO nuevo_nombre;
ALTER TABLE alumno RENAME TO alumnado;

--ALTER TABLE nombre_tabla RENAME COLUMN actual_nombre_columna TO nuevo_nombre_columna;
ALTER TABLE alumnado RENAME COLUMN facultad TO entidad;
SELECT nombre_alumno,ap,am FROM alumno where entidad ='Medicina';

--ALTER TABLE nombre_tabla ADD COLUMN nombre_columna tipo_de_dato;
ALTER TABLE alumnado ADD COLUMN promedio integer;

--ALTER TABLE nombre_tabla ALTER COLUMN nombre_columna SET DATA TYPE tipo_de_dato;
ALTER TABLE alumnado ALTER COLUMN promedio SET DATA TYPE real;

--ALTER TABLE nombre_tabla DROP COLUMN nombre_columna;
 ALTER TABLE alumnado DROP COLUMN promedio;

--UPDATE nombre_tabla SET nombre_columna = dato;
UPDATE alumnado SET promedio = 5;

--UPDATE nombre_tabla SET nombre_columna = dato WHERE nombre_columna = dato ;
UPDATE alumnado SET promedio = 10 WHERE entidad = 'Ingenieria';


----
SELECT count (ap) FROM alumnado;

SELECT count (*) FROM catalogo;

SELECT count (DISTINCT entidad) FROM alumnado;

SELECT count (*),entidad FROM alumnado GROUP BY entidad;

SELECT count (*),entidad FROM alumnado GROUP BY entidad ORDER BY entidad;

SELECT SUM (numcuenta) FROM alumnado;

SELECT MAX (numcuenta) FROM alumnado;

SELECT MIN (numcuenta) FROM alumnado;

SELECT AVG (numcuenta) FROM alumnado;

SELECT * FROM alumnado WHERE am = 'Oz';

SELECT * FROM alumnado WHERE am = 'Oz' AND ap = 'Carpio' AND 'ZZZZ' AND 'ZZZZ';

SELECT * FROM alumnado WHERE am = 'Oz' OR ap = 'Carpio' OR 'ZZZZ' OR 'YYYY';

SELECT * FROM alumnado WHERE ap LIKE 'S%';  

SELECT * FROM alumnado WHERE carrera LIKE '%nge%';

A%
%a
%a%


SELECT * FROM alumnado WHERE numcuenta LIKE '310%';

SELECT * FROM alumnado WHERE CAST (numcuenta AS TEXT) LIKE '31%';

SELECT * FROM alumnado WHERE numcuenta BETWEEN 310000000 AND 314000000;

SELECT * FROM alumnado 
WHERE numcuenta 
BETWEEN 310000000 AND 314000000 
ORDER BY numcuenta;
