CREATE TABLE Employees(
employee_id SERIAL PRIMARY KEY,
employee_name VARCHAR(255),
department_id INT,
hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255),
    employee_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


INSERT INTO Employees(employee_name,department_id,hire_date)
VALUES
('John',101,'2020-01-15'),
('sarah',101,'2021-03-10'),
('mike',102,'2019-07-10'),
('emma',NULL,'2022-05-01')

INSERT INTO Projects(project_name,employee_id,start_date,end_date)
VALUES
('project_alpha',1,'2023-01-01','2023-06-30'),
('project_beta',2,'2023-02-15','2023-08-31'),
('project_gamma',1,'2023-03-01','2023-09-30')


-- Anti-Join
SELECT e.employee_id, e.employee_name, e.department_id
FROM Employees e
LEFT JOIN Projects p ON e.employee_id = p.employee_id
WHERE p.employee_id IS NULL;

--Semi-join
SELECT e.employee_id, e.employee_name, e.department_id
FROM Employees e
WHERE EXISTS (
    SELECT 1 
    FROM Projects p 
    WHERE p.employee_id = e.employee_id
);

--Self-Join
SELECT e1.employee_name AS employee1_name, 
       e2.employee_name AS employee2_name, 
       e1.department_id
FROM Employees e1
JOIN Employees e2 
    ON e1.department_id = e2.department_id 
    AND e1.employee_id < e2.employee_id
WHERE  e1.department_id IS NOT NULL;

--Natural Join
SELECT p.project_id,p.project_name,e.employee_name,p.start_date,p.end_date
FROM Projects p
NATURAL JOIN Employees e