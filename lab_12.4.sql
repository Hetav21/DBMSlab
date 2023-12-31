CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE Hetav_Job (job_id VARCHAR(15) ,job_title VARCHAR(30) , min_sal DECIMAL(7,2) , max_sal DECIMAL(7,2));

CREATE TABLE Hetav_Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3), job_id VARCHAR(15));

CREATE TABLE Hetav_Deposit (a_no VARCHAR(5) ,cname VARCHAR(15) ,bname VARCHAR(10) , amount DECIMAL(7,2), a_date DATE);

INSERT INTO Hetav_Employee
VALUES
(101, "Smith", 800, NULL, 20, "IT_PROG"),
(102, "Snehal", 1600, 300, 25, "MK_MGR"),
(103, "Adama", 1100, 0, 20, "FI_MGR"),
(104, "Aman", 3000, NULL, 15, "FI_ACC"),
(105, "Anita", 5000, 50000, 10, "LEC"),
(106, "Sneha", 2450, 24500, 10, "COMP_OP");
/* (107, "Anamika", 2975, NULL, 30, "LEC"); */

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

CREATE TABLE Empoyee_Job AS 
SELECT Hetav_Employee.job_id, EMP_NAME, emp_no, job_title, emp_sal, Hetav_Deposit.a_date FROM 
Hetav_Employee 
JOIN
Hetav_Job
ON Hetav_Employee.job_id = Hetav_Job.job_id
JOIN
Hetav_Deposit
on Hetav_Employee.emp_no = Hetav_Deposit.a_no;
/* Hetav_Employee.job_id, EMP_NAME, emp_no, job_title, emp_sal, Hetav_Deposit.a_date */

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
from Hetav_Employee
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
FROM Hetav_Employee;

/* 6 */
SELECT CONCAT(EMP_NAME,' earns ',round(EMP_SAL),' monthly') FROM Hetav_Employee;


/* 7 */
SELECT
emp_name AS 'Hetav_Employee Name',
a_date AS 'Hire Date',
TIMESTAMPDIFF(MONTH, a_date, CURDATE()) AS 'Months Employed',
DAYNAME(a_date) AS 'Start Day'
FROM Empoyee_Job
ORDER BY FIELD(DAYNAME(a_date), 'Monday', 'Tuesday', 'Wednesday',
'Thursday', 'Friday', 'Saturday', 'Sunday');

/* 8 */
SELECT
    emp_sal + COALESCE(emp_comm, 0) AS annual_compensation
FROM Hetav_Employee; 


DROP DATABASE IF EXISTS c4;