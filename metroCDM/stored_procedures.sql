--Creando procedimientos almacenados

USE metro_cdmx;

DROP PROCEDURE IF EXISTS distance_between_stations;


DELIMITER // --Desde acá empieza le región donde se crea el procedimiento alm

--Se crea el procedimiento alm con un nombre y unos parámetros
CREATE PROCEDURE distance_between_stations( 
	IN station_one VARCHAR(60), 
	IN station_two VARCHAR(60),  
	IN meters BOOLEAN,
	OUT result VARCHAR(130)
)
BEGIN 
	DECLARE distance FLOAT;
	SET distance = (

	SELECT
	ST_DISTANCE_SPHERE
	((SELECT location 
	FROM locations
	INNER JOIN stations ON stations.id = locations.station_id
	WHERE stations.name = station_one),
	(SELECT location
        FROM locations
        INNER JOIN stations ON stations.id = locations.station_id
        WHERE stations.name = station_two)) / IF(meters,1,1000));

	IF meters THEN
		SET distance = ROUND(distance);
	ELSE
		SET distance = ROUND(distance,3);
	END IF;

	SET result = CONCAT('Distancia entre ', station_one, ' y ', station_two, ' = ', distance, IF(meters,'m','km'));

END //  

DELIMITER ;

CALL distance_between_stations('Balderas', 'Sevilla', true, @distance);

SELECT @distance 'Distancia entre estaciones';

