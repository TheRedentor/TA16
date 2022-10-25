/*1.1*/
SELECT nombre FROM articulos;

/*1.2*/
SELECT nombre, precio FROM articulos;

/*1.3*/
SELECT nombre FROM articulos WHERE precio <= 200;

/*1.4*/
SELECT * FROM articulos WHERE precio BETWEEN 60 AND 120;

/*1.5*/
SELECT nombre, precio*166.386 FROM articulos;

/*1.6*/
SELECT AVG(precio) FROM articulos;

/*1.7*/
SELECT AVG(precio) FROM articulos WHERE fabricante=2;

/*1.8*/
SELECT COUNT(*) FROM articulos WHERE precio>=180;

/*1.9*/
SELECT nombre, precio FROM articulos WHERE precio>=180 ORDER BY precio DESC;
SELECT nombre, precio FROM articulos WHERE precio>=180 ORDER BY nombre ASC;

/*1.10*/
SELECT * FROM articulos INNER JOIN fabricantes WHERE articulos.fabricante=fabricantes.codigo;

/*1.11*/
SELECT a.nombre, a.precio, b.nombre FROM articulos AS a INNER JOIN fabricantes AS b WHERE a.fabricante=b.codigo;

/*1.12*/
SELECT AVG(a.precio), b.codigo FROM articulos AS a INNER JOIN fabricantes AS b WHERE a.fabricante=b.codigo GROUP BY b.codigo;

/*1.13*/
SELECT AVG(a.precio), b.nombre FROM articulos AS a INNER JOIN fabricantes AS b WHERE a.fabricante=b.codigo GROUP BY b.nombre;

/*1.14*/
SELECT a.nombre FROM fabricantes AS a INNER JOIN articulos AS b WHERE a.codigo=b.fabricante GROUP BY a.nombre HAVING AVG(b.precio)>=150;

/*1.15*/
SELECT nombre, precio FROM articulos WHERE precio=(SELECT MIN(precio) FROM articulos);

/*1.16*/ /*Està malament*/
SELECT a.nombre, a.precio, b.nombre FROM articulos AS a INNER JOIN fabricantes AS b WHERE a.fabricante=b.codigo HAVING a.precio=(SELECT MAX(precio) FROM articulos);

/*1.17*/
INSERT INTO articulos (codigo, nombre, precio, fabricante) VALUES (11, "Altavoces", 70, 2);

/*1.18*/
UPDATE articulos SET nombre="Impresora Laser" WHERE codigo=8;

/*1.19*/
SET SQL_SAFE_UPDATES = 0;
UPDATE articulos SET precio=precio*0.9;

/*1.20*/
UPDATE articulos SET precio=precio*0.9 WHERE precio>=120;



/*2.1*/
SELECT apellidos FROM empleados;

/*2.2*/
SELECT DISTINCT apellidos FROM empleados;

/*2.3*/
SELECT * FROM empleados WHERE apellidos="Smith";

/*2.4*/
SELECT * FROM empleados WHERE apellidos IN ("Smith","Rogers");

/*2.5*/
SELECT * FROM empleados WHERE departamento=14;

/*2.6*/
SELECT * FROM empleados WHERE departamento IN (37,77);

/*2.7*/
SELECT * FROM empleados WHERE apellidos LIKE 'P%';

/*2.8*/
SELECT AVG(presupuesto) FROM departamentos;

/*2.9*/
SELECT COUNT(*) FROM empleados INNER JOIN departamentos WHERE empleados.departamento=departamentos.codigo GROUP BY departamentos.codigo;

/*2.10*/
SELECT a.*, b.* FROM empleados AS a INNER JOIN departamentos AS b WHERE a.departamento=b.codigo;

/*2.11*/
SELECT a.nombre, a.apellidos, b.nombre, b.presupuesto FROM empleados AS a INNER JOIN departamentos AS b WHERE a.departamento=b.codigo;

/*2.12*/
SELECT a.nombre, a.apellidos FROM empleados AS a INNER JOIN departamentos AS b WHERE a.departamento=b.codigo AND b.presupuesto>60000;

/*2.13*/
SELECT * FROM departamentos WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

/*2.14*/ /*Està malament*/
SELECT a.nombre FROM departamentos AS a INNER JOIN empleados AS b WHERE a.codigo=b.departamento HAVING (SELECT COUNT(departamento) FROM empleados)>2;

