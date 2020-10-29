USE tienda;
SHOW TABLES;
SELECT * FROM empleado;
SELECT * FROM empleado WHERE nombre LIKE 'M%';
SELECT * FROM empleado WHERE nombre LIKE '%a';
SELECT * FROM empleado WHERE nombre LIKE 'M%a';
SELECT * FROM empleado WHERE nombre LIKE 'M_losa';

-- RETO 1
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%PASTA%';
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%';
-- ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE "%Designer%";
-- ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE "%Developer%";

# FUNCIONES DE AGRUPAMIENTO
SELECT (1+7) *(10/(6-4));
SELECT * FROM articulo;
SELECT avg(precio) AS promedio_previo FROM articulo;
SELECT count(*) AS conteo_articulos FROM articulo;
SELECT max(precio) AS precio_maximo FROM articulo;
SELECT min(precio) AS precio_minimo FROM articulo;
SELECT sum(precio) AS suma_precios FROM articulo;

-- RETO 2
-- ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto;
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%Pasta%';
-- ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario), MAX(salario) FROM puesto;
-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario) FROM puesto WHERE id_puesto > (SELECT max(id_puesto) - 5 FROM puesto);

# GROUP BY
SELECT * FROM articulo;
SELECT nombre, sum(precio) AS precio_total FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT * FROM puesto;
SELECT nombre, min(salario) AS salario_minimo, max(salario) AS salario_maximo FROM puesto;

-- RETO 3
-- ¿Cuántos registros hay por cada uno de los puestos?
SELECT * FROM puesto;
SELECT nombre, COUNT(*) FROM puesto GROUP BY nombre;
-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, SUM(salario) FROM puesto GROUP BY nombre;
-- ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(clave) AS num_ventas FROM venta GROUP BY id_empleado;
-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) FROM venta GROUP BY id_articulo;