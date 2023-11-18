CREATE DATABASE IF NOT EXISTS c4;

USE c4;

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



DROP DATABASE IF EXISTS c4;