/*2.15*/
INSERT INTO departamentos (codigo, nombre, presupuesto) VALUES (11, "Calidad", 40000);
INSERT INTO empleados (dni, nombre, apellidos, departamento) VALUES (89267109, "Esther", "Vázquez", 11);

/*2.16*/
SET SQL_SAFE_UPDATES = 0;
UPDATE departamentos SET presupuesto=presupuesto*0.9;

/*2.17*/
UPDATE empleados SET departamento=14 WHERE departamento=77;

/*2.18*/
DELETE FROM empleados WHERE departamento=14;

/*2.19*/ /*Està malament*/
DELETE a FROM empleados AS a INNER JOIN deparamentos AS b WHERE a.departamento=b.codigo AND b.presupuesto>60000;

/*2.20*/
DELETE FROM empleados;



/*3.1*/
SELECT * FROM almacenes;

/*3.2*/
SELECT * FROM cajas WHERE valor > 150;

/*3.3*/
SELECT contenido FROM cajas;

/*3.4*/
SELECT AVG(valor) FROM cajas;

/*3.5*/
SELECT AVG(a.valor), b.codigo FROM cajas AS a INNER JOIN almacenes AS b WHERE b.codigo=a.almacen GROUP BY b.codigo;

/*3.6*/ /*Crec que va malament*/
SELECT a.codigo FROM almacenes AS a INNER JOIN cajas AS b WHERE a.codigo=b.almacen AND b.valor>(SELECT AVG(valor) FROM cajas);

/*3.7*/
SELECT a.numreferencia, b.lugar FROM cajas AS a INNER JOIN almacenes AS b WHERE a.almacen=b.codigo;

/*3.8*/
SELECT COUNT(a.numreferencia), b.CODIGO FROM cajas AS a INNER JOIN almacenes AS b WHERE a.almacen=b.codigo GROUP BY b.codigo;

/*3.9*/ /*Està malament*/
SELECT a.codigo FROM almacenes AS a INNER JOIN cajas AS b WHERE a.codigo=b.almacen AND a.capacidad<(SELECT COUNT(a.numreferencia) FROM cajas AS a INNER JOIN almacenes AS b WHERE a.almacen=b.codigo);

/*3.10*/
SELECT a.numreferencia FROM cajas AS a INNER JOIN almacenes AS b WHERE a.almacen=b.codigo AND b.lugar="Bilbao";

/*3.11*/
INSERT INTO almacenes (codigo, lugar, capacidad) VALUES (6, "Barcelona", 3);

/*3.12*/
INSERT INTO cajas (numreferencia, contenido, valor, almacen) VALUES ("H5RT", "Papel", 200, 2);

/*3.13*/
SET SQL_SAFE_UPDATES = 0;
UPDATE cajas SET valor=valor*0.85;

/*3.14*/
UPDATE cajas SET valor=valor*0.80 WHERE valor>(SELECT AVG(valor));

/*3.15*/
DELETE FROM cajas WHERE valor<100;

/*3.16*/ /*No sé com es fa*/




/*4.1*/
SELECT nombre FROM peliculas;

/*4.2*/
SELECT calificacionedad FROM peliculas;

/*4.3*/
SELECT nombre FROM peliculas WHERE calificacionedad IS NULL;

/*4.4*/
SELECT * FROM salas WHERE pelicula IS NULL;

/*4.5*/
SELECT * FROM salas INNER JOIN peliculas ON salas.pelicula=peliculas.codigo;

/*4.6*/
SELECT * FROM peliculas INNER JOIN salas ON salas.pelicula=peliculas.codigo;

/*4.7*/
SELECT a.nombre FROM peliculas AS a LEFT JOIN salas AS b ON b.pelicula=a.codigo WHERE b.codigo IS NULL;

/*4.8*/
INSERT INTO peliculas (codigo, nombre, calificacionedad) VALUES (10, 'Uno, Dos, Tres', 'PG-7');

/*4.9*/
SELECT codigo, nombre, calificacionedad AS 'PG-13' FROM peliculas WHERE calificacionedad IS NULL;

/*4.10*/
DELETE a FROM salas AS a INNER JOIN peliculas AS b WHERE a.pelicula=b.codigo AND b.calificacionedad="G";