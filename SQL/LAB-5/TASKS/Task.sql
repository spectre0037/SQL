-- Flights (flno, from_loc, to_loc, distance, price). //details about all the flights
CREATE TABLE Flights(
flno INT PRIMARY KEY,
from_loc VARCHAR(30),
to_loc   VARCHAR(30),
distance INT,
PRICE    INT
)

INSERT INTO flights(flno,from_loc,to_loc,distance,price)
VALUES
(222,'Perth','London',9000,50000),
(333,'Auckland','Dubai',7000,40000),
(444,'Dallas','Sydney',10000,52000),
(555,'LA','Singapore',11000,55000),
(666,'UK','Atlanta',15000,60000)


CREATE TABLE Aircraft(
aid INT PRIMARY KEY,
aname VARCHAR(30),
cruisingrange INT
)

INSERT INTO Aircraft(aid,aname,cruisingrange)
VALUES
(111,'AD Scout',1000),
(112,'Airo',15000),
(113,'Avis',9000),
(114,'Bernard',8000),
(115,'Comte',20000)


CREATE TABLE employees(
eid INT PRIMARY KEY,
ename VARCHAR(30),
salary INT
)

INSERT INTO employees(eid,ename,salary)
VALUES
(100,'Oliver',85000),
(101,'Jack',50000),
(102,'Thomas',89000),
(103,'George',10000),
(105,'James',90000),
(106,'Daneil',100000),
(107,'Noah',50000),
(108,'Joe',25000),
(109,'Pheebs',90000),
(110,'Ross',5000)


INSERT INTO certified(eid,aid)
VALUES
(100,114),
(102,113),
(105,112),
(106,115),
(107,111),
(109,112)


SELECT eid,(SELECT aname FROM aircraft WHERE aid = c.aid) aircraft_name
FROM certified c


SELECT eid,(SELECT aname FROM aircraft WHERE aid = c.aid) aircraft_name,
(SELECT ename FROM employees WHERE eid = c.eid) names
FROM certified c



SELECT ename
FROM employees
WHERE eid = (
    SELECT eid 
    FROM certified 
    WHERE aid = (
        SELECT aid 
        FROM aircraft 
        WHERE cruisingrange = (
            SELECT MAX(cruisingrange) 
            FROM aircraft
        )
    )
);




SELECT ename,salary
FROM employees
WHERE eid = (
    SELECT eid 
    FROM certified 
    WHERE aid = (
        SELECT aid 
        FROM aircraft 
        WHERE cruisingrange = (
            SELECT MAX(cruisingrange) 
            FROM aircraft
        )
    )
);



SELECT aname FROM aircraft
WHERE cruisingrange >=(
SELECT distance FROM flights WHERE from_loc = 'LA'
)