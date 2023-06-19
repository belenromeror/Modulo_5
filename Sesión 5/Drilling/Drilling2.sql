BEGIN;
SAVEPOINT uno;
CREATE TABLE peliculas (
    id INT PRIMARY KEY,
    pelicula VARCHAR(255),
    estreno INT,
    director VARCHAR(255)
);

CREATE TABLE reparto(
    id_pelicula INT,
    actor VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

COMMIT;
DROP TABLE reparto;
SELECT * FROM peliculas;

COPY peliculas(id, pelicula, estreno, director) FROM '/Users/belenromerorodriguez/Documents/GitHub/Modulo_5/Sesión 5/Drilling/peliculas.csv';
COPY reparto(id_pelicula, actor) FROM '/Users/belenromerorodriguez/Documents/GitHub/Modulo_5/Sesión 5/Drilling/reparto.csv';

--Listar todos los actores que aparecen en la película Titanic, indicando el título de la película.
-- año de estreno, director y todo el reparto
-- sin alias
SELECT titulo, estreno, director, actor FROM peliculas
JOIN reparto
ON peliculas.id = reparto.id_pelicula
WHERE titulo = 'Titanic';
-- con alias
SELECT p.titulo, p.estreno, p.director, r.actor FROM peliculas AS p
JOIN reparto AS r
ON p.id_pelicula = r.id_pelicula
WHERE titulo = 'Titanic';

-- Listar los 10 directores más populares, indicando su nombre y cuantas peliculas aparecen en el top 100

SELECT p.director, COUNT(*) AS peliculas_en_top_100
FROM peliculas p
WHERE p.id_pelicula IN (
	SELECT id_pelicula
	FROM peliculas
	ORDER BY estreno DESC LIMIT 100
)
GROUP BY p.director
ORDER BY peliculas_en_top_100 DESC
LIMIT 10;

--Indicar cuantos actores distintos hay
SELECT * FROM reparto;
SELECT COUNT (DISTINCT actor) AS Total_Distintos FROM reparto;
SELECT actor, COUNT (*) AS contador FROM reparto ORDER BY actor;

--Indicar las peliculas estrenadas entre los años 1990 y 1999 (ambos incluidos, ordenadas por titulo de manera ascendente)

SELECT titulo, estreno FROM peliculas WHERE estreno BETWEEN 1990 AND 1999
ORDER BY titulo ASC;

--Listar los actores de la pelicula más nueva
SELECT r.actor, p.titulo, p.estreno FROM peliculas AS p
JOIN reparto as r




