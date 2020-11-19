USE tienda;

-- -- -- --
-- RETO 1!
-- USE tienda;
-- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario > 10000);
 
-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT T_V.id_empleado, MIN(T_V.total_ventas), MAX(T_V.total_ventas)
FROM
  (SELECT V.clave, V.id_empleado, COUNT(*) AS total_ventas
      FROM venta AS V
      GROUP BY V.clave, V.id_empleado) AS T_V GROUP BY T_V.id_empleado;

-- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave, id_articulo FROM venta
	WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000);
-- -- -- --

# JOINS

SHOW KEYS FROM venta;

SELECT * FROM puesto;
SELECT * FROM empleado;

SELECT *
FROM empleado AS e
JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

SELECT *
FROM puesto AS p LEFT JOIN empleado AS e
ON p.id_puesto = e.id_puesto;

SELECT *
FROM empleado AS e RIGHT JOIN puesto AS p
ON p.id_puesto = e.id_puesto;


-- -- -- --    
-- RETO 2!

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT v.clave, v.id_venta, CONCAT(e.apellido_paterno, ' ', e.apellido_materno) AS Apellidos, e.nombre
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado -- USING (id_articulo); para cuando el campo se llama igual en ambas tablas
ORDER BY v.clave;

-- ¿Cuál es el nombre de los artículos que se han vendido?
SELECT v.id_venta, a.nombre
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
ORDER BY v.id_venta;

-- ¿Cuál es el total de cada venta?
SELECT v.clave, ROUND(SUM(a.precio),2) AS Total_vendido
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
GROUP BY v.clave
ORDER BY Total_vendido DESC;
-- -- -- --

# VISTAS

SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, CONCAT(e.nombre, ' ',e.apellido_paterno) AS Empleado
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo;

CREATE VIEW tickets_126 AS
 (SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, CONCAT(e.nombre, ' ',e.apellido_paterno) AS Empleado
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo);
SELECT * FROM tickets_126 LIMIT 5;


-- -- -- --
-- RETO 3!

-- Obtener el puesto de un empleado.
CREATE VIEW puestos_126 AS
(SELECT concat(e.nombre, ' ', e.apellido_paterno), p.nombre
FROM empleado e
JOIN puesto p
  ON e.id_puesto = p.id_puesto);
SELECT * FROM puestos_126;

-- Saber qué artículos ha vendido cada empleado.
CREATE VIEW empleado_articulo_126 AS
(SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave);
SELECT * FROM  empleado_articulo_126;

-- Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas_126 AS
(SELECT p.nombre, count(v.clave) total_ventas
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN puesto p
  ON e.id_puesto = p.id_puesto
GROUP BY p.nombre);
SELECT * FROM puesto_ventas_126
ORDER BY total_ventas DESC LIMIT 1;