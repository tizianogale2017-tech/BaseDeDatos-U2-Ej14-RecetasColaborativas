-- Base de Datos I - Unidad 4 - Ej14: RecetasColaborativas
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS receta_ingrediente;
DROP TABLE IF EXISTS INGREDIENTE;
DROP TABLE IF EXISTS RESENA;
DROP TABLE IF EXISTS PASO;
DROP TABLE IF EXISTS RECETA;
DROP TABLE IF EXISTS MIEMBRO;

CREATE TABLE MIEMBRO (
    id_miembro INT PRIMARY KEY,
    nombre_miembro VARCHAR(50),
    email_miembro VARCHAR(50) UNIQUE,
    tipo_perfil VARCHAR(50),
    fecha_registro DATE,
    contrasena VARCHAR(100)
);

CREATE TABLE RECETA (
    id_receta INT PRIMARY KEY,
    id_miembro INT,
    codigo_receta VARCHAR(50) UNIQUE,
    titulo_receta VARCHAR(50),
    descripcion_receta VARCHAR(100),
    tiempo_preparacion VARCHAR(100),
    porciones VARCHAR(100),
    dificultad VARCHAR(50),
    FOREIGN KEY (id_miembro) REFERENCES MIEMBRO(id_miembro)
);

CREATE TABLE PASO (
    id_paso INT PRIMARY KEY,
    id_receta INT,
    numero_paso INT,
    descripcion_instruccion VARCHAR(50),
    url_imagen VARCHAR(100),
    tiempo_estimado_paso INT,
    utensilios_requeridos VARCHAR(100),
    FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta)
);

CREATE TABLE RESENA (
    id_resena INT PRIMARY KEY,
    id_miembro INT,
    id_receta INT,
    puntuacion INT,
    comentario VARCHAR(50),
    fecha_publicacion DATE,
    FOREIGN KEY (id_miembro) REFERENCES MIEMBRO(id_miembro),
    FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta)
);

CREATE TABLE INGREDIENTE (
    id_ingrediente INT PRIMARY KEY,
    codigo_ingrediente VARCHAR(50) UNIQUE,
    nombre_ingrediente VARCHAR(50),
    unidad_medida VARCHAR(50),
    categoria_ingrediente VARCHAR(50),
    calorias_por_unidad VARCHAR(100)
);

CREATE TABLE receta_ingrediente (
    id_rec_ing INT PRIMARY KEY,
    id_receta INT,
    id_ingrediente INT,
    cantidad INT,
    es_opcional VARCHAR(50),
    FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta),
    FOREIGN KEY (id_ingrediente) REFERENCES INGREDIENTE(id_ingrediente)
);

-- Datos de MIEMBRO
INSERT INTO MIEMBRO (id_miembro, nombre_miembro, email_miembro, tipo_perfil, fecha_registro) VALUES (1, 'Chef Rita', 'rita@mail.com', 'Profesional', '2025-10-01');
INSERT INTO MIEMBRO (id_miembro, nombre_miembro, email_miembro, tipo_perfil, fecha_registro) VALUES (2, 'Don Beto', 'beto@mail.com', 'Aficionado', '2025-10-15');
INSERT INTO MIEMBRO (id_miembro, nombre_miembro, email_miembro, tipo_perfil, fecha_registro) VALUES (3, 'Mili Cocina', 'mili@mail.com', 'Aficionado', '2025-11-03');
INSERT INTO MIEMBRO (id_miembro, nombre_miembro, email_miembro, tipo_perfil, fecha_registro) VALUES (4, 'Paula Dulce', 'paula@mail.com', 'Aficionado', '2026-01-08');

-- Datos de RECETA
INSERT INTO RECETA (id_receta, id_miembro, codigo_receta, titulo_receta, dificultad) VALUES (1, 1, 'REC-001', 'Empanadas mendocinas', 'Media');
INSERT INTO RECETA (id_receta, id_miembro, codigo_receta, titulo_receta, dificultad) VALUES (2, 2, 'REC-003', 'Asado de tira', 'Media');
INSERT INTO RECETA (id_receta, id_miembro, codigo_receta, titulo_receta, dificultad) VALUES (3, 3, 'REC-004', 'Tarta de calabaza', 'Baja');
INSERT INTO RECETA (id_receta, id_miembro, codigo_receta, titulo_receta, dificultad) VALUES (4, 4, 'REC-005', 'Alfajores de maicena', 'Media');

-- Datos de PASO
INSERT INTO PASO (id_paso, id_receta, numero_paso, descripcion_instruccion, tiempo_estimado_paso) VALUES (1, 1, 1, 'Preparar el relleno', 20);
INSERT INTO PASO (id_paso, id_receta, numero_paso, descripcion_instruccion, tiempo_estimado_paso) VALUES (2, 1, 2, 'Armar y cerrar las empanadas', 15);
INSERT INTO PASO (id_paso, id_receta, numero_paso, descripcion_instruccion, tiempo_estimado_paso) VALUES (3, 2, 1, 'Encender el fuego', 30);
INSERT INTO PASO (id_paso, id_receta, numero_paso, descripcion_instruccion, tiempo_estimado_paso) VALUES (4, 3, 1, 'Cocinar la calabaza', 25);

-- Datos de RESENA
INSERT INTO RESENA (id_resena, id_miembro, id_receta, puntuacion, comentario) VALUES (1, 2, 1, 5, 'Muy ricas');
INSERT INTO RESENA (id_resena, id_miembro, id_receta, puntuacion, comentario) VALUES (2, 3, 1, 4, 'Buena receta');
INSERT INTO RESENA (id_resena, id_miembro, id_receta, puntuacion, comentario) VALUES (3, 1, 3, 3, 'Le faltó sal');
INSERT INTO RESENA (id_resena, id_miembro, id_receta, puntuacion, comentario) VALUES (4, 2, 4, 4, 'Me encantó');

-- Datos de INGREDIENTE
INSERT INTO INGREDIENTE (id_ingrediente, codigo_ingrediente, nombre_ingrediente, unidad_medida, categoria_ingrediente) VALUES (1, 'ING-02', 'Carne picada', 'g', 'Carnes');
INSERT INTO INGREDIENTE (id_ingrediente, codigo_ingrediente, nombre_ingrediente, unidad_medida, categoria_ingrediente) VALUES (2, 'ING-03', 'Cebolla', 'unidad', 'Verduras');
INSERT INTO INGREDIENTE (id_ingrediente, codigo_ingrediente, nombre_ingrediente, unidad_medida, categoria_ingrediente) VALUES (3, 'ING-04', 'Calabaza', 'g', 'Verduras');
INSERT INTO INGREDIENTE (id_ingrediente, codigo_ingrediente, nombre_ingrediente, unidad_medida, categoria_ingrediente) VALUES (4, 'ING-05', 'Maicena', 'g', 'Cereales');

-- Datos de receta_ingrediente
INSERT INTO receta_ingrediente (id_rec_ing, id_receta, id_ingrediente, cantidad, es_opcional) VALUES (1, 1, 1, 400, 'No');
INSERT INTO receta_ingrediente (id_rec_ing, id_receta, id_ingrediente, cantidad, es_opcional) VALUES (2, 1, 2, 2, 'No');
INSERT INTO receta_ingrediente (id_rec_ing, id_receta, id_ingrediente, cantidad, es_opcional) VALUES (3, 3, 3, 600, 'No');
INSERT INTO receta_ingrediente (id_rec_ing, id_receta, id_ingrediente, cantidad, es_opcional) VALUES (4, 4, 4, 300, 'Sí');
