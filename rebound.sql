BEGIN;

CREATE TABLE editoriales(
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE libros(
    codigo SERIAL PRIMARY KEY,
    titulo VARCHAR (255),
    codigo_editorial INT,
    FOREIGN KEY (codigo_editorial)
    );
SAVEPOINT 1;



INSERT INTO editoriales(nombre) VALUES
    ('Anaya'),
    ('Andina'),
    ('S.M');

SAVEPOINT 2;

INSERT INTO libros(titulo, codigo_editorial) VALUES
    ('Don Quijote de La Mancha', 1),
    ('El principito',2),
    ('El principe',3),
    ('Diplomacia', 3),
    ('Don Quijote de La Mancha II', 1);

SAVEPOINT 3;

ALTER TABLE libros ADD autor VARCHAR(255), precio MONEY;

SAVEPOINT 4;

UPDATE libros SET autor = CASE
    WHEN codigo = 1 THEN 'Miguel de Cervantes'
    WHEN codigo = 2 THEN 'Antoine Saint Exupery'
    WHEN codigo = 3 THEN 'Maquiavelo'
    WHEN codigo = 4 THEN ' Henry Kissinger'
    WHEN codigo = 5 THEN 'Miguel de Cervantes'
    END
WHERE codigo IN(1,2,3,4,5);

SAVEPOINT 5;

UPDATE libros SET precio = CASE
    WHEN codigo = 1 THEN '150'
    WHEN codigo = 2 THEN '120'
    WHEN codigo = 3 THEN '180'
    WHEN codigo = 4 THEN '170'
    WHEN codigo = 5 THEN '140'
    END
WHERE codigo IN(1,2,3,4,5);

SAVEPOINT 6;

INSERT INTO libros (titulo, codigo_editorial, autor, precio) VALUES
    ('El mundo de luna', 1, "Francisco Puelma", 120),
    ('Bluey', 2, 'Pepa Pig', 150);

SAVEPOINT 7;

DELETE FROM libros WHERE codigo_editorial = 1;

BEGIN;
