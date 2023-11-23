CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE
    Hetav_Deposit (
        ACTNO VARCHAR(5),
        CNAME VARCHAR(18),
        BNAME VARCHAR(18),
        AMOUNT INT,
        ADATE DATE
    );

INSERT INTO Hetav_Deposit
VALUES (
        "100",
        "ANIL",
        "VRCE",
        1000.00,
        19950301
    ), (
        "101",
        "SUNIL",
        "AJNI",
        5000.00,
        19960104
    ), (
        "102",
        "MEHUL",
        "KAROLBAGH",
        3500.00,
        19951117
    ), (
        "104",
        "MADHURI",
        "CHANDI",
        1200.00,
        19951217
    ), (
        "105",
        "PRMOD",
        "M.G.ROAD",
        3000.00,
        19960327
    ), (
        "106",
        "SANDIP",
        "ANDHERI",
        2000.00,
        19960331
    ), (
        "107",
        "SHIVANI",
        "VIRAR",
        1000.00,
        19950905
    ), (
        "108",
        "KRANTI",
        "NEHRU PLACE",
        5000.00,
        19950702
    ), (
        "109",
        "MINU",
        "POWAI",
        7000.00,
        19950810
    );

CREATE TABLE
    Hetav_Customers(
        CNAME VARCHAR(19) PRIMARY KEY,
        CITY VARCHAR(18)
    );

CREATE TABLE Hetav_Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3));
CREATE TABLE Hetav_Borrow(LOANNO VARCHAR(5), CNAME VARCHAR(18) , BNAME VARCHAR(18), AMOUNT INT);
INSERT INTO Hetav_Borrow
VALUES
("201", "ANIL", "VRCE", 1000.00),
("206", "MEHUL", "AJNI", 5000.00),
("311", "SUNIL", "DHARAMPETH", 3000.00),
("321", "MADHURI", "ANDHERI", 2000.00),
("375", "PRMOD", "VIRAR", 8000.00),
("481", "KRANTI", "NEHRU PLACE", 3000.00);

INSERT INTO Hetav_Employee
VALUES
(101, "Smith", 800, NULL, 20),
(102, "Snehal", 1600, 300, 25),
(103, "Adama", 1100, 0, 20),
(104, "Aman", 3000, NULL, 15),
(105, "Anita", 5000, 50000, 10),
(106, "Sneha", 2450, 24500, 10),
(107, "Anamika", 2975, NULL, 30);

INSERT INTO Hetav_Customers
VALUES ("ANIL", "CALCUTTA"), ("SUNIL", "DELHI"), ("MEHUL", "BARODA"), ("MANDAR", "PATNA"), ("MADHURI", "NAGPUR"), ("PRAMOD", "NAGPUR"), ("SANDIP", "SURAT"), ("SHIVANI", "BOMBAY"), ("KRANTI", "BOMBAY"), ("NAREN", "BOMBAY");

CREATE TABLE Hetav_Branch(BNAME VARCHAR(18),CITY VARCHAR(18));

INSERT INTO Hetav_Branch
VALUES ("VRCE", "NAGPUR"), ("AJNI", "NAGPUR"), ("KAROLBAGH", "DELHI"), ("CHANDI", "DELHI"), ("DHARAMPETH", "NAGPUR"), ("M.G.ROAD", "BANGLORE"), ("ANDHERI", "BOMBAY"), ("VIRAR", "BOMBAY"), ("NEHRU PLACE", "DELHI"), ("POWAI", "BOMBAY");


/* 1 */
UPDATE Hetav_Deposit SET AMOUNT = AMOUNT + (AMOUNT*10/100);

SELECT * FROM Hetav_Deposit;

/* 2 */
UPDATE Hetav_Deposit
SET
    AMOUNT = AMOUNT + (AMOUNT * 10 / 100)
WHERE BNAME = "VRCE";

SELECT * FROM Hetav_Deposit;

/* 3 */
UPDATE Hetav_Deposit
SET
    AMOUNT = AMOUNT + (AMOUNT * 10 / 100)
WHERE CNAME IN(
        SELECT CNAME
        FROM Hetav_Customers
        WHERE
            CITY = "NAGPUR"
    )
    AND BNAME IN (
        SELECT BNAME
        FROM Hetav_Branch
        WHERE BNAME = "BOMBAY"
    );

SELECT * FROM Hetav_Deposit;

/* 4 */
UPDATE Hetav_Employee
SET dept_no =(
SELECT dept_no FROM (SELECT dept_no FROM Hetav_Employee WHERE emp_no = 7844) AS TempTable
)
WHERE emp_no = 7788;

SELECT * FROM Hetav_Employee;

/* 5 */
UPDATE Hetav_Deposit AS A
JOIN Hetav_Deposit AS B ON A.BNAME = B.BNAME
SET A.AMOUNT = A.AMOUNT - 10
WHERE A.CNAME = 'ANIL'
AND B.CNAME = 'SUNIL';

SELECT * FROM Hetav_Deposit;

/* 6 */
UPDATE Hetav_Deposit D1
JOIN (
SELECT BNAME, MAX(AMOUNT) AS Max_Hetav_Deposit
FROM Hetav_Deposit
GROUP BY BNAME
) D2 ON D1.BNAME = D2.BNAME AND D1.AMOUNT = D2.Max_Hetav_Deposit
SET D1.AMOUNT = D1.AMOUNT + 100;

SELECT * FROM Hetav_Deposit;

/* 7 */
DELETE FROM Hetav_Deposit
WHERE BNAME IN (
SELECT B.BNAME
FROM Hetav_Branch B
JOIN (
SELECT BNAME, COUNT(*) AS CustomerCount
FROM Hetav_Customers
GROUP BY BNAME
) C ON B.BNAME = C.BNAME
WHERE CustomerCount BETWEEN 1 AND 3
);

SELECT * FROM Hetav_Deposit;

/* 8 */
DELETE FROM Hetav_Deposit
WHERE CNAME = 'Vijay';

SELECT * FROM Hetav_Deposit;

/* 9 */

DELETE FROM Hetav_Borrow
WHERE BNAME IN (
SELECT B.BNAME
FROM Hetav_Branch B
JOIN (
SELECT BNAME, AVG(AMOUNT) AS AvgLoan
FROM Hetav_Borrow
GROUP BY BNAME
) L ON B.BNAME = L.BNAME
WHERE AvgLoan < 1000
);

SELECT * FROM Hetav_Deposit;

DROP DATABASE IF EXISTS c4;