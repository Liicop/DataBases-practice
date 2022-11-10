--Consultas para hallar distancias entre dos puntos con queries anidados, debido a que ya se usó el tipo de dato POINT

USE metro_cdmx;

SELECT ST_DISTANCE_SPHERE (
	(SELECT location FROM locations 
    INNER JOIN stations ON locations.station_id = stations.id
    WHERE stations.name = 'Aculco'),
    (SELECT location FROM locations 
    INNER JOIN stations ON locations.station_id = stations.id
    WHERE stations.name = 'Sevilla')) / 1000 AS distance;
