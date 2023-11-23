CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE DEPOSIT (ACTNO VARCHAR(5) ,CNAME VARCHAR(18) , BNAME VARCHAR(18) , AMOUNT INT ,ADATE DATE);
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


CREATE TABLE BRANCH(BNAME VARCHAR(18),CITY VARCHAR(18));
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


CREATE TABLE CUSTOMERS(CNAME VARCHAR(19)  PRIMARY KEY,CITY VARCHAR(18));
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


CREATE TABLE BORROW(LOANNO VARCHAR(5), CNAME VARCHAR(18) , BNAME VARCHAR(18), AMOUNT INT);
INSERT INTO BORROW
VALUES
("201", "ANIL", "VRCE", 1000.00),
("206", "MEHUL", "AJNI", 5000.00),
("311", "SUNIL", "DHARAMPETH", 3000.00),
("321", "MADHURI", "ANDHERI", 2000.00),
("375", "PRMOD", "VIRAR", 8000.00),
("481", "KRANTI", "NEHRU PLACE", 3000.00);


CREATE TABLE Job (job_id VARCHAR(15) ,job_title VARCHAR(30) , min_sal DECIMAL(7,2) , max_sal DECIMAL(7,2));
INSERT INTO Job
VALUES
("IT_PROG", "Programmer", 4000, 10000),
("MK_MGR", "Marketing manager", 9000, 15000),
("FI_MGR", "Finance manager", 8200, 12000),
("FI_ACC", "Account", 4200, 9000),
("LEC", "Lecturer", 6000, 17000),
("COMP_OP", "Computer Operator", 1500, 3000);


CREATE TABLE Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3), CITY VARCHAR(18));
INSERT INTO Employee
VALUES
(101, "Smith", 800, NULL, 20, "CALCUTTA"),
(102, "Snehal", 1600, 300, 25, "DELHI"),
(103, "Adama", 1100, 0, 20, "BARODA"),
(104, "Aman", 3000, NULL, 15, "RAJKOT"),
(105, "Anita", 5000, 50000, 10, "NAGPUR"),
(106, "Sneha", 2450, 24500, 10, "SURAT"),
(107, "Anamika", 2975, NULL, 30, "BOMBAY");

CREATE TABLE Manager (mngr_no DECIMAL(3) ,name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3), CITY VARCHAR(18));
INSERT INTO Manager
VALUES
(102, "Smith", 800, NULL, 20, "CALCUTTA"),
(106, "Snehal", 1600, 300, 25, "DELHI"),
(107, "Adama", 1100, 0, 20, "BARODA"),
(101, "Aman", 3000, NULL, 15, "RAJKOT"),
(103, "Anita", 5000, 50000, 10, "NAGPUR"),
(107, "Sneha", 2450, 24500, 10, "SURAT"),
(104, "Anamika", 2975, NULL, 30, "BOMBAY");

CREATE TABLE  DEPOSITERS (a_no VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2), a_date DATE);
INSERT INTO DEPOSITERS 
VALUES
("101", "Anil", "andheri", 7000, 20060101),
("102", "sunil", "virar", 5000, 20060715),
("103", "jay", "villeparle", 6500, 20060312),
("104", "vijay", "andheri", 8000, 20060917),
("105", "keyur", "dadar", 7500, 20061119),
("106", "mayur", "borivali", 5500, 20061221);

CREATE TABLE EMP_NEW (emp_no VARCHAR(5) ,emp_name VARCHAR(18) , BNAME VARCHAR(18) , AMOUNT INT ,joinDate DATE, a_no INT DEFAULT NULL);
INSERT INTO EMP_NEW
VALUES
("100", "ANIL", "VRCE", 1000.00, 19950301, 101),
("101", "SUNIL", "AJNI", 5000.00, 19960104, 102),
("102", "MEHUL", "KAROLBAGH", 3500.00, 19951117, NULL),
("104", "SCOTT", "CHANDI", 1200.00, 19951217, NULL),
("105", "PRMOD", "M.G.ROAD", 3000.00, 19960327, NULL),
("106", "SANDIP", "ANDHERI", 2000.00, 19960331, NULL),
("107", "SHIVANI", "VIRAR", 1000.00, 19950905, NULL),
("108", "KRANTI", "NEHRU PLACE", 5000.00, 19950702, NULL),
("109", "MINU", "POWAI", 7000.00, 19950810, NULL);

CREATE TABLE DEPARTMENT (emp_no VARCHAR(5) ,city VARCHAR(18));

/* 1 */
SELECT CUSTOMERS.CNAME, CITY, ACTNO, DEPOSIT.BNAME, DEPOSIT.AMOUNT, BORROW.AMOUNT ,ADATE, LOANNO FROM
CUSTOMERS
INNER JOIN
Deposit
ON CUSTOMERS.CNAME = Deposit.CNAME
INNER JOIN
BORROW
ON CUSTOMERS.CNAME = Borrow.CNAME
WHERE CUSTOMERS.CNAME = "ANIL";

/* 2 */
SELECT customers.cname FROM
customers
INNER JOIN
Deposit
ON Deposit.CNAME = customers.CNAME
INNER JOIN
BORROW
ON Deposit.CNAME = Borrow.CNAME
WHERE customers.CITY = "NAGPUR";

/* 3 */
SELECT C.CITY FROM CUSTOMERS as C, BRANCH as B 
WHERE C.CITY=B.CITY;

/* 4 */ 
SELECT E.EMP_NAME,D.ACTNO 
FROM EMP_NEW as E,Deposit as D 
WHERE E.a_no = D.ACTNO;

/* 5 */
SELECT J.job_id,J.JOB_TITLE,E.DEPT_NO,D.CITY FROM JOB 
J,EMPLOYEE E,DEPARTMENT D WHERE J.job_id=E.emp_no AND 
E.DEPT_NO=E.DEPT_NO AND E.DEPT_NO=30; 

/* 6 */
SELECT EMP_NAME , dept_no FROM EMPLOYEE 
WHERE CITY = "RAJKOT";

/* 7 */
SELECT E.EMP_NAME as "EMPLOYEE",E.EMP_NO as "EMP #", M.name as "MANAGER",M.mngr_no as "MGR #"  
FROM EMPLOYEE E, MANAGER M
WHERE E.EMP_NO=M.mngr_no; 

/* 8 */
SELECT emp_name FROM
EMP_NEW
WHERE joinDate > (
    SELECT joinDate FROM 
    EMP_NEW
    WHERE emp_name = "SCOTT"
);


DROP DATABASE IF EXISTS c4;