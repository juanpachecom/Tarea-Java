SET autocommit = 0;

START TRANSACTION WITH CONSISTENT SNAPSHOT;

-- 
-- Elimino tablas antes de crearlas
-- 
DROP TABLE IF EXISTS copias CASCADE;
DROP TABLE IF EXISTS libros CASCADE;
DROP TABLE IF EXISTS autores CASCADE;
DROP TABLE IF EXISTS clasificaciones CASCADE;
DROP TABLE IF EXISTS materias CASCADE;
DROP TABLE IF EXISTS nacionalidades CASCADE;


-- 
-- Creo las tablas
-- 
CREATE TABLE nacionalidades (
    id bigint NOT NULL AUTO_INCREMENT,
    codigo varchar(2) NOT NULL,
    nombre varchar(255) NOT NULL,
    UNIQUE (codigo, nombre),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE materias (
    id bigint NOT NULL AUTO_INCREMENT,
    nombre varchar(255) NOT NULL,
    UNIQUE (nombre),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




CREATE TABLE clasificaciones (
    id bigint NOT NULL AUTO_INCREMENT,
    nombre varchar(255) NOT NULL,
    UNIQUE (nombre),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




CREATE TABLE autores (
    id bigint NOT NULL AUTO_INCREMENT,
    nombres varchar(255) NOT NULL,
    apellidos varchar(255) NOT NULL,
    nacionalidad_id bigint NOT NULL,
    UNIQUE (nombres, apellidos, nacionalidad_id),
    FOREIGN KEY (nacionalidad_id) REFERENCES nacionalidades(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



CREATE TABLE libros (
    id bigint NOT NULL AUTO_INCREMENT,
    isbn bigint NOT NULL,
    nombre varchar(255) NOT NULL,
    descripcion text,
    materia_id bigint NOT NULL,
    autor_id bigint NOT NULL,
    clasificacion_id bigint NOT NULL,
    anio int NOT NULL,
    FOREIGN KEY (materia_id) REFERENCES materias(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (autor_id) REFERENCES autores(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (clasificacion_id) REFERENCES clasificaciones(id) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (isbn),
    UNIQUE (nombre, materia_id, autor_id, clasificacion_id),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




CREATE TABLE copias (
    id bigint NOT NULL AUTO_INCREMENT,
    libro_id bigint NOT NULL,
    numeracion int NOT NULL,
    ubicacion varchar(255) NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(id) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (libro_id, numeracion, ubicacion),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

COMMIT;


SET autocommit = 1;