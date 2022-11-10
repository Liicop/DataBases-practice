--Creando Tabla pivote

USE metro_cdmx;

CREATE TABLE metro_cdmx.lines_stations (
	id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,

	line_id BIGINT(20) UNSIGNED NOT NULL,
	station_id BIGINT(20) UNSIGNED NOT NULL,

	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(id),

	CONSTRAINT lines_station_line_id_foreign
	FOREIGN KEY(line_id) REFERENCES metro_cdmx.lines(id),

	CONSTRAINT lines_stations_station_id_foreign
	FOREIGN KEY(station_id) REFERENCES metro_cdmx.stations(id)
)
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
