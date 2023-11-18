CREATE DATABASE IF NOT EXISTS c4;

USE c4;

CREATE TABLE Job (job_id VARCHAR(15) ,job_title VARCHAR(30) , min_sal DECIMAL(7,2) , max_sal DECIMAL(7,2));

CREATE TABLE Employee (emp_no DECIMAL(3) ,emp_name VARCHAR(30) ,emp_sal DECIMAL(8,2) , emp_comm DECIMAL(6, 1), dept_no DECIMAL(3), job_id VARCHAR(15));

INSERT INTO Employee
VALUES
(101, "Smith", 800, NULL, 20, "IT_PROG"),
(102, "Snehal", 1600, 300, 25, "MK_MGR"),
(103, "Adama", 1100, 0, 20, "FI_MGR"),
(104, "Aman", 3000, NULL, 15, "FI_ACC"),
(105, "Anita", 5000, 50000, 10, "LEC"),
(106, "Sneha", 2450, 24500, 10, "COMP_OP"),
(107, "Anamika", 2975, NULL, 30, "LEC");

INSERT INTO Job
VALUES
("IT_PROG", "Programmer", 4000, 10000),
("MK_MGR", "Marketing manager", 9000, 15000),
("FI_MGR", "Finance manager", 8200, 12000),
("FI_ACC", "Account", 4200, 9000),
("LEC", "Lecturer", 6000, 17000),
("COMP_OP", "Computer Operator", 1500, 3000);

CREATE TABLE Empoyee_Job AS 
SELECT emp_no, job_title, emp_sal FROM 
EMPLOYEE 
JOIN
JOB
ON Employee.job_id = Job.job_id;

SELECT * FROM Empoyee_Job;


/* 1 */
SELECT CURRENT_DATE as Date ;

/* 2 */


/* 3 */


/* 4 */


/* 5 */


/* 6 */


/* 7 */


/* 8 */



DROP DATABASE IF EXISTS c4;