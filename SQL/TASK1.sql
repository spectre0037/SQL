-- Creating Department Table
CREATE TABLE department (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(20) NOT NULL,
    dep_location VARCHAR(15) NOT NULL
);

-- Creating Salary Grade Table
CREATE TABLE salary_grade (
    grade INT PRIMARY KEY,
    min_salary INT NOT NULL,
    max_salary INT NOT NULL
);

-- Creating Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(25) NOT NULL,
    job_name VARCHAR(20) NOT NULL,
    manager_id INT,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    commission DECIMAL(10,2),
    dep_id INT NOT NULL,
    FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);


-- Insert data into Employees Table
INSERT INTO employees (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission) VALUES
(68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL),
(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, NULL),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00, NULL),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00, NULL),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, NULL),
(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, NULL),
(64989, 'SANDRINE', 'CLERK', 69062, '1991-05-06', 900.00, NULL),
(64389, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00),
(65241, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00),
(66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00),
(68476, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00),
(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, NULL),
(69000, 'JULIUS', 'CLERK', 67858, '1997-12-03', 1050.00, NULL),
(69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, NULL);

-- Selecting data from Department Table --

SELECT * FROM employees

-- Selecting names and job names from employees --

SELECT emp_name, job_name FROM employee;

--ALtering the column name from emp_name to NO -- 

ALTER TABLE employees 
RENAME COLUMN emp_id TO NO

--ALTERING THE DB NAME --
ALTER DATABASE lab1 RENAME TO empl;