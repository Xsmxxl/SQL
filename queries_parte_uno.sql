CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `edad` int not null,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO user (name, edad, email) VALUES ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Nicolas', 36, 'nico@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Chanchito', 7, 'oscar@gmail.com');

UPDATE `user` SET email = 'chanchito@gmail.com' WHERE id = 4;

SELECT * from user;
SELECT * from user limit 1;
SELECT * from user where edad > 15;
SELECT * from user where edad >= 15;
SELECT * from user where edad > 20 and email = 'nico@gmail.com';
SELECT * from user where edad > 20 or email = 'layla@gmail.com';
SELECT * from user where email != 'layla@gmail.com';
SELECT * from user where edad between 15 and 30;
SELECT * from user where email like '%gmail%';
SELECT * from user order by edad asc;
select max(edad) as mayor from user;
select min(edad) as `menor` from user;
show databases;
use holamundo;
select id, name as nombre from user;