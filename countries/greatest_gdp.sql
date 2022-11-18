--Procedimiento almacenado para hallar los paises con el mayor PIB.


USE world;

DROP PROCEDURE IF EXISTS greatest_gdp;

DELIMITER // 

CREATE PROCEDURE greatest_gdp(
	IN limite INTEGER
)

BEGIN

	SELECT name AS Cuntry, gdp AS GDP
	FROM world.countries
	ORDER BY gdp DESC
	LIMIT limite;


END //

DELIMITER ;

CALL greatest_gdp(20);
