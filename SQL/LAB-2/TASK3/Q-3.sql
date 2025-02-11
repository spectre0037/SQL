CREATE TABLE SalarayTable(
Emp_Id INT,
FOREIGN KEY(Emp_Id) REFERENCES Employee_info(Emp_Id),
Salary INT
)