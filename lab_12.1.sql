CREATE DATABASE IF NOT EXISTS c4;

USE c4;

/* 1.i */
CREATE TABLE DEPOSIT (ACTNO VARCHAR(5) ,CNAME VARCHAR(18) , BNAME VARCHAR(18) , AMOUNT INT ,ADATE DATE);

CREATE TABLE BRANCH(BNAME VARCHAR(18),CITY VARCHAR(18)); 

CREATE TABLE CUSTOMERS(CNAME VARCHAR(19) ,CITY VARCHAR(18));

CREATE TABLE BORROW(LOANNO VARCHAR(5), CNAME VARCHAR(18), BNAME VARCHAR(18), AMOUNT INT);

/* 1.ii */
INSERT INTO DEPOSIT
VALUES
("100", "ANIL", "VRCE", 1000.00, 19950301),
("101", "SUNIL", "AJNI", 5000.00, 19960104),
("102", "MEHUL", "KAROLBAGH", 3500.00, 19951117),
("104", "MADHURI", "CHANDI", 1200.00, 19951217),
("105", "PRMOD", "M.G.ROAD", 3000.00, 19960327),
("106", "SANDIP", "ANDHERI", 2000.00, 19960331),
("107", "SHIVANI", "VIRAR", 1000.00, 19950905),
("108", "KRANTI", "NEHRU PLACE", 5000.00, 19950702),
("109", "MINU", "POWAI", 7000.00, 19950810);

INSERT INTO Branch
VALUES
("VRCE", "NAGPUR"),
("AJNI", "NAGPUR"),
("KAROLBAGH", "DELHI"),
("CHANDI", "DELHI"),
("DHARAMPETH", "NAGPUR"),
("M.G.ROAD", "BANGLORE"),
("ANDHERI", "BOMBAY"),
("VIRAR", "BOMBAY"),
("NEHRU PLACE", "DELHI"),
("POWAI", "BOMBAY");

INSERT INTO CUSTOMERS
VALUES
("ANIL", "CALCUTTA"),
("SUNIL", "DELHI"),
("MEHUL", "BARODA"),
("MANDAR", "PATNA"),
("MADHURI", "NAGPUR"),
("PRAMOD", "NAGPUR"),
("SANDIP", "SURAT"),
("SHIVANI", "BOMBAY"),
("KRANTI", "BOMBAY"),
("NAREN", "BOMBAY");

INSERT INTO BORROW
VALUES
("201", "ANIL", "VRCE", 1000.00),
("206", "MEHUL", "AJNI", 5000.00),
("311", "SUNIL", "DHARAMPETH", 3000.00),
("321", "MADHURI", "ANDHERI", 2000.00),
("375", "PRMOD", "VIRAR", 8000.00),
("481", "KRANTI", "NEHRU PLACE", 3000.00);

/* iii */
/* 1 */
DESC DEPOSIT;
DESC BRANCH;

/* 2 */
DESC BORROW;
DESC CUSTOMERS;

/* 3 */
SELECT * FROM DEPOSIT;
/* 4 */
SELECT * FROM BRANCH;
/* 5 */
SELECT * FROM CUSTOMERS;
/* 6 */
SELECT * FROM BORROW;

/* 7 */
SELECT ACTNO, AMOUNT FROM
DEPOSIT;

/* 8 */
SELECT CNAME FROM
DEPOSIT
WHERE AMOUNT > 4000;

/* 9 */
SELECT CNAME FROM
DEPOSIT
WHERE ADATE > 19961201;

DROP DATABASE IF EXISTS c4;