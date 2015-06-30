SET autocommit = 0;

START TRANSACTION WITH CONSISTENT SNAPSHOT;

INSERT INTO nacionalidades (codigo,nombre) VALUES ('CL','Chile');
INSERT INTO nacionalidades (codigo,nombre) VALUES ('PE','Perú');
INSERT INTO nacionalidades (codigo,nombre) VALUES ('CO','Colombia');


INSERT INTO materias (nombre) VALUES ('Matemáticas');
INSERT INTO materias (nombre) VALUES ('Lenguaje');
INSERT INTO materias (nombre) VALUES ('Inglés');

COMMIT;


SET autocommit = 1;