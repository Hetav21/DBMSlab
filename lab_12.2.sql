CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE Hetav_Job (job_id VARCHAR(15) ,job_title VARCHAR(30) , min_sal DECIMAL(7,2) , max_sal DECIMAL(7,2));

CREATE TABLE Hetav_Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3));

CREATE TABLE Hetav_Deposit (a_no VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2), a_date DATE);

CREATE TABLE Hetav_Borrow (loanno VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2));

INSERT INTO Hetav_Employee
VALUES
(101, "Smith", 800, NULL, 20),
(102, "Snehal", 1600, 300, 25),
(103, "Adama", 1100, 0, 20),
(104, "Aman", 3000, NULL, 15),
(105, "Anita", 5000, 50000, 10),
(106, "Sneha", 2450, 24500, 10),
(107, "Anamika", 2975, NULL, 30);


INSERT INTO Hetav_Job
VALUES
("IT_PROG", "Programmer", 4000, 10000),
("MK_MGR", "Marketing manager", 9000, 15000),
("FI_MGR", "Finance manager", 8200, 12000),
("FI_ACC", "Account", 4200, 9000),
("LEC", "Lecturer", 6000, 17000),
("COMP_OP", "Computer Operator", 1500, 3000);


INSERT INTO Hetav_Deposit
VALUES
("101", "Anil", "andheri", 7000, 20060101),
("102", "sunil", "virar", 5000, 20060715),
("103", "jay", "villeparle", 6500, 20060312),
("104", "vijay", "andheri", 8000, 20060917),
("105", "keyur", "dadar", 7500, 20061119),
("106", "mayur", "borivali", 5500, 20061221);

/* 1 */
SELECT * FROM Hetav_Deposit;
SELECT * FROM Hetav_Job;
SELECT * FROM Hetav_Employee;

/* 2 */
SELECT a_no, amount FROM
Hetav_Deposit
WHERE a_date BETWEEN 20060101 AND 20060725;

/* 3 */
SELECT job_id, job_title FROM
Hetav_Job
WHERE min_sal > 4000;

/* 4 */
SELECT emp_name as name, emp_sal FROM
Hetav_Employee 
WHERE dept_no = 10;

/* 5 */
SELECT emp_no, emp_name, dept_no FROM
Hetav_Employee 
WHERE dept_no BETWEEN 10 AND 20;

/* 1 */
SELECT emp_name from Hetav_Employee WHERE emp_name LIKE ('A_a%');
    
/* 2 */
SELECT emp_name, emp_no, emp_sal FROM
Hetav_Employee
WHERE emp_name LIKE ('Ani__');

/* 3 */
SELECT * FROM
Hetav_Employee
WHERE emp_comm IS NOT NULL AND emp_name LIKE ('_n___');

/* 4 */
SELECT * FROM
Hetav_Employee
WHERE emp_comm IS NULL AND emp_name LIKE ('__a%');

/* 5 */
SELECT * FROM
Hetav_Job
WHERE job_id LIKE '%#_%' ESCAPE '#';

DROP DATABASE IF EXISTS c4;