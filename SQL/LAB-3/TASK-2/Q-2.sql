
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price INT,
    quantity_in_stock INT,
    FOREIGN KEY (category_id) REFERENCES Category_table(category_id)
);
