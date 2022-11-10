--Creación de la tabla locations con el tipo de dato POINT

USE metro_cdmx;

CREATE TABLE metro_cdmx.locations (
	id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

	location POINT NOT NULL, 
	station_id BIGINT(20) UNSIGNED NOT NULL,

	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY(id),
	CONSTRAINT locations_station_id_foreign
	FOREIGN KEY(station_id) REFERENCES metro_cdmx.stations(id)
)
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
