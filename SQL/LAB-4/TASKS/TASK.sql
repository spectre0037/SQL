CREATE TABLE Category_table(
category_id SERIAL PRIMARY KEY,
name VARCHAR(255)
)


CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price INT,
    quantity_in_stock INT,
    FOREIGN KEY (category_id) REFERENCES Category_table(category_id)
);


-- 1.Insert data in both the tables (atleast 10 rows)
INSERT INTO Category_table (category_id, name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Furniture'),
(4, 'Food'),
(5, 'Toys'),
(6, 'phone'),
(7, 'laptop'),
(8, 'beds'),
(9, 'computer'),
(10,'accessories');


-- 1.Insert data in both the tables (atleast 10 rows)
INSERT INTO Product (product_id, name, category_id, price, quantity_in_stock) VALUES
(1, 'Laptop', 1, 1000.00, 50),
(2, 'Smartphone', 1, 500.00, 100),
(3, 'T-Shirt', 2, 15.00, 200),
(4, 'Jeans', 2, 30.00, 150),
(5, 'Sofa', 3, 300.00, 20),
(6, 'Dining Table', 3, 150.00, 10),
(7, 'Pizza', 4, 10.00, 300),
(8, 'Burger', 4, 5.00, 500),
(9, 'Doll', 5, 25.00, 100),
(10, 'Action Figure', 5, 40.00, 80);


-- 2.Alter the table and update the value of product price where product_id is 3.
UPDATE Product
SET price = 18.00
WHERE product_id = 3;

-- 3.Alter the table and add Not Null constraint on price column.
ALTER TABLE Product
ALTER COLUMN price SET NOT NULL;


-- 4.Alter the table and enforce unique constraint on product_id and name.
ALTER TABLE Product
ADD CONSTRAINT unique_product UNIQUE (product_id, name);

-- 5.Add a check constraint to ensure that the price of the product is greater than 0.
ALTER TABLE Product
ADD CONSTRAINT check_price_positive CHECK (price > 0);


-- 6.Alter the table and delete all products whose quantity_in_stock is less than or equal to 0.
DELETE FROM Product
WHERE quantity_in_stock <= 0;

--7. Retrieve the data from both the tables together using join. 
SELECT 
    product.product_id,
    product.name AS product_name,
    product.price,
    product.quantity_in_stock,
    category_table.category_id,
    category_table.name AS category_name
FROM product
JOIN category_table ON product.category_id = category_table.category_id;

-- 8.Count the number of products in each category.
SELECT category_id, COUNT(*)AS product_count
from product
GROUP BY category_id

-- 9.Add a unique constraint to category name to ensure that categories are not repeated.
ALTER TABLE category_table
ADD CONSTRAINT unique_cons UNIQUE(name)


-- 10.Drop NOT NULL constraint applied on price column.
ALTER TABLE Product
ALTER COLUMN price DROP NOT NULL;

-- 11.Drop foreign key constraint applied on category_id.
ALTER TABLE Product
DROP CONSTRAINT Product_category_id_fkey;