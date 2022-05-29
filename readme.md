# Primeros pasos para crear, consultar y ver bases de datos con comandos en SQL para tablas y columnas

## primeros pasos, creación y comandos básicos para SQL

---------

Crear una base de datos ejemplo:
```
create database NOMBRE_DE_BASE_DE_DATOS;
```
<br>

Ver bases de datos disponibles
```
show databases;
```
<br>

Seleccionar una base de datos en especifico
```
use NOMBRE_DE_BASE_DE_DATOS;
```
<br>

Creamos una tabla para que podamos insertar luego valores
```
CREATE TABLE animales (
	id int auto_increment,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY (id)
);
```
<br>

Query de ejemplo para insertar datos
```
INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
```
<br>

Query para modificar una columna en una tabla ya creada
```
ALTER TABLE animales MODIFY COLUMN id int auto_increment;
```
<br>

Ver código SQL para crear una tabla
```
-- SHOW CREATE TABLE animales;
```
<br>

Al mostrarnos podemos ver en la respuesta y hacer clic derecho y copiar **field**
```
CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
```
<br>

Insertando más datos
```
INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
INSERT INTO animales (tipo, estado) VALUES ('dragon', 'feliz');
INSERT INTO animales (tipo, estado) VALUES ('felipe', 'triste');
```
<br>

Seleccionamos **toda** la tabla **animales**
```
SELECT * FROM aniamles;
```
<br>

Selección por **id** de la tabla **animales**
```
SELECT * FROM animales WHERE id = 1;
```
<br>

Selección por **estado** de la tabla **animales**, esto lo colocaremos en comillas simples
```
SELECT * FROM animales WHERE estado = 'feliz';
```
<br>

Selección por **estado** y **tipo** con el operador **AND** de la tabla **animales**
```
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'chanchito';
```
<br>

Si queremos actualizar un **registro** en alguna tabla tendremos que utilizar el siguiente comando, hay que especificar un id
```
UPDATE animales SET estado = 'feliz' where id = 3;
```
<br>

Borrar un registro. si arroja error 1175 es porque no especificamos un id
```
DELETE from animales where id = 2;
```
<br>

Borrar una tabla entera o varias la podemos hacer con **DROP**
```
DROP TABLE product, products;
```
<br>

Prueba con imagen desde internet

![Tux, the Linux mascot](https://mdg.imgix.net/assets/images/tux.png?auto=format&fit=clip&q=40&w=100)
<br>

## Iniciando una nueva práctica
<br>

creamos una tabla nueva llamada **usuarios** y seguido le insertamos datos
```
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `edad` int not null,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);
```
<br>

Insertando algunos datos a la tabla usuarios datos
```
INSERT INTO user (name, edad, email) VALUES ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Nicolas', 36, 'nico@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Chanchito', 7, 'oscar@gmail.com');
```
<br>

Actualizamos el registro con id 4 para corregir el email
```
UPDATE `user` SET email = 'chanchito@gmail.com' WHERE id = 4;
```
<br>

Seleccionamos todo, limite de 1, edad mayor a 15, mayor e igual a 15, segun dos columnas
```
SELECT * from user;
SELECT * from user limit 1;
SELECT * from user where edad > 15;
SELECT * from user where edad >= 15;
SELECT * from user where edad > 20 and email = 'nico@gmail.com';
```
<br>

Busqueda cruzada para traer datos segun dos condiciones con operador **or**
```
SELECT * from user where edad > 20 or email = 'layla@gmail.com';
```
<br>

Busqueda cruzada para traer datos segun dos condiciones con operador **!=** de negación
```
SELECT * from user where email != 'layla@gmail.com';
```
<br>

Busqueda cruzada para traer datos segun dos condiciones con operador **between** de negación
```
SELECT * from user where edad between 15 and 30;
```
<br>

Busqueda para traer datos segun dos condiciones con operador **like** conteniendo tal dato en una columna

La columna debe tener un comienzo cualquier cosa que se especifica con el **%** y finaliza con cualquier cosa con el **%**. Se puede usar al inicio o al final
```
SELECT * from user where email like '%gmail%';
```
<br>

Buscar registros y ordenarlos de forma ascendente **asc**por medio de especificar una columna. También se puede seleccionar la forma descendente **desc**
```
SELECT * from user order by edad asc;
```
<br>


Seleccionando columna con un máximo o minimo e indicamos cómo queremos que se llame el resultado con **as**
```
select max(edad) as `mayor` from user;
select min(edad) as `menor` from user;
```
<br>

Seleccionar varias columnas y colocarles un alias
```
select id, name from user;
select id, name as nombre from user;
```
<br>

Creamos una nueva tabla "productos" para poder hacer agrupaciones de tablas con **join**
```
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `edad` int not null,
  `created_by` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(created_by) references user(id)
);

-- cambiar el nombre de una tabla es asi
rename table products to product;
```
<br>

Borrar una columna entera es de esta forma
```
ALTER TABLE product DROP COLUMN edad;
```
<br>

Insertando algunos datos a la tabla product con una sola instancia de **INSERT**
```
INSERT INTO product (name, created_by, marca)
VALUES
  ('ipad', 1, 'apple'),
  ('iphone', 1, 'apple'),
  ('watch', 3, 'apple'),
  ('macbook', 1, 'apple'),
  ('imac', 4, 'apple'),
  ('ipad mini', 3, 'apple');
```
<br>

Creando un **left join** para agrupar definitivamente una consulta, en este caso el que manda es la tabla de usuarios
Para asignar un alias lo hacemos al final, luego se utiliza el principio del **from**
Para juntar las tablas segun columnas, una debe hacer referencias al id de la tabla a la izquierda y esto se indica con un **left join** y se juntan
```
SELECT u.id, u.email, p.name FROM user u left join product p on u.id = p.created_by;
```

*Ejemplo*

![left join](https://www.w3schools.com/sql/img_leftjoin.gif)
<br>

Para este caso con **right join** se traen todos los datos de la tabla derecha que en este caso sería la tabla **product**
```
SELECT u.id, u.email, p.name FROM user u right join product p on u.id = p.created_by;
```
*Ejemplos*

![other joins](https://donnierock.files.wordpress.com/2014/03/udqpd.jpg)
<br>