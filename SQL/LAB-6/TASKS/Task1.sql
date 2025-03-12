CREATE TABLE Customers(
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(255),
email VARCHAR(255),
phone_number INT
)


CREATE TABLE Products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(255),
price INT,
stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT ,
    total_price INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers(customer_name,email,phone_number)
VALUES
('alice','alice@example.com',123456789),
('bob','bob@example.com',987654321),
('charlie','charlie@example.com',NULL)


INSERT INTO Products(product_name,price,stock_quantity)
VALUES
('Laptop',1000.00,10),
('Phone',600.00,20),
('tablet',300.00,15)


INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity, total_price) VALUES
    (1, 1, 1, '2025-03-11 10:00:00', 1, 1000.00), -- Alice orders 1 Laptop
    (2, 1, 2, '2025-03-11 10:15:00', 2, 1200.00), -- Alice orders 2 Phones
    (3, 2, 3, '2025-03-11 10:30:00', 1, 300.00),  -- Bob orders 1 Tablet
    (4, 3, 2, '2025-03-11 10:45:00', 3, 1800.00); -- Charlie orders 3 Phones



SELECT order_id,order_date,quantity,total_price,c.customer_name,p.product_name
FROM orders o
INNER JOIN Customers c
ON c.customer_id = o.customer_id
INNER JOIN Products p
ON p.product_id = o.product_id


SELECT c.customer_id,c.customer_name,c.email
FROM Customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE order_id IS NULL

SELECT o.customer_id,c.customer_name,o.order_id,o.order_date
FROM orders o
FULL OUTER JOIN Customers c
ON o.customer_id = c.customer_id

SELECT  Customers.customer_name,Products.product_name
FROM Customers
CROSS JOIN Products
