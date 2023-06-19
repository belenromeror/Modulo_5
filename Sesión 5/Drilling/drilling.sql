tabla reparto
id foranea peliculas
actor

tabla peliculas
id 
peliculas
estreno
Director
BEGIN;

CREATE TABLE peliculas (
    id INT PRIMARY KEY,
    pelicula VARCHAR(255),
    estreno INT,
    director VARCHAR(255)
);

CREATE TABLE reparto(
    id_pelicula INT,
    actor VARCHAR(255)
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

