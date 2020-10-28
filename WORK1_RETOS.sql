SHOW DATABASES;
USE tienda;
-- RETO 1
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;
-- 

USE tienda;
SHOW TABLES;
SELECT * FROM empleado;
SELECT nombre FROM empleado;
SELECT nombre, apellido_paterno FROM empleado;
SELECT * FROM empleado WHERE apellido_paterno="Risom";
SELECT * FROM empleado WHERE id_empleado=10;
SELECT * FROM empleado WHERE id_empleado>100;
SELECT * FROM empleado WHERE id_puesto>=100 AND id_puesto<=200;
SELECT * FROM empleado WHERE id_puesto=100 OR id_puesto=200;
SELECT * FROM empleado WHERE id_puesto IN (100,200,300);

-- RETO 2
-- ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT nombre FROM empleado WHERE id_puesto=4;
-- ¿Qué puestos tienen un salario mayor a $10,000?
SELECT * FROM puesto WHERE salario>10000;
-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT * FROM articulo WHERE precio>1000 AND iva>100;
-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * FROM venta WHERE id_articulo IN (135,963) AND id_empleado IN (835,369);
--

USE classicmodels;
SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM customers ORDER BY contactLastName;
SELECT * FROM customers ORDER BY contactLastName DESC;
SELECT * FROM customers ORDER BY creditLimit DESC;
SELECT * FROM customers LIMIT 10;
SELECT * FROM customers ORDER BY creditLimit DESC LIMIT 10;

-- RETO 3
-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
USE tienda;
SELECT * FROM puesto ORDER BY salario DESC LIMIT 5;