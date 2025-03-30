-- Create EMPLOYEES table
CREATE TABLE EMPLOYEES (
    Employee_id INT PRIMARY KEY,
    Department_name VARCHAR(50),
    Employee_name VARCHAR(50),
    Salary NUMERIC
);

-- Insert data into EMPLOYEES table
INSERT INTO EMPLOYEES (Employee_id, Department_name, Employee_name, Salary) 
VALUES 
(1, 'IT', 'Alex', 123400),
(2, 'Finance', 'Marrie', 24354.67),
(3, 'Marketing', 'Quinn', 325465),
(4, 'IT', 'Redoff', 56876);

-- Create Employees_registered table
CREATE TABLE Employees_registered (
    Employee_id INT PRIMARY KEY,
    Department_name VARCHAR(50),
    Employee_name VARCHAR(50),
    Salary NUMERIC
);





-- Create trigger to insert values into Employees_registered after inserting into EMPLOYEES
CREATE OR REPLACE FUNCTION insert_into_registered()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Employees_registered (Employee_id, Department_name, Employee_name, Salary)
    VALUES (NEW.Employee_id, NEW.Department_name, NEW.Employee_name, NEW.Salary);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Create trigger on EMPLOYEES table
CREATE TRIGGER trg_insert_into_registered
AFTER INSERT ON EMPLOYEES
FOR EACH ROW
EXECUTE FUNCTION insert_into_registered();


-- Create view to merge all columns into one
CREATE VIEW employee_view AS
SELECT string_agg(Employee_id::TEXT || ', ' || Department_name || ', ' || Employee_name || ', ' || Salary::TEXT, '; ') AS merged_data
FROM EMPLOYEES;


-- Create descending indexes
CREATE INDEX idx_employee_id_desc ON EMPLOYEES (Employee_id DESC);
CREATE INDEX idx_department_name_desc ON EMPLOYEES (Department_name DESC);
CREATE INDEX idx_employee_name_desc ON EMPLOYEES (Employee_name DESC);
CREATE INDEX idx_salary_desc ON EMPLOYEES (Salary DESC);

-- Rename the indexes
ALTER INDEX idx_employee_id_desc RENAME TO idx_emp_id_desc;
ALTER INDEX idx_department_name_desc RENAME TO idx_dept_name_desc;
ALTER INDEX idx_employee_name_desc RENAME TO idx_emp_name_desc;
ALTER INDEX idx_salary_desc RENAME TO idx_sal_desc;


-- Insert a new row
INSERT INTO EMPLOYEES (Employee_id, Department_name, Employee_name, Salary)
VALUES (5, 'HR', 'Sam', 78900);



EXPLAIN ANALYZE INSERT INTO EMPLOYEES (Employee_id, Department_name, Employee_name, Salary)
VALUES (6, 'Sales', 'Lara', 50000);


EXPLAIN ANALYZE INSERT INTO EMPLOYEES (Employee_id, Department_name, Employee_name, Salary)
VALUES (7, 'Marketing', 'Joe', 75000);



EXPLAIN ANALYZE SELECT * FROM employee_view;



EXPLAIN ANALYZE SELECT * FROM employee_view;
