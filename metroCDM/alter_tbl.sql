-- Modificar la estructura de las tablas DDL

USE metro_cdmx;

ALTER TABLE metro_cdmx.stations
AUTO_INCREMENT=1,
MODIFY COLUMN 
name VARCHAR(55) NOT NULL,
MODIFY COLUMN
id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT

;
