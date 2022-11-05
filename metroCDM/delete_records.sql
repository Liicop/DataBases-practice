-- Eliminando tuplas o registros de las base de datos

USE metro_cdmx;

DELETE FROM stations
WHERE id IN (164, 165, 166);
