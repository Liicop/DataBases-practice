--Creando la tabla para los conductores activos

USE metro_cdmx;


CREATE TABLE active_drivers(
	id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	driver_id BIGINT(20) UNSIGNED NOT NULL,

	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY(id),
	CONSTRAINT active_driver_driver_id_foreign
	FOREIGN KEY(driver_id) REFERENCES drivers(id)
)
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
