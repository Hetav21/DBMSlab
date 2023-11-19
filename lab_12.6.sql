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
("109", "MINU", "POWAI", 7000.00, 20000810);

DROP TABLE DEPOSIT;


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


CREATE TABLE Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3));
INSERT INTO Employee
VALUES
(101, "Smith", 800, NULL, 20),
(102, "Snehal", 1600, 300, 25),
(103, "Adama", 1100, 0, 20),
(104, "Aman", 3000, NULL, 15),
(105, "Anita", 5000, 50000, 10),
(106, "Sneha", 2450, 24500, 10),
(107, "Anamika", 2975, NULL, 30);

CREATE TABLE  DEPOSITERS (a_no VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2), a_date DATE);
INSERT INTO DEPOSITERS 
VALUES
("101", "Anil", "andheri", 7000, 20060101),
("102", "sunil", "virar", 5000, 20060715),
("103", "jay", "villeparle", 6500, 20060312),
("104", "vijay", "andheri", 8000, 20060917),
("105", "keyur", "dadar", 7500, 20061119),
("106", "mayur", "borivali", 5500, 20061221);

/* 1 */
SELECT SUM(amount) FROM
DEPOSITERS
WHERE a_date > 19960101;

/* 2 */
SELECT SUM(AMOUNT) FROM
Customers
INNER JOIN
Deposit
ON Deposit.CNAME = Customers.CNAME
WHERE City = "NAGPUR";

/* 3 */
SELECT MAX(AMOUNT) FROM
Customers
INNER JOIN
Deposit
ON Deposit.CNAME = Customers.CNAME
WHERE City = "BOMBAY";

/* 4 */
SELECT round(SUM(emp_sal)) as Sum, round(AVG(emp_sal)) as Average,
round(MAX(emp_sal)) as Maximum, round(MIN(emp_sal)) as Minimum
FROM
Employee;

/* 5 */
SELECT round(MAX(emp_sal)) as Maximum, round(MIN(emp_sal)) as Minimum,round(MAX(emp_sal) - MIN(emp_sal)) as Difference
FROM
Employee;

/* 6 */
SELECT COUNT(ACTNO) as Employees_Hired FROM DEPOSIT
WHERE ADATE >= 19950101 AND ADATE <= 19981231;

/* 7 */
SELECT round(AVG(EMP_SAL)) FROM EMPLOYEE 
GROUP BY DEPT_NO; 

/* 8 */
SELECT DEPT_NO,SUM(EMP_SAL) FROM EMPLOYEE GROUP BY 
DEPT_NO; 

/* 9 */
SELECT AVG(EMP_SAL) FROM EMPLOYEE GROUP BY DEPT_NO HAVING 
AVG(EMP_SAL) 
> 2000; 


/* 10 */
SELECT DEPT_NO,SUM(EMP_SAL) FROM EMPLOYEE GROUP BY DEPT_NO 
HAVING SUM(EMP_SAL) > 3000 ORDER BY SUM(EMP_SAL);

/* 11 */
SELECT D.B_NAME FROM DEPOSITE D , BRANCH B WHERE D.B_NAME 
=B.BNAME AND B.CITY=’BOMBAY’ GROUP BY D.B_NAME HAVING 
SUM(D.AMMOUNT) > 5000; 


DROP DATABASE IF EXISTS c4;