--Actualizar o cambiar los registros de alguna tabla

USE metro_cdmx;

UPDATE metro_cdmx.stations
SET name = 'Lázaro Cárdenas'
WHERE id = 1;

UPDATE metro_cdmx.stations
SET name = 'Ferrería'
WHERE id = 2;	

UPDATE metro_cdmx.stations
SET name = 'Pantitlán'
WHERE id = 3;

UPDATE metro_cdmx.stations
SET name = 'Tacuba'
WHERE id = 4;

UPDATE metro_cdmx.stations
SET name = 'Martín Carrera'
WHERE id = 5;
