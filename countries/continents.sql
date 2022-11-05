#Codigo para crear los continentes de la base de datos

CREATE TABLE world.continents (id INTEGER, name VARCHAR(25), PRIMARY KEY(id));


INSERT INTO world.continents (id, name)
VALUES (1, 'North America'), (2, 'SOuth America'), (3, 'Europe'), (4, 'Africa'),
       (5, 'Asia'), (6, 'Oceania'), (7, 'Antarctic');
