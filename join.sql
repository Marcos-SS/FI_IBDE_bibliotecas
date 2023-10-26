-----------------Join
--Consultas JOIN
--JOIN 2 TABLAS
SELECT libro.*,catalogo.* 
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo;

SELECT libro.isbn,libro.nombre_libro,catalogo.id_catalogo,catalogo.isbn_catalogo 
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo;

--Error no existe la columna libro.nombre 
SELECT libro.nombre,libro.autor_nombre,catalogo.id_biblio_catalogo 
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo;

--Esto es un error
SELECT libro.*,catalogo.* 
FROM libro JOIN catalogo
ON libro.anio=catalogo.isbn_catalogo;

--Join mal estructurado, libro y biblioteca no tienen una conexión directa
SELECT libro.*,biblioteca.* 
FROM libro JOIN biblioteca
ON libro.isbn=biblioteca.id_biblioteca;

SELECT libro.isbn,biblioteca.id_biblioteca
FROM libro JOIN biblioteca
ON libro.isbn=biblioteca.id_biblioteca;

--JOIN 3 TABLAS
SELECT libro.*,catalogo.*,biblioteca.*
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo
JOIN biblioteca ON biblioteca.id_biblioteca=catalogo.id_biblio_catalogo;

JOIN prestamo ON libro.pk=prestamo.fk; 
JOIN alumnado on alumnado.pk=prestamo.fk;

SELECT libro.nombre_libro,biblioteca.nombre_biblioteca,libro.autor_nombre
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo
JOIN biblioteca ON biblioteca.id_biblioteca=catalogo.id_biblio_catalogo;

SELECT libro.nombre_libro,biblioteca.nombre_biblioteca,libro.autor_nombre,libro.autor_pa
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo
JOIN biblioteca ON biblioteca.id_biblioteca=catalogo.id_biblio_catalogo 
where libro.autor_nombre = 'Isabel';

SELECT libro.nombre_libro,biblioteca.nombre_biblioteca,libro.autor_nombre,libro.autor_pa
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo
JOIN biblioteca ON biblioteca.id_biblioteca=catalogo.id_biblio_catalogo 
where libro.autor_nombre = 'Isabel'
order by libro.nombre_libro DESC; 

SELECT libro.nombre_libro,biblioteca.nombre_biblioteca
FROM libro JOIN catalogo
ON libro.isbn=catalogo.isbn_catalogo
JOIN biblioteca ON biblioteca.id_biblioteca=catalogo.id_biblio_catalogo;

--Abreviaturas
SELECT li.nombre_libro,b.nombre_biblioteca
FROM libro li JOIN catalogo c
ON li.isbn=c.isbn_catalogo
JOIN biblioteca b ON b.id_biblioteca=c.id_biblio_catalogo;


-- Verificar Join 3 Tablas

SELECT alumnado.*,prestamo.* 
FROM alumnado JOIN prestamo 
on alumnado.numcuenta=prestamo.numcta_pres;

SELECT libro.*,prestamo.*
FROM libro JOIN prestamo
on libro.isbn=prestamo.isbn_pres;

SELECT alumnado.*,prestamo.*,libro.* 
FROM alumnado JOIN prestamo on alumnado.numcuenta=prestamo.numcta_pres
JOIN libro on libro.isbn=prestamo.isbn_pres;

SELECT a.*,p.*,l.* 
FROM alumnado a JOIN prestamo p on a.numcuenta=p.numcta_pres
JOIN libro l on l.isbn=p.isbn_pres;


SELECT a.numcuenta,a.carrera,a.entidad,
l.isbn,l.nombre_libro,l.autor_nombre,l.anio 
FROM alumnado a JOIN prestamo p on a.numcuenta=p.numcta_pres
JOIN libro l on l.isbn=p.isbn_pres;





/*
select *
from products
order by case 
           when kind = 'fruit' then name
         end asc nulls last,
         case 
           when kind = 'vegetable' then name
         end desc nulls last
*/

