--Consultas a la base de datos world


--Paises por continente
SELECT continents.name AS Continentes, COUNT(*) AS Numero_paises
FROM world.continents
INNER JOIN world.countries ON continent_id = continents.id
GROUP BY continents.name
ORDER BY Numero_paises DESC;


--Paises con PIB mayor a un trillon de dolares
SELECT id, name, gdp
FROM world.countries
WHERE gdp >= 1000000000000
ORDER BY gdp DESC;

--Paises con un área de más de 1000000 de km²
SELECT id, name, area
FROM world.countries
WHERE area >= 1000000
ORDER BY area DESC;

--Países con población entre 30000000 y 400000000 millones de habitantes.
SELECT id, name, population
FROM world.countries
WHERE population BETWEEN 30000000 AND 400000000
ORDER BY population DESC;

--Top 5 economías del mundo
SELECT id, name, gdp
FROM world.countries
ORDER BY gdp DESC
LIMIT 5;

--Top 5 economías de América
SELECT id, name, gdp
FROM world.countries
WHERE continent_id IN (1,2)
ORDER BY gdp DESC
LIMIT 5; 


--Paises por continente con más de 50000000 millones de habitantes.
SELECT continents.name, COUNT(*) AS paises_mas_50m_habitantes
FROM world.continents
INNER JOIN world.countries ON continent_id = continents.id
WHERE countries.population > 50000000
GROUP BY continents.name;

--Utilizando GROUP_CONCAT
SELECT continents.name, COUNT(*) AS No_paises_mas_50m_habitantes,
GROUP_CONCAT(countries.name SEPARATOR "-") AS paises_mas_50m_habitantes
FROM world.continents
INNER JOIN world.countries ON continent_id = continents.id
WHERE countries.population > 100000000
GROUP BY continents.name;

