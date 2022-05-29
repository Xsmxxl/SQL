CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  -- `edad` int not null,
  `created_by` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(created_by) references user(id)
);

rename table products to product;
ALTER TABLE product DROP COLUMN edad;
SELECT * FROM product;

SELECT u.id, u.email, p.name FROM user u left join product p on u.id = p.created_by;

INSERT INTO product (name, created_by, marca)
VALUES
  ('ipad', 1, 'apple'),
  ('iphone', 1, 'apple'),
  ('watch', 2, 'apple'),
  ('macbook', 1, 'apple'),
  ('imac', 3, 'apple'),
  ('ipad mini', 2, 'apple');
  
INSERT INTO product (name, created_by, marca) VALUES ('ipad mini', 2, 'apple');
INSERT INTO product (name, created_by, marca) VALUES ('imac', 2, 'apple');

DELETE from product where id = 6;
DELETE from product where id = 5;
DROP TABLE product, products;

SELECT u.id, u.email, p.name FROM user u right join product p on u.id = p.created_by;