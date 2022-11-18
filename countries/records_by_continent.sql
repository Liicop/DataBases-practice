--El usuario selecciona el continente y devolverá la información acerca de sus países

USE world;

DROP PROCEDURE IF EXISTS continent_records;

DELIMITER // 

CREATE PROCEDURE continent_records(IN continent_name VARCHAR(30))

BEGIN 

	DECLARE continentid INT;

	SELECT id 
	INTO continentid
	FROM continents
	WHERE name = continent_name
	COLLATE utf8mb4_unicode_ci;

	SET @continent_info = CONCAT(" 
		SELECT COUNT(countries.id) AS Paises_en_el_continente, AVG(countries.gdp) AS PIB_promedio, 
		SUM(population) AS Poblacion_total, SUM(area) AS Area_total
		FROM world.countries
		INNER JOIN world.continents ON world.continents.id = world.countries.continent_id
		WHERE world.countries.continent_id = ", continentid); 

	SET @continent_data = CONCAT("
		SELECT name, capital, population, gdp, area
		FROM countries
		WHERE world.countries.continent_id = ", continentid);

	PREPARE stmt FROM @continent_info;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	PREPARE stmt FROM @continent_data;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

END // 

DELIMITER ;
