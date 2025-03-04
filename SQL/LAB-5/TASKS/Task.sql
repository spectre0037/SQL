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

