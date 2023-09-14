CREATE DATABASE IF NOT EXISTS HETAV;

USE HETAV;

CREATE TABLE IF NOT EXISTS c4(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    enrollment_no INT UNIQUE
);

DESC c4;

INSERT INTO c4
VALUES
(1, "Hetav Shah", 220179),
(2, "a", 220128),
(3, "b", 220189),
(4, "c", 220274),
(5, "d", 220253),
(6, "HEHEHEEHEHHEHE", 220292);

SELECT * FROM c4;
/*  */
START TRANSACTION;

ALTER TABLE c4 ADD marks INT;

SELECT * FROM c4;
/*  */
COMMIT;

START TRANSACTION;

DELETE FROM c4 WHERE enrollment_no=220274;

SELECT * FROM c4;

/*  */
ROLLBACK;

SELECT * FROM c4;

/*  */
START TRANSACTION;

SAVEPOINT save_me;

INSERT INTO c4 
VALUES
(7, "ejiae", 220163, 100);  

SELECT * FROM c4;

/*  */
ROLLBACK TO save_me;

SELECT * FROM c4;

/*  */

DROP DATABASE IF EXISTS HETAV;