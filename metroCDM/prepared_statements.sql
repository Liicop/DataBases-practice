--Usando prepared statements

USE metro_cdmx;

DROP PROCEDURE IF EXISTS get_line_stations;

DELIMITER //

CREATE PROCEDURE get_line_stations(
	IN line_name VARCHAR(20)
)

BEGIN
	DECLARE line_id BIGINT(20);

	SELECT metro_cdmx.lines.id
	INTO line_id
	FROM metro_cdmx.lines
	WHERE metro_cdmx.lines.name = line_name
	COLLATE utf8mb4_unicode_ci;


	SET @sql = CONCAT("
		SELECT lines.name AS line_name, GROUP_CONCAT(stations.name) AS stations
		FROM lines_stations
		INNER JOIN metro_cdmx.lines ON lines_stations.line_id = metro_cdmx.lines.id
		INNER JOIN stations ON lines_stations.station_id = stations.id
		WHERE metro_cdmx.lines.id = ", line_id);

	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

END //

DELIMITER ;
