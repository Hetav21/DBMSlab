CREATE DATABASE IF NOT EXISTS HETAV;

USE HETAV;

CREATE TABLE IF NOT EXISTS c4(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    enrollment_no INT UNIQUE
);

DESC c4;

CREATE TABLE IF NOT EXISTS marks(
    id INT PRIMARY KEY,
    cgpa INT NOT NULL
);

DESC marks;

INSERT INTO c4
VALUES
(1, "Hetav Shah", 220179),
(2, "a", 220128),
(3, "b", 220189),
(4, "c", 220274),
(5, "d", 220253),
(6, "HEHEHEEHEHHEHE", 220292),
(9, "Varun Thacker", 220176);

SELECT * FROM c4;

INSERT INTO marks
VALUES
(1, 6.9),
(2, 7),
(3, 8.5),
(4, 3.2),
(5, 9.1),
(6, 8.9),
(7, 4.5),
(8, 8.4);

SELECT * FROM marks;

SELECT * FROM c4
LEFT JOIN marks
ON c4.id = marks.id;

SELECT * FROM c4
RIGHT JOIN marks
ON c4.id = marks.id;

SELECT * FROM c4
LEFT JOIN marks
ON c4.id = marks.id
UNION
SELECT * FROM c4
RIGHT JOIN marks
ON c4.id = marks.id;

SELECT * FROM c4
INNER JOIN marks
ON c4.id = marks.id;

DROP DATABASE IF EXISTS HETAV;