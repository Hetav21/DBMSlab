CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE Job (job_id VARCHAR(15) ,job_title VARCHAR(30) , min_sal DECIMAL(7,2) , max_sal DECIMAL(7,2));

CREATE TABLE Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3), job_id VARCHAR(15));

CREATE TABLE Deposit (a_no VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2), a_date DATE);

INSERT INTO Employee
VALUES
(101, "Smith", 800, NULL, 20, "IT_PROG"),
(102, "Snehal", 1600, 300, 25, "MK_MGR"),
(103, "Adama", 1100, 0, 20, "FI_MGR"),
(104, "Aman", 3000, NULL, 15, "FI_ACC"),
(105, "Anita", 5000, 50000, 10, "LEC"),
(106, "Sneha", 2450, 24500, 10, "COMP_OP");
/* (107, "Anamika", 2975, NULL, 30, "LEC"); */

INSERT INTO Job
VALUES
("IT_PROG", "Programmer", 4000, 10000),
("MK_MGR", "Marketing manager", 9000, 15000),
("FI_MGR", "Finance manager", 8200, 12000),
("FI_ACC", "Account", 4200, 9000),
("LEC", "Lecturer", 6000, 17000),
("COMP_OP", "Computer Operator", 1500, 3000);

INSERT INTO Deposit
VALUES
("101", "Anil", "andheri", 7000, 20060101),
("102", "sunil", "virar", 5000, 20060715),
("103", "jay", "villeparle", 6500, 20060312),
("104", "vijay", "andheri", 8000, 20060917),
("105", "keyur", "dadar", 7500, 20061119),
("106", "mayur", "borivali", 5500, 20061221);

CREATE TABLE Empoyee_Job AS 
SELECT * FROM 
EMPLOYEE 
JOIN
JOB
ON Employee.job_id = Job.job_id;
JOIN
Deposit
on Employee.emp_no = Deposit.a_no;
/* Employee.job_id, EMP_NAME, emp_no, job_title, emp_sal, Deposit.a_date */

SELECT * FROM Empoyee_Job;

DROP TABLE Empoyee_Job;

/* 1 */
SELECT CURRENT_DATE as Date ;

/* 2 */
SELECT EMP_NO,EMP_NAME,round(EMP_SAL),round(EMP_SAL+(EMP_SAL*15/100)) "NEW_SAL" FROM Empoyee_Job; 

/* 3 */
SELECT EMP_NO,EMP_NAME,round(EMP_SAL),round(EMP_SAL+ (EMP_SAL*15/100)) 
"NEW_SAL", round(EMP_SAL*15/100) "INCREASE" 
FROM 
Empoyee_Job;

/* 4 */
SELECT
    CONCAT(
        UPPER(SUBSTRING(emp_name, 1, 1)),
        LOWER(SUBSTRING(emp_name, 2))
    ) "Name",
    LENGTH(emp_name) "Length of Name"
from Employee
WHERE
    emp_name LIKE "J%"
    OR emp_name LIKE "A%"
    OR emp_name LIKE "M%"
ORDER BY emp_name;

/* 5 */
SELECT
    CONCAT(
        emp_name,
        " earns ",
        emp_sal,
        " monthly"
    ) AS Monthly_Income
FROM Employee;

/* 6 */


/* 7 */


/* 8 */
 SELECT
    emp_sal + COALESCE(emp_comm, 0) AS annual_compensation
FROM Employee; 


DROP DATABASE IF EXISTS c4;