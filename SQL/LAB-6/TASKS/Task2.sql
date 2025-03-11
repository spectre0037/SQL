CREATE TABLE Employees(
employee_id SERIAL PRIMARY KEY,
employee_name VARCHAR(255),
department_id INT,
hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
