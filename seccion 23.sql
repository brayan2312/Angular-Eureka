CREATE database db_microservicios_examenes;

USE db_microservicios_examenes;


-- ************************************ asignaturas ******************************************************
CREATE TABLE `asignaturas` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`padre_id` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1a657vrlox5uthk8wbwrxh6e8` (`padre_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=26
;

INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (1, 'Matemáticas', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (2, 'Lenguaje', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (3, 'Inglés', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (4, 'Ciencias Naturales', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (5, 'Ciencias Sociales y Historia', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (6, 'Música', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (7, 'Artes', NULL);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (8, 'Algebra', 1);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (9, 'Aritmética', 1);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (10, 'Trigonometría', 1);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (11, 'Lectura y comprensión', 2);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (12, 'Verbos', 2);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (13, 'Gramática', 2);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (14, 'Inglés', 3);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (15, 'Gramática', 3);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (16, 'Verbos', 3);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (17, 'Ciencias Naturales', 4);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (18, 'Biología', 4);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (19, 'Física', 4);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (20, 'Quimica', 4);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (21, 'Historia', 5);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (22, 'Ciencias Sociales', 5);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (23, 'Filosofía', 5);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (24, 'Música', 6);
INSERT INTO `asignaturas` (`id`, `nombre`, `padre_id`) VALUES (25, 'Artes', 7);

-- ************************************ cursos ******************************************************

CREATE TABLE `cursos` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`create_at` DATETIME NULL DEFAULT NULL,
	`nombre` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=10
;


INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (1, '2023-02-28 11:28:23', '1ro Primaria2');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (2, '2023-02-28 11:28:31', '2do Primaria');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (3, '2023-02-28 11:28:38', '3ro Primaria');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (4, '2023-02-28 11:28:49', '1ro Secundaria');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (5, '2023-02-28 11:28:54', '2do Secundaria');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (6, '2023-02-28 11:29:00', '3ro Secundaria');
INSERT INTO `cursos` (`id`, `create_at`, `nombre`) VALUES (7, '2023-02-28 11:29:06', '4to Secundaria');

-- ************************************ examenes ******************************************************

CREATE TABLE `examenes` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`create_at` DATETIME NULL DEFAULT NULL,
	`nombre` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`asignatura_hija_id` BIGINT(20) NOT NULL,
	`asignatura_padre_id` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK8c89lnsrfhtuvaho2asigrcaw` (`asignatura_hija_id`) USING BTREE,
	INDEX `FKbrfkorjspukivcec7dsn26dv8` (`asignatura_padre_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=5
;

INSERT INTO `examenes` (`id`, `create_at`, `nombre`, `asignatura_hija_id`, `asignatura_padre_id`) VALUES (1, '2022-02-01 00:00:00', 'Historia', 21, 5);
INSERT INTO `examenes` (`id`, `create_at`, `nombre`, `asignatura_hija_id`, `asignatura_padre_id`) VALUES (2, '2023-03-14 17:31:24', 'prueba', 12, 2);
INSERT INTO `examenes` (`id`, `create_at`, `nombre`, `asignatura_hija_id`, `asignatura_padre_id`) VALUES (3, '2023-03-15 18:04:31', 'prueba 3', 14, 3);
INSERT INTO `examenes` (`id`, `create_at`, `nombre`, `asignatura_hija_id`, `asignatura_padre_id`) VALUES (4, '2023-03-15 18:19:00', 'prueba 4', 18, 4);




-- ************************************ cursos_examenes ******************************************************

CREATE TABLE `cursos_examenes` (
	`curso_id` BIGINT(20) NOT NULL,
	`examenes_id` BIGINT(20) NOT NULL,
	INDEX `FK6ags9h8g0q074pch8ckfy8nw5` (`examenes_id`) USING BTREE,
	INDEX `FKbj3nwplxm8hswqcbt0tmrqagj` (`curso_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
;

INSERT INTO `cursos_examenes` (`curso_id`, `examenes_id`) VALUES (7, 3);
INSERT INTO `cursos_examenes` (`curso_id`, `examenes_id`) VALUES (7, 4);
INSERT INTO `cursos_examenes` (`curso_id`, `examenes_id`) VALUES (7, 1);
INSERT INTO `cursos_examenes` (`curso_id`, `examenes_id`) VALUES (7, 2);


-- ************************************ cursos_alumnos ******************************************************


CREATE TABLE `cursos_alumnos` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`alumno_id` BIGINT(20) NULL DEFAULT NULL,
	`curso_id` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `UK_pb88irw9u3c0h2lsf3q1kluv9` (`alumno_id`) USING BTREE,
	INDEX `FKb90xg2w8jai6w555c3erim0cv` (`curso_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=11
;


INSERT INTO `cursos_alumnos` (`id`, `alumno_id`, `curso_id`) VALUES (4, 2, 7);
INSERT INTO `cursos_alumnos` (`id`, `alumno_id`, `curso_id`) VALUES (10, 10, 7);
INSERT INTO `cursos_alumnos` (`id`, `alumno_id`, `curso_id`) VALUES (6, 4, 7);
INSERT INTO `cursos_alumnos` (`id`, `alumno_id`, `curso_id`) VALUES (7, 5, 7);


-- ************************************ preguntas ******************************************************
CREATE TABLE `preguntas` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`texto` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`examen_id` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK9hlw51x7hfqs1tv3sviwqycqi` (`examen_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=14
;

INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (1, 'Quién descubrió América', 1);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (2, 'En qué año se descubrió América', 1);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (3, 'Capital del imperio Inca', 1);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (5, 'ss', 2);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (7, 'ssss', 2);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (11, 'Pregunta 2', 3);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (9, 'Pregunta 1', 3);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (10, 'q', 4);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (12, 'Pregunta 3', 3);
INSERT INTO `preguntas` (`id`, `texto`, `examen_id`) VALUES (13, 'Pregunta  4', 3);

/*  Primero crea la DB en postgress */
/* POSTGRESS */ /* POSTGRESS */ /* POSTGRESS */ /* POSTGRESS */ /* POSTGRESS */
/* db_microservicios_usuarios **/
INSERT INTO alumnos (id, apellido, create_at, email, nombre, foto) VALUES
	('Guzmán', '2019-11-02 15:51:55.000000', 'andres@mail.com', 'Andrés Jose', NULL),
	('Doe', '2019-11-02 15:52:32.000000', 'john@gmail.com', 'John', NULL),
	('Doe', '2019-11-05 09:03:14.000000', 'jose@mail.com', 'Jose', NULL),
	('García', '2019-11-15 09:56:04.000000', 'pepa@mail.com', 'Pepa', NULL),
	('Mena', '2019-11-15 09:56:30.000000', 'lalo@mail.com', 'Lalo', NULL),
	('Fernández', '2019-11-15 09:56:49.000000', 'pepe@mail.com', 'Pepe', NULL),
	('González', '2019-11-15 09:57:33.000000', 'bea@mail.com', 'Bea', NULL),
	('Martínez', '2019-11-15 09:57:50.000000', 'luci@mail.com', 'Luci', NULL),
	('Rodríguez', '2019-11-15 09:58:23.000000', 'pato@mail.com', 'Pato', NULL),
	( 'Pérez', '2019-11-16 12:47:57.000000', 'jano@mail.com', 'Jano', NULL);


  /***/
/* respuestas db_microservicios_respuestas */
