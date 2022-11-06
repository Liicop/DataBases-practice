#Codigo para crear los continentes de la base de datos

USE world;


CREATE TABLE world.continents (id INTEGER, name VARCHAR(25),
	                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
			       updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	                       PRIMARY KEY(id))
		               DEFAULT CHARSET = utf8mb4
			       COLLATE = utf8mb4_unicode_ci;


INSERT INTO world.continents (id, name)
VALUES (1, 'North America'), (2, 'SOuth America'), (3, 'Europe'), (4, 'Africa'),
       (5, 'Asia'), (6, 'Oceania'), (7, 'Antarctic');
